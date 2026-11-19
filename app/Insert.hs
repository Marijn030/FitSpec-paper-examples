module Main where

import Test.FitSpec

-- Check whether a list is sorted
isSorted :: [Int] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (x:y:xs) = x <= y && isSorted (y:xs)

-- Logical implication
implies :: Bool -> Bool -> Bool
implies x y = not x || y

-- Properties of insert
properties :: (Int -> [Int] -> [Int]) -> [Property]
properties f =
  [ property $ \x xs ->
      length (f x xs) == length xs + 1

  , property $ \x xs ->
      x `elem` f x xs

  , property $ \x xs ->
      isSorted xs `implies` isSorted (f x xs)

  , property $ \x xs ->
      count x (f x xs) == count x xs + 1

  , property $ \x xs ->
      all (\y -> count y (f x xs) >= count y xs) xs

  , property $ \x xs ->
    isSubsequenceOf xs (f x xs)
  ]

-- Count occurrences
count :: Int -> [Int] -> Int
count x = length . filter (== x)

-- Insert function
insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys)
  | x <= y    = x : y : ys
  | otherwise = y : insert x ys

isSubsequenceOf :: Eq a => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf (x:xs) (y:ys)
  | x == y    = isSubsequenceOf xs ys
  | otherwise = isSubsequenceOf (x:xs) ys

main :: IO ()
main =
  mainWith args
    { names = ["insert x xs"]
    , nMutants = 4000
    , nTests = 4000
    , timeout = 0
    }
    (insert :: Int -> [Int] -> [Int])
    properties
