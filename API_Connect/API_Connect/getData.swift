//
//  getData.swift
//  API_Connect
//
//  Created by 陳忠義 on 2018/3/6.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation
import UIKit



class getData:UIViewController{
    
    override func viewDidLoad() {
        getLocationData()
    }
    
    //取得資料
    func getLocationData() {
      
        Connect.getRemoteData("URL", parameters: [:]) { (response, error) in
            
            if error {
                let errorMsg = response["Msg"].string
                print(errorMsg)
            } else {
                let data = response["Content"]["zones"]
                print(data)
            }   
        }  
    }
    
    
    
}
