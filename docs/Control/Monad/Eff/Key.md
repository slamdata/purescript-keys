## Module Control.Monad.Eff.Key

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


