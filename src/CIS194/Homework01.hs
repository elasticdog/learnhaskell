module CIS194.Homework01 where

-- https://www.seas.upenn.edu/~cis194/spring13/hw/01-intro.pdf

-- VALIDATING CREDIT CARD NUMBERS

-- | Convert positive Integers to a list of digits.
--
-- Examples:
--
-- >>> toDigits 1234
-- [1,2,3,4]
-- >>> toDigits 0
-- []
-- >>> toDigits (-17)
-- []
toDigits :: Integer -> [Integer]
toDigits n = reverse (toDigitsRev n)

-- | Convert positive Integers to a list of digits in reverse order.
--
-- Examples:
--
-- >>> toDigitsRev 1234
-- [4,3,2,1]
toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n <= 0    = []
  | otherwise = remainder : toDigitsRev quotient
  where
    (quotient, remainder) = n `divMod` 10

-- | Double every other number beginning from the right.
--
-- Examples:
--
-- >>> doubleEveryOther [8,7,6,5]
-- [16,7,12,5]
-- >>> doubleEveryOther [1,2,3]
-- [1,4,3]
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther xs = reverse (doubleEveryOther' (reverse xs))
  where
    doubleEveryOther' []       = []
    doubleEveryOther' (x:[])   = [x]
    doubleEveryOther' (x:y:zs) = x : 2 * y : doubleEveryOther' zs

-- | Calculate the sum of all digits.
--
-- Examples:
--
-- >>> sumDigits [16,7,12,5]
-- 22
sumDigits :: [Integer] -> Integer
sumDigits []     = 0
sumDigits (x:xs) = sum (toDigits x) + sumDigits xs

-- | Indicates whether an Integer could be a valid credit card number.
--
-- Examples:
--
-- >>> validate 4012888888881881
-- True
-- >>> validate 4012888888881882
-- False
validate :: Integer -> Bool
validate n
  | checksum `rem` 10 == 0 = True
  | otherwise              = False
  where
    checksum = sumDigits $ doubleEveryOther $ toDigits n


-- THE TOWERS OF HANOI

type Peg = String
type Move = (Peg, Peg)

-- | Given the number of discs and names for the three pegs, returns a list of
-- moves to be performed to move the stack of discs from the first peg to the
-- second.
--
-- Examples:
--
-- >>> hanoi 2 "a" "b" "c"
-- [("a","c"),("a","b"),("c","b")]
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _         = []
hanoi n from to using =
  (hanoi (n - 1) from using to) ++ [(from, to)] ++ (hanoi (n - 1) using to from)

-- Optionally implement the Frame–Stewart algorithm for four pegs
-- See also: http://www.ijcai.org/papers07/Papers/IJCAI07-374.pdf
