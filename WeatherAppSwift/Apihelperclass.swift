//
//  Apihelperclass.swift
//  WeatherAppSwift
//
//  Created by GLB-312-PC on 21/08/17.
//  Copyright © 2017 GLB-312-PC. All rights reserved.
//

import UIKit

class Apihelperclass: NSObject {

    func getnewsfeedsData(callback: @escaping (NSArray) -> Void ) -> Void {
        let url = URL.init(string: "\(Configuration.Url)\(Configuration.Apikey)")
        print(url!)
        
        let servisehelper = ServiseHelperclass()
        servisehelper.getRequest(with: url!) { (response) in
           
            if let responseDictionary :NSDictionary = response as? NSDictionary{
                if let articlearray: NSArray = responseDictionary["articles"]  as? NSArray{
                  callback(articlearray)
               }
            }
        }
    }
}
