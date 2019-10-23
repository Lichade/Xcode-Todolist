//
//  ToDoItemEntity.swift
//  Todolist
//
//  Created by lichade on 23/10/2019.
//  Copyright © 2019 r-Apps. All rights reserved.
//
// CUSTOM DATA MODEL
//
// Identifiable is used so it can adopt to SwiftUI:

import Foundation
import CoreData

public class ToDoItemEntity: NSManagedObject, Identifiable {
    
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
    
}

extension ToDoItemEntity {
    
    static func getAllToDoItems() -> NSFetchRequest<ToDoItemEntity> {
        
        let request:NSFetchRequest<ToDoItemEntity> = ToDoItemEntity.fetchRequest() as! NSFetchRequest<ToDoItemEntity>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
        
    }

}
