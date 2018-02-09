//
//  GINetworkingManager.swift
//  GameIsland-iOS
//
//  Created by heboyce on 2018/1/28.
//  Copyright © 2018年 boycehe. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class LPDRxNetworkingManager: NSObject {
  

  class func GET(_ url:String,parameters:Parameters? = nil,completionHandler: @escaping (DataResponse<Any>) -> Void) {
    
    Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.prettyPrinted, headers: nil).responseJSON { response in
      
        completionHandler(response)

    }
    
  }
    
  
}
