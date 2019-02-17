//
//  ViewController.swift
//  MVVMDEMO
//
//  Created by Adel on 1/30/19.
//  Copyright © 2019 Adel. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController ,OffersViewModelDelegate{
    let offerViewModel = OffersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offerViewModel.delegate = self
        if let file = Bundle.main.path(forResource: "Weather", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: file))
                print("data \(data)")
                let decoded : [Info]
                decoded = try JSONDecoder().decode([Info].self, from: data)
                print("decoded \(decoded[0].Info[1].email[1].email_String)")
                
            } catch {
                print("parsing error")
            }
        }
    }
    @IBAction func btnAPiPressed(sender: UIButton){
        //offerViewModel.sendRequest()
    }
}
extension ViewController{
    
    func viewModelFailedToLoadData(error: String) {
        print("errorrr")
    }
    
    func viewModelLoadedDataSuccessfully(weathers: Item) {
        print("count \(String(describing: weathers.completed))")
    }
    //
    
    
}

