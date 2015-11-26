module Control.Monad.Eff.Key where

import Control.Monad.Eff.Class (MonadEff)
import Control.Monad.Eff (Eff())
import Data.Foldable (Foldable)
import Data.Key as Key
import Prelude
import DOM (DOM())
import DOM.HTML.Types (Window())
import DOM.HTML (window)
import Data.String (take)

foreign import data Navigator :: *

foreign import navigator :: forall eff. Window -> Eff (dom :: DOM | eff) Navigator

foreign import platform :: forall eff. Navigator -> Eff (dom :: DOM | eff) String

getPlatform :: forall eff. Eff (dom :: DOM | eff) String
getPlatform = window >>= navigator >>= platform

parsePlatform :: String -> Key.Platform
parsePlatform = take 3 >>> parse
  where
  parse "Mac" = Key.Mac
  parse _ = Key.Other

fromKeyCode :: forall eff. Int -> Eff (dom :: DOM | eff) Key.Key
fromKeyCode i = getPlatform >>= (parsePlatform >>> flip Key.fromKeyCode i >>> pure)

print :: forall eff. Key.Key -> Eff (dom :: DOM | eff) String
print key = getPlatform >>= (parsePlatform >>> flip Key.print key >>> pure)

printCombination :: forall eff f. (Foldable f) => f Key.Key -> Eff (dom :: DOM | eff) String
printCombination comb = getPlatform >>= (parsePlatform >>> flip Key.printCombination comb >>> pure)

