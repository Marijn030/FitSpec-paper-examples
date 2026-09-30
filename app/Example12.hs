module Main where

addMutant1 :: Int -> Int -> Int
addMutant1 x y =
  case (x, y) of
    (0, 0) -> 1
    _      -> x + y

addMutant2 :: Int -> Int -> Int
addMutant2 x y =
  case (x, y) of
    (0, 1) -> 0
    _      -> x + y

addMutant3 :: Int -> Int -> Int
addMutant3 x y =
  case (x, y) of
    (1, 0) -> 0
    _      -> x + y

main :: IO ()
main = do
  print (addMutant1 0 0, addMutant1 2 3)
  print (addMutant2 0 1, addMutant2 2 3)
  print (addMutant3 1 0, addMutant3 2 3)
