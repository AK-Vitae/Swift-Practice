# MVVM and SwiftUI

MVVM stands for Model-View-ViewModel
It is a "code organizing" architectural design paradigm

## Model

* UI Independent: Doesn't import SwiftUI
* Encapsulates Data and Logic
* Data Flows from model to View (read only)

## View

* Reflects the Model
* Stateless, as state is defined in the model
* Declarative instead of imperative
* Time independent and resultant code is localized
* Reactive: UI will change as model changes

## ViewModel

* Binds View to the Model
* Interprets the Model for the View
* Processes Intent

## MVVM Flow

1. **Model** creates/stores data
2. **ViewModel** notices the new changes
3. **ViewModel** "might" interpret changes
4. **ViewModel** publishes "something changed"
5. **View** automatically observes publications, pulls the data, and rebuilds
