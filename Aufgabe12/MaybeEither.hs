module Blueprint where
import Prelude

{- Informieren Sie sich auf http://www.haskell.org/hoogle/ ueber die
 - Typkonstruktoren Maybe und Either.
 - 
 - Geben Sie dann konkrete, verschiedene Werte mit folgenden Typen an:
 -}

wert1 :: Either ([Int],Bool) Bool
wert1 = Right True

wert2 :: Either ([Int],Bool) Bool
wert2 = Left ([1,2], False)

wert3 :: Either ([Int],Bool) Bool
wert3 = Right False

wert4 :: (Maybe Bool, Either (Maybe Bool, Int) (Int, Maybe Int))
wert4 = (Just True, Left (Nothing, 2))

wert5 :: Maybe (Either (Int,Maybe Int) (Maybe Bool, Int))
wert5 = Nothing

wert6 :: Maybe (Either (Int,Maybe Int) (Maybe Bool, Int))
wert6 = Just (Left (2, Just 3))

