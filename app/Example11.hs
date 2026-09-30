module Main where

newtype Nat = Nat Int
  deriving (Eq, Ord, Show)

instance Num Nat where
  Nat x + Nat y = Nat (x + y)
  Nat x - Nat y = Nat (x - y)
  Nat x * Nat y = Nat (x * y)
  negate (Nat x) = Nat (negate x)
  abs (Nat x) = Nat (abs x)
  signum (Nat x) = Nat (signum x)
  fromInteger n = Nat (fromInteger n)

idMutant1 :: Nat -> Nat
idMutant1 x =
  case x of
    0 -> 1
    _ -> id x

idMutant2 :: Nat -> Nat
idMutant2 x =
  case x of
    1 -> 0
    _ -> id x

idMutant3 :: Nat -> Nat
idMutant3 x =
  case x of
    0 -> 2
    _ -> id x

idMutant4 :: Nat -> Nat
idMutant4 x =
  case x of
    2 -> 0
    _ -> id x

main :: IO ()
main = do
  print (idMutant1 (Nat 0), idMutant1 (Nat 3))
  print (idMutant2 (Nat 1), idMutant2 (Nat 3))
  print (idMutant3 (Nat 0), idMutant3 (Nat 3))
  print (idMutant4 (Nat 2), idMutant4 (Nat 3))
