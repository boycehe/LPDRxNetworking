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
import RxSwift

class LPDRxNetworkingManager: NSObject {
  

  class func rx_request(_ path:String,parameters:LPDRxRequest,identifier:String)-> Observable<Any>?{
    
    return  Observable.create { (observer) -> Disposable in
      

      
      self.request(path, parameters: parameters)
    
      return Disposables.create {  }
      
  }
    

  }
  
 
  
  class func request(_ path:String,parameters:LPDRxRequest){
    
    var url = ""
    
    if !path.hasPrefix("http") {
       url = LPDRxNetworkingConfig.sharedInstance.baseUrl + path
    }else{
       url = path
    }
    
    var parametersDic : Dictionary<String,Any> = Dictionary()
    
    for (key,value) in parameters.requestParameters {
        parametersDic.updateValue(value, forKey:key)
    }
    
    
    Alamofire.request(url, method:parameters.method, parameters: parametersDic, encoding: JSONEncoding.prettyPrinted, headers: parameters.headerField).responseJSON { response in
      
   
      
    }
    
    
  }
 
 
  
}
