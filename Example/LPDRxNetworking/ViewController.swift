//
//  ViewController.swift
//  LPDRxNetworking
//
//  Created by boycehe.com on 02/09/2018.
//  Copyright (c) 2018 boycehe.com. All rights reserved.
//

import UIKit
import LPDRxNetworking
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      LPDRxNetworkingConfig.sharedInstance.baseUrl = "http://baike.baidu.com/api/openapi/"
      /*
      let request1 = LPDRxRequest()
      
      request1.path = "BaikeLemmaCardApi"
      request1.identifier = "aaabbb1"
      request1.method = .get
      request1.setParameterValue("103", forKey: "scope")
      request1.setParameterValue("json", forKey: "format")
      request1.setParameterValue("379020", forKey: "appid")
      request1.setParameterValue("上海", forKey: "bk_key")
      request1.setParameterValue("600", forKey: "bk_length")
    
     let disposable = request1.rx_value()?.subscribe(onNext: { (x) in
        print("next")
        print(x)
      }, onError: { (error) in
        print("error")
        print(error)
      }, onCompleted: {
        print("onCompleted")
      }, onDisposed: {
        print("onDisposed")
      })
      */
    //  disposable?.dispose()
      
      LPDRxNetworkingConfig.sharedInstance.baseUrl = "http://www.sojson.com/"
    
       let request2 = LPDRxRequest()
      request2.path = "open/api/weather/json.shtml"
      request2.identifier = "aaabbb12"
      request2.method = .get
      request2.setParameterValue("北京", forKey: "city")
      
      let disposable2 = request2.rx_value()?.subscribe(onNext: { (x) in
        print("next2")
        print(x)
      }, onError: { (error) in
        print("error2")
        print(error)
      }, onCompleted: {
        print("onCompleted2")
      }, onDisposed: {
        print("onDisposed2")
      })
 
      


    }

}

