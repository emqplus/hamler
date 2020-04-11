module Prelude where


class Semiring a where
  add  :: a -> a -> a
  zero :: a
  mul  :: a -> a -> a
  one  :: a

infixl 6 add as +
infixl 7 mul as *


instance semiringInt :: Semiring Int where
  add = intAdd
  zero = 0
  mul = intMul
  one = 1

instance semiringNumber :: Semiring Number where
  add = numAdd
  zero = 0.0
  mul = numMul
  one = 1.0

foreign import intAdd :: Int -> Int -> Int
foreign import intMul :: Int -> Int -> Int
foreign import numAdd :: Number -> Number -> Number
foreign import numMul :: Number -> Number -> Number


class Semiring a <= Ring a where
  sub :: a -> a -> a

infixl 6 sub as -

instance ringInt :: Ring Int where
  sub = intSub

instance ringNumber :: Ring Number where
  sub = numSub

foreign import intSub :: Int -> Int -> Int
foreign import numSub :: Number -> Number -> Number

class Show a where
  show :: a -> String

class Eq a where
  eq :: a -> a -> Boolean

otherwise :: Boolean
otherwise = true

infix 4 eq as ==

infixr 3 conj as &&
infixr 2 disj as ||

conj :: Boolean -> Boolean -> Boolean
conj true true = true
conj _ _ = false

disj :: Boolean -> Boolean -> Boolean
disj false false = false
disj _ _ = true


notEq :: forall a. Eq a => a -> a -> Boolean
notEq x y = (x==y) == false

class Ord a where
  lessThan :: a -> a -> Boolean
  greaterThan :: a -> a -> Boolean
  lessThanOrEq :: a -> a -> Boolean
  greaterThanOrEq :: a -> a -> Boolean

infixl 4 lessThan as <
infixl 4 lessThanOrEq as <=
infixl 4 greaterThan as >
infixl 4 greaterThanOrEq as >=

instance eqBoolean :: Eq Boolean where
  eq = boolEq
instance eqInt :: Eq Int where
  eq = intEq
instance eqNumber :: Eq Number where
  eq = numberEq

foreign import boolEq :: Boolean -> Boolean -> Boolean
foreign import intEq :: Int -> Int -> Boolean
foreign import numberEq :: Number -> Number -> Boolean

instance ordInt :: Ord Int where
  lessThan = intLessThan
  greaterThan = intGreaterThan
  lessThanOrEq = intLessThanOrEq
  greaterThanOrEq = intGreaterThanOrEq

foreign import intLessThan :: Int -> Int -> Boolean
foreign import intGreaterThan :: Int -> Int -> Boolean
foreign import intLessThanOrEq :: Int -> Int -> Boolean
foreign import intGreaterThanOrEq :: Int -> Int -> Boolean




instance ordNumber :: Ord Number where
  lessThan = numLessThan
  greaterThan = numGreaterThan
  lessThanOrEq = numLessThanOrEq
  greaterThanOrEq = numGreaterThanOrEq

foreign import numLessThan :: Number -> Number -> Boolean
foreign import numGreaterThan :: Number -> Number -> Boolean
foreign import numLessThanOrEq :: Number -> Number -> Boolean
foreign import numGreaterThanOrEq :: Number -> Number -> Boolean



flip :: forall a b c. (a -> b -> c) -> b -> a -> c
flip f b a = f a b


const :: forall a b. a -> b -> a
const a _ = a

apply :: forall a b. (a -> b) -> a -> b
apply f x = f x

infixr 0 apply as $


identity :: forall a .a -> a
identity x = x

