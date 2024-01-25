# ``SwiftDataTest``

<!--@START_MENU_TOKEN@-->Summary<!--@END_MENU_TOKEN@-->

# SwiftData

##Um SwiftData in einem Projekt verwenden zu können brauchen wir als ersten Schritt ein @DatenModell Name ist frei wählbar. Und noch eine Variable zum Speichern der Werte

import Foundation
import SwiftData

@Model
class Item: Identifiable{
 
    var name: String
        
    init(name: String){
        self.name = name
    }
}

##Jetzt müssen wir eine Schnittstelle schaffen, das heißt wir erstellen einen Model Context und das ermöglicht uns das Änderungen Abrufen von daten und aktualisieren von Daten verfolgt werden können

@Environment (\ .modelContext) privat var modelContext  

dieser Codesatz kommt unter: 

struct ContentView : View {
---> @Environment......   <----------
}

## Im dritten Schritt bauen wir eine Brücke zw. ModellKontext und Speicher es erstellt eine Datenbank und verwaltet die folgenden Aufgaben wie : Lesen, Schreiben, Löschen, und Aktualisieren von Daten

## Jetzt sind wir bereit, CRUD-Operationen in SwiftData durchzuführen.!!!!

## So um jetzt aber Daten persistent zu speichern benötigen wir in der ContentView noch ein paar Codezeilen.
## Deswegen fangen wir mal mit der Schaltfläche also einem Button der die Aufgabe hat einen weiteren Task in der Liste hinzuzufügen. So jetzt haben wir uns unsere Schaltfläche dafür entwickelt, können allerdings noch keine Änderungen sehen. Um dies aber im nächsten Schritt umzusetzen benötigen wir eine Liste und rufen dort unsere Daten ab.

## Dann brauchen wir nur noch für die einzelnen CRUD Operationen die einzelnen Functionen implementieren.
## In unserem Fall brauchen wir da....

addItem
deleteItem
updateItem

## zum besseren Verständnis habe ich die functionen mal komplett ausgeschrieben und ins Deutsche übersetzt:

func addItem(){
        let item = Item(name: input)
        modelContext.insert(item)
        input = ""

    }
    
    func updateItem(_ item: Item){
        item.name = input
        try? modelContext.save()
        input = ""
    }
    
    func deleteItem(_ item: Item){
        modelContext.delete(item)
    }

## wenn diese 3 Funktionen dann implementiert wurde kann eure kleine SwiftData Example App ein Item hinzufügen, updaten, und gelöscht werden. Das Hinzufügen der Daten erfolgt Persistent


