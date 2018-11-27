//
//  ViewController.swift
//  ImageFinderTestTask
//
//  Created by Nikita Nechyporenko on 26.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import UIKit
import SDWebImage


class CollectionVC: UICollectionViewController {
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GIF coder
        SDWebImageCodersManager.sharedInstance ().addCoder (SDWebImageGIFCoder.shared ())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        myCollectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myCollectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urlArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.myImageView.sd_setImage(with: URL.init(string: urlArr[indexPath.row]) , completed: nil)
        return cell
    }
}


