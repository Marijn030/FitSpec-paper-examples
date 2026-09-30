module Main where

import Test.FitSpec

data Tree a
  = E
  | N a (Tree a) (Tree a)
  deriving (Eq, Show)

instance Listable a => Listable (Tree a) where
  tiers = cons0 E \/ cons3 N

main :: IO ()
main =
  print (take 4 (tiers :: [[Tree Int]]))
