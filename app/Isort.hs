
module Main where

import Test.FitSpec

-- Check whether a list is sorted
isSorted :: [Int] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (x:y:xs) = x <= y && isSorted (y:xs)

-- Check whether every element occurs the same number of times
count :: Int -> [Int] -> Int
count x = length . filter (== x)

-- Properties of a sorting function
properties :: ([Int] -> [Int]) -> [Property]
properties f =
  [ property $ \xs ->
      isSorted (f xs)

  , property $ \xs ->
      length (f xs) == length xs

  , property $ \x xs ->
      count x (f xs) == count x xs

  , property $ \x xs ->
      elem x (f xs) == elem x xs
  ]

-- Insertion sort
isort :: [Int] -> [Int]
isort [] = []
isort (x:xs) = insert x (isort xs)

-- Insert function
insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys)
  | x <= y    = x : y : ys
  | otherwise = y : insert x ys

main :: IO ()
main =
  mainWith args
    { names = ["isort xs"]
    , nMutants = 4000
    , nTests = 4000
    , timeout = 0
    }
    (isort :: [Int] -> [Int])
    properties
