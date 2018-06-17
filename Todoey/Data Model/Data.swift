//
//  Data.swift
//  Todoey
//
//  Created by YIWEI HUANG on 6/16/18.
//  Copyright © 2018 Huang, Yiwei. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    // dynamic allows the object to be monitored at the run time
    // adding @objc allow realm to monitor this object
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
