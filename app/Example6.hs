module Main where

import Test.FitSpec

-- The paper's Example 6 instance:
-- instance Listable Bool where
--   tiers = cons0 False \/ cons0 True
--
-- FitSpec already supplies the standard Bool instance, so this standalone
-- executable expresses the same tier construction without defining a
-- duplicate instance.
paperTiers :: [[Bool]]
paperTiers = cons0 False \/ cons0 True

main :: IO ()
main = print (take 1 paperTiers)
