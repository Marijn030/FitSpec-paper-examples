module Main where

import Test.FitSpec

properties :: (Bool -> Bool, Bool -> Bool -> Bool) -> [Property]
properties (not', and') =
  [ property $ \p ->
      not' (not' p) == p
  , property $ \p q ->
      and' p q == and' q p
  , property $ \p ->
      and' p p == p
  , property $ \p ->
      and' p False == False
  , property $ \p q r ->
      and' p (and' q r) == and' (and' p q) r
  , property $ \p ->
      and' p (not' p) == False
  , property $ \p ->
      and' p (not' False) == p
  ]

main :: IO ()
main =
  mainWith args
    { names = ["not", "&&"]
    , nMutants = 63
    , nTests = 100
    }
    (not, (&&))
    properties
