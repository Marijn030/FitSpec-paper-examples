module Main where

import Data.List (sort)
import Test.FitSpec

ordered :: Ord a => [a] -> Bool
ordered (x:y:xs) = x <= y && ordered (y:xs)
ordered _        = True

count :: Eq a => a -> [a] -> Int
count x = length . filter (== x)

properties :: ([Int] -> [Int]) -> [Property]
properties f =
  [ property $ \xs ->
      ordered (f xs)
  , property $ \xs ->
      length (f xs) == length xs
  , property $ \x xs ->
      elem x (f xs) == elem x xs
  , property $ \x xs ->
      count x (f xs) == count x xs
  ]

main :: IO ()
main =
  mainWith args
    { names = ["sort xs"]
    , nMutants = 4000
    , nTests = 4000
    , timeout = 0
    }
    (sort :: [Int] -> [Int])
    properties
