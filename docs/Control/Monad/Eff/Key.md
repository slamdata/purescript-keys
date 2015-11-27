## Module Control.Monad.Eff.Key

#### `Navigator`

``` purescript
data Navigator :: *
```

#### `navigator`

``` purescript
navigator :: forall eff. Window -> Eff (dom :: DOM | eff) Navigator
```

#### `platform`

``` purescript
platform :: forall eff. Navigator -> Eff (dom :: DOM | eff) String
```

#### `getPlatform`

``` purescript
getPlatform :: forall eff. Eff (dom :: DOM | eff) String
```

#### `parsePlatform`

``` purescript
parsePlatform :: String -> Platform
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


