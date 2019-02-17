//
//  File.swift
//  MVVMDEMO
//
//  Created by Adel on 1/30/19.
//  Copyright © 2019 Adel. All rights reserved.
//

import Foundation
import Alamofire

protocol OffersViewModelDelegate:class {
    func viewModelLoadedDataSuccessfully(weathers:Item)
    func viewModelFailedToLoadData(error:String)
}
class OffersViewModel{
    var weather :Item?
    var delegate: OffersViewModelDelegate?
    var networkManager = NetworkManager()
    func sendRequest()  {

        networkManager.getItem(url: "https://jsonplaceholder.typicode.com/todos/1", onSuccess: { (item) in
            self.reportSuccessfullDataLoading(weathers: item)
        }) { (error) in
            self.reportFailedDataLoading(error: error)
        }
    }
}
extension OffersViewModel{
    func reportSuccessfullDataLoading(weathers :Item){
        DispatchQueue.main.async {
            self.delegate?.viewModelLoadedDataSuccessfully(weathers: weathers)
        }
    }
    func reportFailedDataLoading(error :String){
        self.delegate?.viewModelFailedToLoadData(error: error)
    }
}



