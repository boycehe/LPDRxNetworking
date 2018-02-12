//
//  GIRequest.swift
//  GameIsland-iOS
//
//  Created by heboyce on 2018/2/8.
//  Copyright © 2018年 boycehe. All rights reserved.

import UIKit
import Alamofire
import RxSwift

public enum LPDRxRequestPriority{
  
 case normal
 case low
 case high
  
}


public enum LPDRxResponseSerializerType{
  
  case json
  case model
 
}


class LPDRxRequest: NSObject {
  
  var requestParameters:Dictionary<String,Any> = Dictionary()
  var headerField:Dictionary<String,String> = Dictionary()
  var contentType:String    = ""
  var timeoutInterval:Int   = 30
  var cachePolicy:NSURLRequest.CachePolicy = .useProtocolCachePolicy
  var acceptableContentTypes:Set<String> = Set()
  var path:String         = ""
  var identifier:String   = ""
  var dataTask:URLSessionDataTask?
  var priority:LPDRxRequestPriority   = .normal
  var method:HTTPMethod   = .get
  var responseSerializeClass:AnyClass?
  var responseObject:AnyObject?
  var responseType:LPDRxResponseSerializerType = .json
  var formData:(()->MultipartFormData?)?
  
  func setValue(_ value: Any?, forHeaderField key: String) {
    
    
  }
  
  func setParameterValue(_ value: Any?, forKey key: String) {
    
  }
  
  func cancel() {
    
  }
  
  func rx_value()->Observable<Any>?{
    
  return  Observable.create { (observer) -> Disposable in
    
    
    
      return Disposables.create {  }
    }
    
  }
  
  

}
