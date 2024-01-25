import Foundation
import SwiftData

@Model
class Item: Identifiable{
 
    var name: String
        
    init(name: String){
        self.name = name
    }
}
