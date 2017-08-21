//
//  Articlemodel.swift
//  WeatherAppSwift
//
//  Created by GLB-312-PC on 21/08/17.
//  Copyright © 2017 GLB-312-PC. All rights reserved.
//

import UIKit

class Articlemodel: NSObject {
    var title:String?
    var author:String?
    var url:String?
    var imageurl:String?
    var descriptions:String?
    
    init(dataDictionary:NSDictionary){
        self.title = dataDictionary["title"] as? String
        self.author = dataDictionary["author"] as? String
        self.descriptions = dataDictionary["description"] as? String
        self.imageurl = dataDictionary["urlToImage"] as? String
        
    }
    

}
