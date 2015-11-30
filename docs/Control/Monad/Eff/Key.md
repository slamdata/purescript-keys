## Module Control.Monad.Eff.Key

#### `getPlatform`

``` purescript
getPlatform :: forall eff. Eff (dom :: DOM | eff) Platform
```

#### `fromKeyCode`

``` purescript
fromKeyCode :: forall eff. Int -> Eff (dom :: DOM | eff) Key
```

#### `print`

``` purescript
print :: forall eff. Key -> Eff (dom :: DOM | eff) String
```

#### `printCombination`

``` purescript
printCombination :: forall eff f. (Foldable f) => f Key -> Eff (dom :: DOM | eff) String
```


