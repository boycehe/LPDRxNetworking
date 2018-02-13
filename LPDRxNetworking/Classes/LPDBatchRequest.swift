//
//  LPDBatchRequest.swift
//  Alamofire
//
//  Created by heboyce on 2018/2/11.
//

import UIKit
import RxSwift

public class LPDBatchRequest: NSObject {

  var requestArr:Array<LPDRxRequest> = Array()
  var requestIngCount:Int = 0
  
  public func addRequest(request:LPDRxRequest) {
    self.requestArr.append(request)
  }
  
  public func addRequestFromArray(requests:Array<LPDRxRequest>){
    self.requestArr += requests
  }
  
  public func cancelAll(){
  
      for request in self.requestArr {
          request.cancel()
      }
  
      self.requestArr.removeAll()
  
  }
  
  public func rx_value()->Observable<Any>?{
    
    self.requestIngCount = self.requestArr.count
    
    return  Observable.create { (observer) -> Disposable in
      
      let observerInterval:AnyObserver<Any> = AnyObserver { (event) in

        switch event {
          case.next:
            
            self.requestIngCount = self.requestIngCount - 1
            if self.requestIngCount == 0 {
               observer.onNext(self)
              
              for x in self.requestArr {
                print(x.responseObject)
              }
              
               observer.onCompleted()
            }
          

          case.error(let error):
            
            self.cancelAll()
            observer.onError(error)
          
          case.completed:
            print("")
          
        }
        
      }
      
  
      for request in self.requestArr {
      
        LPDRxObserverPool.sharedInstance.addObserver(observer: observerInterval, identifier: request.identifier)
        let dataRequest =  LPDRxNetworkingManager.request(request.path, parameters: request)
        request.dataRequest = dataRequest
        dataRequest?.resume()
        
      }
      
      return Disposables.create {
        
        for request in self.requestArr {
           request.cancel()
        }
        
        self.requestArr.removeAll()
      }
      
    }
  
    

  }
  
  
  
  
  
  
}
