//
//  PotionStore.swift
//  Potion Swift 2
//
//  Created by mitchell hudson on 12/20/14.
//  Copyright (c) 2014 mitchell hudson. All rights reserved.
//

import Realm

class PotionStore {
    
    // Make a singleton -
    class var sharedInstance: PotionStore {
        struct Static {
            static let instance = PotionStore()
        }
        return Static.instance
    }
    
    // postions - property returns all Potions
    var potions: RLMResults {
        get {
            return Potion.allObjects().sortedResultsUsingProperty("name", ascending: true)
        }
    }
    
    var count: Int  {
        get {
            return Int(potions.count)
        }
    }
    
    // Add a new Potion
    func addPotion(potion: Potion) {
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        realm.addObject(potion)
        realm.commitWriteTransaction()
    }
    
    // Add a new Potion with name, effect and freq
    func add(name: String, effect: String, frequency: Int, descriptor: String) {
        let newPotion = Potion()
        newPotion.name = name
        newPotion.effect = effect
        newPotion.frequency = frequency
        newPotion.descriptor = descriptor
        addPotion(newPotion)
    }
    
    
    // Get a Potion at index
    func get(index: Int) -> Potion {
        return potions.objectAtIndex(UInt(index)) as! Potion
    }
    
    // Get random potion
    func getRandomPotion() -> Potion {
        var total = 0
        var potionToReturn: Potion!
        for potion in potions {
            total += (potion as! Potion).frequency
        }
        
        let randomNumber = arc4random_uniform(UInt32(total))
        
        total = 0
        for potion in potions {
            total += (potion as! Potion).frequency
            if UInt32(total) > randomNumber {
                potionToReturn = potion as! Potion
                break
            }
            
        }
        
        return potionToReturn
        // return get(Int(arc4random_uniform(UInt32(count))))
    }
    
    // Remove a potion 
    func remove(potion: Potion) {
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        realm.deleteObject(potion)
        realm.commitWriteTransaction()
    }
    
    // Remove Potion at Index
    func removePotionAt(index: Int) {
        let potionToDelete = get(index)
        remove(potionToDelete)
    }
    
    
    // -----------------------------------
    // Default Data 
    
    func addDefaultData() {
        if potions.count != 0 {
            return
        }
        
        let descriptor = Descriptor()
        
        self.add("Animal Control", effect: "As per the spell.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Clairaudience", effect: "As per the spell.", frequency: 3, descriptor:descriptor.get())
        self.add("Clairvoyance", effect: "As per the spell.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Diminuation", effect: "Shrinks the imbiber to six inches in height.", frequency: 3, descriptor:descriptor.get())
        self.add("Dragon Control", effect: "Allows the imbiber to control dragons, as per the charm monster spell.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Ethereality", effect: "The imbiber can move through solid objects.", frequency: 3, descriptor:descriptor.get())
        self.add("Extra Healing", effect: "Heals 3D8+3 points of damage.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Fire Resistance", effect: "As per the spell.", frequency: 3, descriptor:descriptor.get())
        self.add("Flying", effect: "As per the spell.", frequency: 3, descriptor:descriptor.get())
        self.add("Frozen Concoction", effect: "Allows the imbiber to climb walls.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Gaseous Form", effect: "Turns the imbibers body to mist.", frequency: 3, descriptor:descriptor.get())
        self.add("Giant Strength", effect: "The imbiber gains +4 to Str, +1d8 damage and +4 to hit.", frequency: 3, descriptor:descriptor.get())
        self.add("Growth", effect: "Character grows to 30' in height.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Heroism", effect: "Imbiber gains +2 attack and damage.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Healing", effect: "Heals 1d8 points of damage.", frequency: 3, descriptor:descriptor.get())
        self.add("Heroism", effect: "Imbiber gains +2 attack and damage.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Invisibility", effect: "As per the spell.", frequency: 3, descriptor:descriptor.get())
        self.add("Invulnerability", effect: "The imbiber gains +2 on all saves and +2 Armore class.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Levitation", effect: "As per the spell.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Plant Control", effect: "As per the spell.", frequency: 3, descriptor:descriptor.get())
        self.add("Poison", effect: "Imbiber makes a save or dies.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Slipperiness", effect: "Turns the surface covered into a frictionless surface.", frequency: 3, descriptor:descriptor.get())
        
        self.add("Treasure Finding", effect: "Allows the imbiber to detect treasure within 400'.", frequency: 3, descriptor:descriptor.get())

        self.add("Undead Control", effect: "The imbiber can control 2d4 undead of fewer than 4 hit dice, and 1d4 undead of 4+ hitdice.", frequency: 3, descriptor:descriptor.get())
    }
}
