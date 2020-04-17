//
//  ContentView.swift
//  JSONParse2ndTry
//
//  Created by EDUARDO MEJIA on 31/03/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // 1.
    @ObservedObject var fetch = FetchToDo()
    var body: some View {
        VStack {
            
            // 2.
            // fetch ObservedObject . todos @Published var todos
            List(fetch.todos) { todo in
                VStack(alignment: .leading) {
                    // 3.
                    Text(todo.userId.description)
                    //Text(todo.userId.description)
                    Text(todo.id.description) //description es usada como un to string porque es un INT
                    Text(todo.title) //accedemos a la propiedad title del modelo
                        Text(todo.body)
                            
                    
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray) //description es usada como un to string porque es un INT
                    
                    Text("Press the button")
                    
                       Button(action: {
                       print("pressed!!!!!!!!")
                       
                       }) {Text("Clickme")}
                    
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
