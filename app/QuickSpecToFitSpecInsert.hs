
module Main where

import Test.FitSpec

-- Insert function
insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys)
  | x <= y    = x : y : ys
  | otherwise = y : insert x ys

-- Properties obtained from QuickSpec
properties :: (Int -> [Int] -> [Int]) -> [Property]
properties f =
  [
    -- Empty insertion
    property $ \x ->
      f x [] == [x]

    -- Inserting an element at the beginning
  , property $ \x ->
      f x (x : []) == [x, x]

    -- Inserting two elements in either order
  , property $ \x y xs ->
      f x (f y xs) == f y (f x xs)
  ]

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
