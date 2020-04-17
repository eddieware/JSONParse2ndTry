//
//  Model.swift
//  JSONParse2ndTry
//
//  Created by EDUARDO MEJIA on 31/03/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//


import Foundation
import SwiftUI

struct Todo: Codable, Identifiable {
    public var userId: Int
    public var id: Int
    public var title: String
    public var body: String
}

//CODEAABLE E IDENTIFIABLE IS A PROTOCOL

//The struct conforms to the Codable protocol to be able to decode the model from the JSON File and the struct conforms to the Identifiable protocol, which allows the items to be listed in a List.
class FetchToDo: ObservableObject {
  // 1.
    
  @Published var todos = [Todo]() //Encierras el modelo en una variable @Published properti wraper usada en classes para compartir el valor de la variable
     
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")! //forzar valor
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                     //print(decodedData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
