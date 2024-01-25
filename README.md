
![SwiftDataPicture](https://github.com/AppNewbie86/SwiftDataTest/assets/101304191/77628604-4ab6-44f3-808f-4b2b8f6a4bdd)

Here, you can learn how to securely store your data persistently in your app. Additionally, within the app, you will find a folder containing documentation where you can easily and clearly follow the project and its topic.


Initial situation:

An empty project with no pre-settings for SwiftData.

# SwiftData

## Introduction

To use SwiftData in a project, follow these steps:

1. Create a data model with a freely selectable name.
2. Define a variable to store values.

```swift
import Foundation
import SwiftData

@Model
class Item: Identifiable {
    
    var name: String
        
    init(name: String) {
        self.name = name
    }
}

1. Create a Model Context to track changes, retrieve data, and update data.
@Environment(\.modelContext) private var modelContext
This code snippet is placed under:

struct ContentView: View {
    // ... @Environment...
}

Build a bridge between the Model Context and storage. This involves creating a database to manage tasks such as reading, writing, deleting, and updating data.
Implementation
Now, you are ready to perform CRUD operations in SwiftData! Follow the steps below to persistently store data.

In ContentView, add the necessary code to handle user interactions, such as adding, updating, and deleting items.

Functions:

// ... Button and other UI code ...

func addItem() {
    let item = Item(name: input)
    modelContext.insert(item)
    input = ""
}

func updateItem(_ item: Item) {
    item.name = input
    try? modelContext.save()
    input = ""
}

func deleteItem(_ item: Item) {
    modelContext.delete(item)
}


With these functions implemented, your SwiftData example app can now add, update, and delete items persistently.
Feel free to customize and extend these code snippets based on your specific project requirements.




