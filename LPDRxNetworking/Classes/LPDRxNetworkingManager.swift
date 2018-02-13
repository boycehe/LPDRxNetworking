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
      
      LPDRxObserverPool.sharedInstance.addObserver(observer: observer, identifier: identifier)
      let request = self.request(path, parameters: parameters)
      request?.resume()
    
      return Disposables.create {  }
      
  }
  
  }
  
 
  class func request(_ path:String,parameters:LPDRxRequest) -> DataRequest?{
    
    var url = ""
    
    if !path.hasPrefix("http") {
       url = LPDRxNetworkingConfig.sharedInstance.baseUrl + path
    }else{
       url = path
    }
    
    var parametersDic : Parameters = Dictionary()
    
    for (key,value) in parameters.requestParameters {
        parametersDic.updateValue(value, forKey:key)
    }
    
    
    
   let request = Alamofire.SessionManager.default.request(url, method: parameters.method, parameters: parametersDic, encoding: URLEncoding.default, headers: parameters.headerField).responseJSON { (response) in
    
    
      if response.result.value != nil {
        parameters.responseObject = response.value
        onAllNext(identifier: parameters.identifier, response: response)
      }else{
        
        onAllError(identifier: parameters.identifier, error: response.error!)
      }
      
    }
  
    return request
    
  }
  
  
  class func onAllError(identifier:String,error:Error){
    
    let obArr = LPDRxObserverPool.sharedInstance.allObserversIdentifier(identifier)
    
    if let obs = obArr {
      
      for ob in obs {
        let observer = ob as! AnyObserver<Any>
        observer.onError(error)
      }
      
    }
    
  }
  
  class func onAllNext(identifier:String,response:DataResponse<Any>){
    
    let obArr = LPDRxObserverPool.sharedInstance.allObserversIdentifier(identifier)
    
    if let obs = obArr {
    
      for ob in obs {
        let observer = ob as! AnyObserver<Any>
        observer.onNext(response)
      }
      
    }
  
  
  }
 
 
  
}
