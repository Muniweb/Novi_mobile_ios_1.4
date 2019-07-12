//
//  Items.swift
//  My Novi
//
//  Created by Adminstrator on 30/10/18.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class Items: NSObject {

    var itemName = ""
    var ItemUrl = ""
    let itemHexcode: Set<String>
    var itemImage = "";
    

    init(name: String, url: String, colorCode :Set<String> ,imageName :String)
    {
        self.itemName = name
        self.ItemUrl = url
        self.itemHexcode = colorCode
        self.itemImage = imageName
        
    }
}
