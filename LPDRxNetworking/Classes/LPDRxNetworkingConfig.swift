//
//  LPDRxNetworkingConfig.swift
//  Alamofire
//
//  Created by heboyce on 2018/2/11.
//

import UIKit


class LPDRxNetworkingConfig: NSObject {
  
  var baseUrl:String = ""
  var headerField:Dictionary<String,String>?
  var crdential:URLCredential?
  
  static let sharedInstance = LPDRxNetworkingConfig()

  
}
