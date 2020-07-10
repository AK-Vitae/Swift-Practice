# Layout

## How is the space on-screen apportioned to the Views?

1. Container Views "offers" space to the Views inside them

2. Views then choose what size they want to be

3. Container Views then position Views inside of them

   

### HStack and VStack

* Stacks divide up the space that is offered to them and then offer that to Views inside.
* It offers space to its "least flexible" sub views first
  * Inflexible example: Image (It wants to be a fixed size)
  * Slightly more flexible example: Text (It always wants to size to exactly fit its text)
  * Very flexible example: RoundedRectangle (always uses the space offered)
  * Priority can be overridden with .layoutPriority(Double)
* Spacer(minLength: CGFloat)
  * Always takes all the space offered to it
  * Draws nothing
  * The minLength defaults to the most likely spacing you'd want on a given platform
* Divider()
  * Draws a dividing line cross-wise to the way the stack is laying out
  * In a HStack, Divider would draw a vertical line
  * Takes the minimum space needed to fit the line in the direction the stack is going
* Alignment:
  * Is specified via an argument to the stack
  * Stacks automatically adjust for environments where text is right-to-left
  * Text baselines can also be used to align
  * Or alignment can be defined by personal generated alignment guides.



### Modifiers

* View modifier functions (like .padding) themselves return a View

* The returned View, for all intents and purposes, "contains" the View it's modifying

* Many modifiers just past the size offered to them along but it is possible for a modifier to be involved in the layout process itself. 

  ```swift
  HStack { // aside: the default alignment here is .center (not .top, for example)
      ForEach(viewModel.cards) { card in 
      	CardView(card: card).aspectRatio(2/3, contentMode: .fit) 
      } 
  } 
  	.foregroundColor(Color.orange) 
  	.padding(10)
  ```

* The first view offered space will be the View made by .padding(10)

  * Which will offer what it was offered minus 10 to all sides to the View from .foregroundColor
    * Which will in turn pass all of that space to the HStack
      * Which will then divide its space equally among the .aspectRatio Views in ForEach
        * Each .aspectRatio View will set its width to be its share of the HStack's width
          * Then the .aspectRatio offers all of its chosen size to its CardView

* Whenever a View is offered space that space generally doesn't include "safe areas", but those safe areas can be ignored with .edgesIgnoringSafeArea