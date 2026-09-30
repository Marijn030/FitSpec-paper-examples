module Main where

import Test.FitSpec

properties :: (Bool -> Bool) -> [Property]
properties f =
  [ property $ \p -> f (f p) == p
  , property $ f True == False
  , property $ f False == True
  ]

main :: IO ()
main =
  mainWith args
    { names = ["not"]
    , nMutants = 63
    , nTests = 100
    }
    not
    properties
