
module Main where

import Test.FitSpec

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

-- Properties obtained from QuickSpec laws
properties :: ([Int] -> [Int]) -> [Property]
properties f =
  [
    -- Property 1: Sorting an empty list
    property $
      f [] == []

    -- Property 2: Sorting twice gives the same result
  , property $ \xs ->
      f (f xs) == f xs

    -- Property 3: Inserting before sorting
  , property $ \x xs ->
      f (insert x xs) == f (x : xs)

    -- Property 4: Inserting into an already sorted list
  , property $ \x xs ->
      insert x (f xs) == f (x : xs)
  ]

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
