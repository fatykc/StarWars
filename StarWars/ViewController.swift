//
//  ViewController.swift
//  StarWars
//
//  Created by Fatiha Kaci (Étudiant) on 18-04-21.
//  Copyright © 2018 Fatiha Kaci (Étudiant). All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let baseURL = "https://swapi.co/api/"
    let getPersonEndpoint = "people/1/"
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var height: UILabel!
    
    @IBOutlet var massLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let getPersonURL = URL(string: baseURL + getPersonEndpoint)!
        Alamofire.request(getPersonURL).responseJSON { response in
            
            
            
            
            if response.result.isSuccess {
                
                print ("this was a succes !!!")
            } else {
                
                print("oh no,there was an error:(")
            }
            
            
            let json = response.value
            print(json)
            
            
        }
        ///le test
        let person = Person("Luke",height:188)
        let person1 = Person("Luke")
        
        nameLabel.text=person.name
        massLabel.text="Mass is \(person.mass)"
        
        height.text = person.hairColor.rawValue
        
        print(person)
        print(person.getName())
        
    }
    
    
}

enum HairColor:String {
    case light = "Light"
    case brown = "Brown"
    case black = "Black"
    case blond = "Blond"
    
    
    
}

struct Person {
    var name=""
    var height=0
    var mass = 0
    var hairColor:HairColor = .blond
    var skinColor="unknown"
    var eyeColor="unknown"
    var gender="unknown"
    var homeworld="unknown"
    
    
    
    
    init(_ name:String) {
        self.name=name
        
    }
    
    init(_ name:String,height:Int) {
        self.name=name
        self.height=height
        
    }
    
    
    
    
    func getName() -> String {
        return self.name
    }
    
}
