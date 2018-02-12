//
//  LPDRxNetworkingConfig.swift
//  Alamofire
//
//  Created by heboyce on 2018/2/11.
//

import UIKit


public class LPDRxNetworkingConfig: NSObject {
  
 public var baseUrl:String = ""
 public var headerField:Dictionary<String,String>?
 public var crdential:URLCredential?
  
 public static let sharedInstance = LPDRxNetworkingConfig()

  
}
