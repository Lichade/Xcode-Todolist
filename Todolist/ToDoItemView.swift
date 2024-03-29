//
//  ToDoItemView.swift
//  Todolist
//
//  Created by lichade on 23/10/2019.
//  Copyright © 2019 r-Apps. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(createdAt).font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "Test 1 title", createdAt: "Today 12:33")
    }
}
