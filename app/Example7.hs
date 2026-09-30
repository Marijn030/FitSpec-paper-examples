module Main where

import Test.FitSpec

newtype MyNat = MyNat Int
  deriving (Eq, Ord, Show)

instance Num MyNat where
  MyNat x + MyNat y = MyNat (x + y)
  MyNat x - MyNat y = MyNat (x - y)
  MyNat x * MyNat y = MyNat (x * y)
  negate (MyNat x) = MyNat (negate x)
  abs (MyNat x) = MyNat (abs x)
  signum (MyNat x) = MyNat (signum x)
  fromInteger n = MyNat (fromInteger n)

instance Listable MyNat where
  tiers = cons0 0 \/ cons1 (+1)

main :: IO ()
main =
  print (take 6 (tiers :: [[MyNat]]))
