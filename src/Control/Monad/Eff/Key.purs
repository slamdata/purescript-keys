module Control.Monad.Eff.Key (getPlatform, fromKeyCode, print, printCombination) where

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

getPlatformString :: forall eff. Eff (dom :: DOM | eff) String
getPlatformString = window >>= navigator >>= platform

parsePlatform :: String -> Key.Platform
parsePlatform = take 3 >>> parse
  where
  parse "Mac" = Key.Mac
  parse _ = Key.Other

getPlatform :: forall eff. Eff (dom :: DOM | eff) Key.Platform
getPlatform = parsePlatform <$> getPlatformString

fromKeyCode :: forall eff. Int -> Eff (dom :: DOM | eff) Key.Key
fromKeyCode i = flip Key.fromKeyCode i <$> getPlatform

print :: forall eff. Key.Key -> Eff (dom :: DOM | eff) String
print key = flip Key.print key <$> getPlatform

printCombination :: forall eff f. (Foldable f) => f Key.Key -> Eff (dom :: DOM | eff) String
printCombination comb = flip Key.printCombination comb <$> getPlatform

