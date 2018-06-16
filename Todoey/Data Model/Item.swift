//
//  Item.swift
//  Todoey
//
//  Created by YIWEI HUANG on 6/15/18.
//  Copyright © 2018 Huang, Yiwei. All rights reserved.
//

import Foundation

class Item {
    var title:String = ""
    var done:Bool = false
    
    init() {
        
    }
    
    init(title:String) {
        self.title = title        
    }
}
