//
//  JsonparsingClass.swift
//  WeatherAppSwift
//
//  Created by GLB-312-PC on 21/08/17.
//  Copyright © 2017 GLB-312-PC. All rights reserved.
//

import UIKit

class JsonparsingClass: NSObject {
    public func convertArrayToModelOfArray(dataArray:NSArray) -> NSArray{
        let finalModelArray:NSMutableArray = NSMutableArray.init()
        
        for data in dataArray{
            
            print("data : ", data);
            
             let dataDict:NSDictionary=data as! NSDictionary
            
          
          let articleModel = Articlemodel.init(dataDictionary: dataDict)
             finalModelArray.add(articleModel)
           }
               return finalModelArray
    }
    
    
    
}
