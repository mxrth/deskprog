module Blueprint where
import Prelude
import Test.QuickCheck (verboseCheck, NonNegative(..))

{-
 - Geben Sie in Haskell definierte unendliche Listen an fuer:
 -}

-- 1. die Menge aller ganzen Zahlen,
ints :: [Integer]
ints = 0 : ints' 1

-- menge der ganzen zahlen mit betrag >= n
ints' :: Integer -> [Integer]
ints' n = n : (-n) : (ints' $ n + 1)

-- 2. die Menge aller Paare von natuerlichen Zahlen,
-- cantor lässt grüßen
pairs :: [(Integer,Integer)]
pairs = pairs' 0

pairs' n = [(n-a, a) | a <- [0..n]] ++ (pairs' (n+1)) 

-- 3. die Menge aller Tripel von zwei natuerlichen und einer ganzen Zahl.
triples :: [(Integer,Integer,Integer)]
triples = undefined 

triples' n = [(n, n-a, a) | a <- [0..n]] ++ triples' (n+1)



 
 -- Es sollen also die den wie folgt formulierbaren Tests entsprechenden
 -- allgemeinen Aussagen gelten (und keine der Listen doppelte oder
 -- ueberfluessige Elemente enthalten):
 -- 
test1 = verboseCheck $ \n -> elem n ints
 
test2 = verboseCheck $ \(NonNegative n, NonNegative m) -> elem (n,m) pairs
  
test3 = verboseCheck $ \(NonNegative n, NonNegative m, p) -> elem (n,m,p) triples
 

