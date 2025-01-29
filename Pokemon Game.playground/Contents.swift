import UIKit

class Pokemon{
    var num: Int = 0
    var name: String = ""
    var type:[String] = [""]
    var abilites:[String] = [""]
    
    
    init(num:Int, name:String, type: [String], abilities:[String]){
        self.num = num
        self.name = name
        self.type = type
        self.abilites = abilities
    }
    
    
    func displayInfo(){
        print("The pokedex says \(name) is \(num) and is type \(type) with the abilities \(abilites).")
    }
    
}

var Bulbasar = Pokemon(num: 1, name: "Bulbasaur", type: ["Grass", "Poison"], abilities: ["Overgrow"])
var Charmander = Pokemon(num: 4, name: "Charmander", type: ["Fire"], abilities: ["Blaze"])
var Squirtle = Pokemon(num: 7, name: "Squirtle", type: ["Water"], abilities: ["Torrent"])

Bulbasar.displayInfo()
Charmander.displayInfo()
Squirtle.displayInfo()

class Gigantamax: Pokemon{
    var location:String = ""
    init(num:Int, name:String, type: [String], abilities:[String], location:String){
        super.init(num: num, name: name, type: type, abilities: abilities)
        self.location = location

    }
    override func displayInfo(){
        print("The pokedex says \(name) is from \(location) and has the index of \(num). \(name) with the type \(type) and has the abilities \(abilites).")
    }
}
var bulbasar = Gigantamax(num: 1, name: "Bulbasaur", type: ["Grass", "Poison"], abilities: ["Overgrow"], location: "Lake of Outrage")
var charmander = Gigantamax(num: 4, name: "Charmander", type: ["Fire"], abilities: ["Blaze"], location: "Your mom")
var squirtle = Gigantamax(num: 7, name: "Squirtle", type: ["Water"], abilities: ["Torrent"], location: "Your mom house")

bulbasar.displayInfo()
charmander.displayInfo()
squirtle.displayInfo()
