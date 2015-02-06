//
//  Descriptor.swift
//  Potions
//
//  Created by mitchell hudson on 12/22/14.
//  Copyright (c) 2014 mitchell hudson. All rights reserved.
//

/* Random description generator
Descriptors: Color, Smell, Taste, material

green liquid smells of almonds. Tastes like apples

color material "smells of " smell". Tastes like " taste"."

Pale green liquid smells of burnt almonds. Tastes like bitter apples

visual-modifer color material smells of smell-modifier smell.
Tastes like taste-modifer taste.

Side effects:

*/

// Add some other descriptions

import Foundation

extension Array {
    func pick() -> T? {
        return count > 0 ? self[Int(arc4random_uniform(UInt32(count)))] : nil
    }
}

class Descriptor {
    
    let colorModifierArray  = ["Dark", "Light", "Glowing", "Murky", "Milky", "Scintillating", "Sparkling", "Swirling", "Transparent", "Semi-transparent", "Smoky", "Pearlescent"]
    let colorArray          = ["red", "green", "blue", "yellow", "orange", "purple", "pink", "mauve", "ochre", "white", "violet", "gray", "cyan", "emerald", "maroon", "shifting colors"]
    let materialArray       = ["liquid", "powder", "oil", "viscous fluid", "thick fluid", "chalky"]
    let smellModiferArray   = ["bitter", "sweet", "spicy", "burnt", "sour"]
    let smellArray          = ["apples", "pepper", "earth", "milk", "herbs", "brimstone", "baked bread", "frying bacon", "figs", "flesh", "farts", "metallic"]
    let tasteArray          = ["almond", "apples", "ash", "nothing", "honey", "meat", "herbs", "blood", "cookies", "nutmeg", "carrots", "parsnips", "vegetables", "onions", "garlic"]
    
    func randomInt(range: Int) -> Int {
        return Int(arc4random_uniform(UInt32(range)))
    }
    
    func get() -> String {
        return "\(colorModifierArray.pick()!) \(colorArray.pick()!) \(materialArray.pick()!) smells like \(smellModiferArray.pick()!) \(smellArray.pick()!). Tastes of \(tasteArray.pick()!)."
    }
}







