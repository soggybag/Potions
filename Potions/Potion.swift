//
//  Potion.swift
//  Potion Swift 2
//
//  Created by mitchell hudson on 12/20/14.
//  Copyright (c) 2014 mitchell hudson. All rights reserved.
//

import Realm

class Potion: RLMObject {
    dynamic var name = ""
    dynamic var effect = ""
    dynamic var frequency = 1
    dynamic var descriptor = ""
}
