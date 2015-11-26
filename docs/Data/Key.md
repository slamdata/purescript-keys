## Module Data.Key

#### `Platform`

``` purescript
data Platform
  = Mac
  | Other
```

#### `Key`

``` purescript
data Key
```

##### Instances
``` purescript
Eq Key
Ord Key
Show Key
```

#### `meta`

``` purescript
meta :: Key
```

#### `alt`

``` purescript
alt :: Key
```

#### `shift`

``` purescript
shift :: Key
```

#### `character`

``` purescript
character :: Char -> Key
```

#### `enter`

``` purescript
enter :: Key
```

#### `fromKeyCode`

``` purescript
fromKeyCode :: Platform -> Int -> Key
```

#### `print`

``` purescript
print :: Platform -> Key -> String
```

#### `printCombination`

``` purescript
printCombination :: forall f. (Foldable f) => Platform -> f Key -> String
```


