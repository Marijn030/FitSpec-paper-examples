module Main where

import Test.FitSpec

-- The paper's Example 8 instance:
-- instance Listable a => Listable [a] where
--   tiers = cons0 [] \/ cons2 (:)
--
-- FitSpec already supplies the standard list instance, so this standalone
-- executable expresses the same tier construction without defining a
-- duplicate instance.
paperTiers :: Listable a => [[[a]]]
paperTiers = cons0 ([] :: [a]) \/ cons2 ((:) :: a -> [a] -> [a])

main :: IO ()
main = print (take 5 (paperTiers :: [[[Int]]]))
