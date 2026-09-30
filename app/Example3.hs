module Main where

import Test.FitSpec

properties :: (Bool -> Bool) -> [Property]
properties f =
  [ property $ f True == False
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
