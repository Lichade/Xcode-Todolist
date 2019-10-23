//
//  ContentView.swift
//  Todolist
//
//  Created by lichade on 23/10/2019.
//  Copyright © 2019 r-Apps. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(fetchRequest: ToDoItemEntity.getAllToDoItems()) var todoItems:FetchedResults<ToDoItemEntity>
    
    @State private var newToDoItem = ""
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("What's next?")) {
                    HStack{
                        TextField("New Item", text: self.$newToDoItem)
                        Button(action: {
                            
                            let toDoItem = ToDoItemEntity(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            do {
                                try self.managedObjectContext.save()
                                
                            } catch {
                                print(error)
                            }
                            self.newToDoItem = ""
                            
                        }) {
                            Image(systemName: "plus.circle.fill").foregroundColor(.green).imageScale(.large)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My To Do List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
