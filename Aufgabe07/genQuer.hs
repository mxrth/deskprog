module Blueprint where
import Prelude

--import Test.QuickCheck
--import Test.QuickCheck.Modifiers()

{-
 - Eine Block-Quersumme fasst jeweils mehrere Ziffern vor Summation
 - zusammen, bei der letzten Stelle beginnend. Zum Beispiel ist die
 - 3-Block-Quersumme von 1234567 die Zahl 1 + 234 + 567 = 802.
 - Eine alternierende Quersumme wechselt Addition und Subtraktion
 - ab, und zwar so, dass insgesamt keine negative Zahl entsteht.
 - Zum Beispiel ist die alternierende 3-Block-Quersumme von 1234567
 - die Zahl 1 - 234 + 567 = 334, waehrend sich die alternierende
 - 2-Block-Quersumme von 54321 als -5 + 43 - 21 = 17 ergibt.
 - 
 - Schreiben Sie eine Funktion, die so generalisierte Quersummen
 - von natuerlichen Zahlen berechnet. Die Funktion wird gesteuert
 - ueber Argumente fuer die Blocklaenge und (als Boolescher Wert)
 - fuer die Angabe, ob oder ob nicht alternierend gerechnet wird.
 - Also zum Beispiel:
 - 
 -   genQuer 3 False 1234567 = 802
 -   genQuer 3 True  1234567 = 334
 -   genQuer 2 True  54321   = 17
 -}

data Method = Add | Sub

--Assumption: n >= 0, else this function does not terminate
genQuer :: Integer -> Bool -> Integer -> Integer
genQuer group False n = sum $ digitGroups group n
genQuer group True  n = altSum $ digitGroups group n


altSum :: [Integer] -> Integer
altSum = abs . altSum' Add

altSum' :: Method -> [Integer] -> Integer
altSum' _      []  = 0
altSum' Add (x:xs) = altSum' Sub xs + x
altSum' Sub (x:xs) = altSum' Add xs - x

digitGroups :: Integer -> Integer -> [Integer]
digitGroups _     0 = []
digitGroups group n = (n `mod` divisor) : digitGroups group (n `div` divisor)
                        where divisor = 10^group
{-
--Some tests

--prop_unitTests = genQuer 3 False 1234567 == 802 && genQuer 3 True 1234567 == 334 && genQuer 2 True 54321 == 17

--normale Quersumme erhält rest mod 3 und 9
prop_querMod3 (NonNegative n) = genQuer 1 False n `mod` 3 == n `mod` 3

--alterniende erhält rest mod 11
--da unsere quersumme immer positiv ist muss dieser fall besonders behandelt werden
prop_altMod (NonNegative n) = altMod == n `mod` 11 || 11 - altMod  == n `mod` 11
                                where altMod = genQuer 1 True n `mod` 11

prop_groupedAltMod (NonNegative n) (NonZero (NonNegative group) ) = (altMod == (n `mod` modulus) ) || ((modulus - altMod)  == n `mod` modulus)
                                                                    where altMod = genQuer group True n `mod` modulus
                                                                          modulus = 10^group + 1
-}








