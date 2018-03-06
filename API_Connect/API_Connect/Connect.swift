//
//  Connect.swift
//  GithubUse
//
//  Created by 陳忠義 on 2018/3/6.
//  Copyright © 2018年 github. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Connect {
    
    class func getRemoteData(_ url: String , parameters: [String : AnyObject] , completionHandler : @escaping ((_ response : JSON, _ error : Bool) -> Void)){
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseJSON { (response:DataResponse<Any>) in
                switch(response.result) {
                case .success(_):
                    if let value = response.result.value {
                        let json = JSON(value)
                        let retCode = json["RetCode"]
                        
                        if retCode == 1 {
                            completionHandler(json, false)
                        } else if retCode == 0 {
                            completionHandler(json, true)
                        } else {
                            completionHandler(json, false)
                        }
                        
                        
                    }
                    break
                    
                case .failure(_):
                    print(response.result.error!)
                    break
                    
                }
        }
    }

}
