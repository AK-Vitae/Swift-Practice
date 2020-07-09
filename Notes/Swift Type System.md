#  Types

## Struct and Class

|                       Struct                       |               Similarities Of Struct and Class               |                            Class                             |
| :------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                     Value Type                     |                Stored vars: stored in memory                 |                       Reference Types                        |
|           Copied when passed or assigned           | Computed vars: values that are a result of evaluating some code |                  Passed around via pointers                  |
|                   Copy on write                    |   Constant lets: vars whose values never change, constants   | Automatically reference counted. When there are pointers memory is freed up |
|          Supports functional programming           |                          Functions                           |             Supports object-oriented programming             |
|                   No inheritance                   | Initializers: special functions that are called when creating a struct or class |                     Inheritance (single)                     |
| Mutability must be explicitly stated (vars vs let) |                                                              |                        Always mutable                        |

_ or underbar : Unused or left out



## Generics

Type Parameters:

Function as Types:

* (Int, Int) -> Bool // takes two Ints and returns a Bool
* (Double) -> Void // takes a Double and returns nothing 
* () -> Array // takes no arguments and returns an Array of Strings 
* () -> Void // takes no arguments and returns nothing (this is a common one)