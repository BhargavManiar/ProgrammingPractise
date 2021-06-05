//
//  Picture.swift
//  Challenge-Day50
//
//  Created by Bhargav Maniar on 05/06/2021.
//

import UIKit

class Pictures: NSObject, Codable {
    var name: String
    var image: String
    var caption: String
    
    init(name: String, image: String, caption: String) {
        self.name = name
        self.image = image
        self.caption = caption
    }
}
