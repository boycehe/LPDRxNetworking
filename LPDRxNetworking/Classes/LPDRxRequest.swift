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


public class LPDRxRequest: NSObject {
  
 public var requestParameters:Dictionary<String,Any> = Dictionary()
 public var headerField:Dictionary<String,String> = Dictionary()
 public var contentType:String    = ""
 public var timeoutInterval:Int   = 30
 public var cachePolicy:NSURLRequest.CachePolicy = .useProtocolCachePolicy
 public var acceptableContentTypes:Set<String> = Set()
 public var path:String         = ""
 public var identifier:String   = ""
 public var dataTask:URLSessionDataTask?
 public var priority:LPDRxRequestPriority   = .normal
 public var method:HTTPMethod   = .get
 public var responseSerializeClass:AnyClass?
 public var responseObject:AnyObject?
 public var responseType:LPDRxResponseSerializerType = .json
 public var formData:(()->MultipartFormData?)?
 
 
  
 public func setValue(_ value: String, forHeaderField key: String) {
  
    self.headerField[key] = value
    
  }
  
 public func setParameterValue(_ value: Any, forKey key: String) {
  
      self.requestParameters[key] = value
  
  }
  
 public func cancel() {
    
  }
  
 public func rx_value()->Observable<Any>?{
  
    return LPDRxNetworkingManager.rx_request(self.path, parameters: self, identifier: self.identifier)
  
  }
  
  

}
