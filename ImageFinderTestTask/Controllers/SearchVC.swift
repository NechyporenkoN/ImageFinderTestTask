//
//  SearchVC.swift
//  ImageFinderTestTask
//
//  Created by Nikita Nechyporenko on 27.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import UIKit
import SDWebImage

var urlArr = [""]

class SearchVC: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SDWebImageCodersManager.sharedInstance ().addCoder (SDWebImageGIFCoder.shared ()) //GIF coder
        gifImageView.sd_setImage(with: URL.init(string: "https://media.giphy.com/media/5scVaYq4hKA7u/giphy.gif") , completed: nil)
    }
    
    //This function creates URL for the query.
    func makeUrlString(wordForSearch: String) -> String {
        let apiStr = "https://api.giphy.com/v1/gifs/search?q="
        let apiKey = "&api_key=zRwhCf0oZDRc7iENxSvvpy4IwfVoUcoE"
        let limit = "&limit=10"
        var result = ""
        result = apiStr + wordForSearch + apiKey + limit
        return result
    }
    //This function for request a search for images in Json format.
    func request(urlString: String){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                let DataJson = try JSONDecoder().decode(DataJSON.self, from: data)
                let openData = DataJson.data
                
                for i in 0..<openData.count {
                    var urlStr = openData[i].images.original.url
                    urlArr.append(urlStr)  //add url in general array
                }
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
    @IBAction func searchButton(_ sender: Any) {
        if searchTextField.text == nil {
            print("error")
        } else {
            let strForSearch = String(searchTextField.text!)
            urlArr.removeAll()
            self.request(urlString: self.makeUrlString(wordForSearch: strForSearch))
        }
    }
}
