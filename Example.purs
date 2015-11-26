module Main where

import Control.Monad.Eff.Console (CONSOLE(), log)
import Prelude
import Control.Monad.Eff.Key (printCombination)
import Control.Monad.Eff (Eff())
import Data.Key (Key(), enter, meta)
import Data.Set (Set(), singleton)
import DOM (DOM())

combination :: Set Key
combination = singleton enter ++ singleton meta

main :: Eff (console :: CONSOLE, dom :: DOM) Unit
main = printCombination combination >>= log

