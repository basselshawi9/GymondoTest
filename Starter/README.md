# Bassel Shawi's Gymondo Test

## Installation

I only used Swift Dependency Manager for third-party libraries, no pods are present
so you won't need to use the command line to install and run the project. The project
Should run without any issues or special instructions.


## Architecture

The Architecture that I used in the project is inspired by TDD Clean Architecture,
it's divided into 2 main parts 

1. Core which holds various utilities, API helpers, Reusable UI, extensions, modifiers, DependencyInjector, and other helper classes 
2. Modules: any application can be divided into several modules, for example: User Management, Exercise, Subscription, etc...
In our case, we have only 1 module, Exercises.

Each Module is divided into 2 main parts:

1. Data: in that section, we have our models, parameters, data sources, and repositories
2. Presentation is divided into the ViewModel Section which holds Events, States, and the actual ViewModel. Views Section, and the Screens Section.
    
    ViewModel accepts events from views and screens and produces states to be consumed 
    by the UI

TDD Architecture usually has 3 layers: Data, Domain, and Presentation, for simplicity I eliminated the Domain Layer, because it's more suitable for small projects and tests, but I use the full architecture when working with a team, or working on middle to big projects. The Domain Layer gives a better encapsulation between presentation and data layers.

I worked with various architectures, but in my opinion, this architecture is the best because it has the best solutions
For state management issues, it utilizes the concept of data and state streams heavily and also utilizes the concept of separations of concerns and dependency injections.


I demonstrated that in the example of how to access remote and cached data in datasources and repository section of the code for you to examine
