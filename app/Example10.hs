module Main where

notMutant1 :: Bool -> Bool
notMutant1 p =
  case p of
    False -> False
    _     -> not p

notMutant2 :: Bool -> Bool
notMutant2 p =
  case p of
    True -> True
    _    -> not p

notMutant3 :: Bool -> Bool
notMutant3 p =
  case p of
    False -> False
    True  -> True

main :: IO ()
main = do
  print (notMutant1 False, notMutant1 True)
  print (notMutant2 False, notMutant2 True)
  print (notMutant3 False, notMutant3 True)
