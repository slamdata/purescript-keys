{-
Copyright 2015 SlamData, Inc.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-}

module Data.Key
  ( Key()
  , Platform(..)
  , alt
  , character
  , enter
  , fromKeyCode
  , meta
  , print
  , printCombination
  , shift
  ) where

import Prelude
import Data.Char (fromCharCode, toUpper)
import Data.Array (singleton, nub, sort)
import Data.String (fromChar, joinWith)
import Data.Foldable (Foldable, foldMap)

data Platform = Mac | Other

data Key = Meta | Alt | Shift | Character Char | Enter

meta :: Key
meta = Meta

alt :: Key
alt = Alt

shift :: Key
shift = Shift

character :: Char -> Key
character = Character <<< toUpper

enter :: Key
enter = Enter

fromKeyCodeOther :: Int -> Key
fromKeyCodeOther 13 = Enter
fromKeyCodeOther 16 = Shift
fromKeyCodeOther 17 = Meta -- Ctrl
fromKeyCodeOther 18 = Alt
fromKeyCodeOther i = Character $ fromCharCode i

fromKeyCodeMac :: Int -> Key
fromKeyCodeMac 13 = Enter
fromKeyCodeMac 16 = Shift
fromKeyCodeMac 91 = Meta -- Left cmd
fromKeyCodeMac 93 = Meta -- Right cmd
fromKeyCodeMac 18 = Alt
fromKeyCodeMac i = Character $ fromCharCode i

fromKeyCode :: Platform -> Int -> Key
fromKeyCode Mac = fromKeyCodeMac
fromKeyCode _ = fromKeyCodeOther

printOther :: Key -> String
printOther Meta = "Ctrl"
printOther Alt = "Alt"
printOther Shift = "Shift"
printOther (Character c) = fromChar c
printOther Enter = "Enter"

printMac :: Key -> String
printMac Meta = fromChar $ fromCharCode 8984
printMac Alt = fromChar $ fromCharCode 8997
printMac Shift = fromChar $ fromCharCode 8679
printMac (Character c) = fromChar c
printMac Enter = "Enter"

print :: Platform -> Key -> String
print Mac = printMac
print _ = printOther

separator :: Platform -> String
separator Mac = ""
separator _ = "+"

toArray :: forall f a. (Foldable f) => f a -> Array a
toArray = foldMap singleton

printCombination :: forall f. (Foldable f) => Platform -> f Key -> String
printCombination p = toArray >>> sort >>> nub >>> map (print p) >>> joinWith (separator p)

instance eqKey :: Eq Key where
  eq Meta Meta = true
  eq Alt Alt = true
  eq Shift Shift = true
  eq (Character x) (Character y) = x == y
  eq Enter Enter = true
  eq _ _ = false

instance ordKey :: Ord Key where
  compare Meta Meta = EQ
  compare Meta _ = LT
  compare _ Meta = GT
  compare Alt Alt = EQ
  compare Alt _ = EQ
  compare _ Alt = GT
  compare Shift Shift = EQ
  compare Shift _ = LT
  compare _ Shift = GT
  compare (Character x) (Character y) = compare x y
  compare (Character _) _ = LT
  compare _ (Character _) = GT
  compare Enter Enter = EQ

instance showKey :: Show Key where
  show Meta = "Meta"
  show Alt = "Alt"
  show Shift = "Shift"
  show (Character l) = "Character (" ++ show l ++ ")"
  show Enter = "Enter"

