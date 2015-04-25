module Blueprint where
import Prelude
import Data.List
import Data.Maybe
import qualified Data.Array as Array  -- Diese Module/Datenstrukturen koennen genutzt werden,
import qualified Data.Map as Map      -- muessen aber natuerlich nicht - wie alle Imports.
import Test.QuickCheck

{- Stellen Sie sich vor, Sie wollen das Spiel TicTacToe implementieren.
 - 
 -   http://de.wikipedia.org/wiki/Tic_Tac_Toe
 - 
 - Zunaechst soll es nur um die Repraesentation des Spielfelds und
 - Operationen darauf gehen.
 - 
 - Vorgegeben sind die folgenden Typdefinitionen:
 -}

data Row    = A | B | C  deriving (Show, Read, Eq, Ord, Enum, Bounded, Array.Ix)
data Column = X | Y | Z  deriving (Show, Read, Eq, Ord, Enum, Bounded, Array.Ix)

type Pos = (Row, Column)

{- Definieren Sie zunaechst eigene Typen 'Player' und 'Field' zur
 - Unterscheidung der beiden teilnehmenden Spieler sowie Repraesentation
 - einer konkreten Spielfeldsituation:
 -}



{- Insbesondere soll es vom Typ 'Player' zwei Konstanten geben: -}

xPlayer :: Player
xPlayer = undefined

oPlayer :: Player
oPlayer = undefined

{- Sorgen Sie ausserdem dafuer, dass 'Player' Instanz von 'Eq' ist, und
 - dass 'Field' Instanz von 'Show' ist, mit einer moeglichst sinnvollen
 - und ansprechenden "Ausgabe" des Spielfelds als String.
 -}


{- Schreiben Sie nun Definitionen wie folgend gefordert: -}

-- Repraesentation des leeren Spielfelds
initialField :: Field
initialField = undefined

-- Lookup einer Position im Feld:
--   field ! pos = Nothing      ==>  die Position ist noch nicht besetzt
--   field ! pos = Just player  ==>  die Position wurde schon von dem
--                                   zurueckgelieferten Spieler besetzt
infixl 9 !
(!) ::  Field -> Pos -> Maybe Player
(!) = undefined

-- freie Positionen auf gegebenem Spielfeld (keine Position doppelt aufgezaehlt)
possibleMoves :: Field -> [Pos]
possibleMoves = undefined

-- Update des Spielfeldes mit Zug eines der beiden Spieler, wobei Sie annehmen
-- duerfen, dass nur tatsaechlich legale Zuege (entsprechend possibleMoves)
-- uebergeben werden
makeMove :: Player -> Pos -> Field -> Field
makeMove = undefined

-- Test darauf, ob das Spiel beendet ist, und mit welchem Ergebnis:
--   endPosition field = Nothing       ==>  Spiel kann noch fortgesetzt werden
--   endPosition field = Just Nothing  ==>  Spiel ist beendet, mit Unentschieden
--   endPosition field = Just (Just player), wobei entweder player == xPlayer 
--                                                 oder     player == oPlayer
--                                     ==>  Spiel ist beendet, der zureckgelieferte
--                                          Spieler hat gewonnen
-- (Sie duerfen annehmen, dass nur echt im Spielverlauf erreichbare Situationen
--  ueberprueft werden, insbesondere keine Spielfelder, in denen beide Spieler
--  je alle drei Positionen in einer Reihe, Spalte oder Hauptdiagonale besetzt
--  haben.)
endPosition :: Field -> Maybe (Maybe Player)
endPosition = undefined

{- Einige mit QuickCheck ausfuehrbare Tests: -}

test1 pos = isNothing (initialField ! pos)

test2 pos = pos `elem` possibleMoves initialField

test3 = isNothing (endPosition initialField)

{- Folgende Typklasseninstanzen werden nur benoetigt, um QuickCheck auf
 - die Spruenge zu helfen:
 -}

instance Arbitrary Row where
  arbitrary = elements [minBound .. maxBound]

instance Arbitrary Column where
  arbitrary = elements [minBound .. maxBound]
