//
//  NetworkManager.swift
//  MVVMDEMO
//
//  Created by Adel on 1/31/19.
//  Copyright © 2019 Adel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager{
  
    func getItem(url :String , onSuccess: @escaping(_ item: Item)->(),onFail: @escaping(_ error:String)->()){
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success( let value):
                var viewModels :[Item] = []
                let json = JSON(response.result.value)
                print("JSON tttt : \(json)")
                
                if let json = response.result.value as? [String:Any]{
                    let model = Item(with: json)
                    viewModels.append(model)

                   onSuccess(model)
                }
                else {
                    print("Can't Parse Json object! ")
                }
            case .failure:
                onFail("error happened in the request")
            default:
                print("default")
            }
        }
    }
}
