
module Main where

import Test.QuickCheck

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

-- Property 1
prop_emptySort :: Bool
prop_emptySort = isort [] == []

-- Property 2
prop_emptyInsert :: Int -> Bool
prop_emptyInsert x = insert x [] == [x]

-- Property 3
prop_sortTwice :: [Int] -> Bool
prop_sortTwice xs = isort (isort xs) == isort xs

-- Property 4
prop_insertBeforeSort :: Int -> [Int] -> Bool
prop_insertBeforeSort x xs =
  isort (insert x xs) == isort (x : xs)

-- Property 5
prop_insertSorted :: Int -> [Int] -> Bool
prop_insertSorted x xs =
  insert x (isort xs) == isort (x : xs)

-- Property 6
prop_insertBeginning :: Int -> [Int] -> Bool
prop_insertBeginning x xs =
  insert x (x : xs) == x : x : xs

-- Property 7
prop_insertCommutative :: Int -> Int -> [Int] -> Bool
prop_insertCommutative x y xs =
  insert x (insert y xs) == insert y (insert x xs)

main :: IO ()
main = do
  quickCheck prop_emptySort
  quickCheck prop_emptyInsert
  quickCheck prop_sortTwice
  quickCheck prop_insertBeforeSort
  quickCheck prop_insertSorted
  quickCheck prop_insertBeginning
  quickCheck prop_insertCommutative
