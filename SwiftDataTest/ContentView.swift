import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var input: String = ""

    var body: some View {
        
        // NavigationSplitView Dient zur besseren Präsentation des Features
                
        NavigationSplitView {
            VStack {
                HStack {
                   
                    TextField("Add an item", text: $input )
                    Button("Add") {
                        addItem()
                    }
                }
                HStack {
                    List {
                        ForEach(items) { item in
                            NavigationLink{
                                Text(item.name)
                                TextField("Update here..", text: $input ).onAppear(){
                                    input = item.name
                                }
                                Button("Update") {
                                    updateItem(item)
                                }
                                
                            } label: {
                                Text(item.name)
                            }
                        }.onDelete(perform: { indexSet in
                            for index in indexSet{
                                deleteItem(items[index])
                            }
                        })
                    }
                }
            }.padding()
        } detail: {
            Text("Select an item")
        }
    }
    
    
    
    // Function zum hinzufügen
    func addItem(){
        let item = Item(name: input)
        modelContext.insert(item)
        input = ""

    }
    // Function zum updaten
    func updateItem(_ item: Item){
        item.name = input
        try? modelContext.save()
        input = ""
    }
    // Function zum Deleten
    func deleteItem(_ item: Item){
        modelContext.delete(item)
    }
}


#Preview {
    ContentView()
}
