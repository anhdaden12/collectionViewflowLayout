//
//  ViewController.swift
//  CollectionView3
//
//  Created by Ngoc on 7/12/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController{

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var array = [Int](0...100)
    
    var numberOfItem: CGFloat = 5
    
    var minimuminterItemspacing: CGFloat = 1
    var minimuminterLineSpacing: CGFloat = 1
    //var isPotraitUpsidedow = true
    fileprivate func calculateItemsize() {
       // numberOfItem = isPotraitUpsidedow ? numberOfItem : numberOfItem
        let itemsize = (self.view.bounds.width - (self.numberOfItem - 1) * self.minimuminterItemspacing) / self.numberOfItem
        self.flowLayout.itemSize = CGSize(width: itemsize, height: itemsize)
        self.flowLayout.minimumLineSpacing = self.minimuminterLineSpacing
        self.flowLayout.minimumInteritemSpacing = self.minimuminterItemspacing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        calculateItemsize()

    }
//    override func awakeFromNib() {
//        NotificationCenter.default.addObserver(self, selector: #selector(getDeviceChange(notification:)), name: UIDevice.orientationDidChangeNotification, object: nil)
//    }
    
//    @objc func getDeviceChange(notification: Notification){
//        let orrientation = UIDevice.current.orientation
//        if orrientation == UIDeviceOrientation.portraitUpsideDown {
//             //   isPotraitUpsidedow = true
//        } else {
//           // isPotraitUpsidedow = false
//        }
//    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
             self.flowLayout.invalidateLayout()
            self.calculateItemsize()
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label.text = String(array[indexPath.row])
        return cell
    }

   
}

