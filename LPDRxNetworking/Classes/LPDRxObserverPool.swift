//
//  LPDRxObserverPool.swift
//  Alamofire
//
//  Created by heboyce on 2018/2/12.
//

import Foundation
import RxSwift

class LPDRxObserverPool: NSObject {
  
  
  var poolDic:NSMutableDictionary = NSMutableDictionary()
  let lock = NSLock()
  
  static let sharedInstance = LPDRxObserverPool()
  
  override init() {
    super.init()
    
    self.register()
  }
  
  
  func register(){
    
    NotificationCenter.default.addObserver(self, selector:#selector(LPDRxObserverPool.handleReceiveMemory(notification:)) , name: Notification.Name.UIApplicationDidReceiveMemoryWarning, object: nil)
    
  }

  @objc public func handleReceiveMemory(notification:NSNotification){
    
    self.lock.lock()
    
    for key in self.poolDic.allKeys {
      
      let table = self.poolDic.object(forKey: key) as? NSHashTable<AnyObject>
      
      if table?.count == 0{
        self.poolDic.removeObject(forKey: key)
      }
      
    }
  
    self.lock.unlock()
    
  }
  
  func addObserver(observer:Any,identifier:String){
   
    self.lock.lock()
    var table = self.poolDic.value(forKey: identifier) as? NSHashTable<AnyObject>
    
    if table == nil {
       table = NSHashTable()
      self.poolDic.setObject(table!, forKey: NSString.init(string: identifier))
    }
    
    if !(table?.contains(observer as AnyObject))! {
      table?.add(observer as AnyObject)
    }
    
    self.lock.unlock()
    
  }
 
  
  func allObserversIdentifier(_ identifier:String) -> Array<Any>?{
    
    self.lock.lock()
    let table = self.poolDic.value(forKey: identifier) as? NSHashTable<AnyObject>
    self.lock.unlock()
  
    return table?.allObjects
   
  }

}
