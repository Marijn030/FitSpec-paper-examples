module Main where

import QuickSpec

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
  quickSpec [
      con "isort" (isort :: [Int] -> [Int])
    , con "insert" (insert :: Int -> [Int] -> [Int])
    , con "[]" ([] :: [Int])
    , con ":" ((:) :: Int -> [Int] -> [Int])
    ]
