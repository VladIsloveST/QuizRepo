//
//  Person.swift
//  Quiz Quiz
//
//  Created by Mac on 01.08.2022.
//

import Foundation

class Base {
    let defaults = UserDefaults.standard
    
    static let shared = Base()
    
    struct Person: Codable {
        var nameSurname: String
        var score: Int
    }
    var persons: [Person]{
        get {
            if let data = defaults.value(forKey: "personScore") as? Data {
                return try! PropertyListDecoder().decode([Person].self, from: data)
            } else {
                return [Person]()
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue){
                defaults.set(data, forKey: "personScore")
                defaults.synchronize()
            }
        }
    }
    
    func savePerson(nameSurname: String, score: Int){
        let person = Person(nameSurname: nameSurname, score: score)
        persons.append(person)
    }
}
