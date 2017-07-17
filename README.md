# RobinSDK

A simple model dependency for working with the [Robin API](https://docs.robinpowered.com).

# Getting Started

## Using Swift Package Manager


```
import PackageDescription

let package = Package(
    name: "MyPackage",
    dependencies: [
        .Package(url: "https://github.com/need2edit/RobinSDK", majorVersion: 1),
    ]
)
```

## This is an Alpha
This is a proof of concept to play around with some server side Swift frameworks (Vapor, Pefect) and make it easier to interact with Robin objects. I promise nothing.

Because this is an experiment...
* There is no web service component 😔. Take your pick from the wonderful folks over at Alamofire, Vapor, Perfect, etc. this is just for working with the model objects.
* It's read or "GET" requests only right now. CRUD functions might happen in the future, but no plans to add it this year.

## Goals
- Make it easy to work with the model objects produced by the Robin API
- Provide a type safe interface for working with Robin objects, especially where "id" is just an integer

# Design Considerations

### Type Safe Identifiers
Instead of an Integer as an identifier on objects, the **id** property on objects used for uniqueness is wrapped in its own stuct. It will behave the same way as an Int in almost all cases, but gives us some extra type safety when using it in more complex situations. For example, you can't accidentally feed in a Device Identifer where the system is expecting an Event identifier.

### Equatability & Sorting
Most objects conform to `equatable` & `comparable` protocols.

# TODO List
If you want to help submit a PR!

[ ] Cocoapods Support
[ ] Carthage Support
[ ] A working iOS Example
[ ] A working MacOS Example
[ ] A working Server App Example
[ ] More Tests!
[ ] Interactive Playground
