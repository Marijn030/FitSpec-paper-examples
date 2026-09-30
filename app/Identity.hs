{-# LANGUAGE TemplateHaskell #-}
module Main where

import Test.FitSpec
import Test.FitSpec.Derive (deriveMutable)

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

$(deriveMutable ''MyNat)

properties :: (MyNat -> MyNat) -> [Property]
properties f =
  [ property $ \x -> f x == x
  ]

main :: IO ()
main =
  mainWith args
    { names = ["id"]
    , nMutants = 100
    , nTests = 100
    }
    (id :: MyNat -> MyNat)
    properties
