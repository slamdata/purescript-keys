# purescript-keys
A data type for representing and printing keyboard keys.

## Cross platform
OS X uses the `Cmd` key instead of `Ctrl` for most keyboard shortcuts. This
package allows you to define keyboard shortcuts once and work with them accross
platforms. It does this by abstracting over `Cmd` and `Ctrl` with `Meta`.

`Control.Monad.Eff.Key` exports functions which automatically use the correct
implementation for the detected platform.

## Example
An example is availble [here](Example.purs).

## Combinations
You can use any `Foldable` to represent key collections. We recommend `Set` from [purescript-sets](https://github.com/purescript/purescript-sets).

## Module documentation
* [Data.Key](docs/Data/Key.md)
* [Control.Monad.Eff.Key](docs/Control/Monad/Eff/Key.md)

