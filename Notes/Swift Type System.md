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



## Protocols

* A protocol is sort of a "stripped-down" struct/class
  * It has functions and vars, but no implementation or storage
* Struct or Class can implement a protocol or multiple protocols
* A protocol can have protocol inheritance
* "Constrains and gains"
* You can extend a protocol to have implementation and you can even add default implementation  
* Protocols allow for code to demand certain behavior out of another type



## Enum

* Can only have discrete states (cases)
* A value type, so it is copied as it is passed around
* Each discrete state can have its own "associated data"
* An enum's state is checked with a switch statement
* A switch must handle all possible cases
* Can have methods and computed properties, but no stored properties
* Optional is an enum