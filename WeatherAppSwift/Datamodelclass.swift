//
//  Datamodelclass.swift
//  WeatherAppSwift
//
//  Created by GLB-312-PC on 21/08/17.
//  Copyright © 2017 GLB-312-PC. All rights reserved.
//

import UIKit

class Datamodelclass: NSObject {
    func getDatadetails(callback:@escaping(NSArray)->Void) -> Void {
        Apihelperclass.init().getnewsfeedsData(){(respone) in
            let finalData: NSArray = JsonparsingClass.init().convertArrayToModelOfArray(dataArray: respone)
            print(finalData)
            callback(finalData)
        }
    }
    
}
