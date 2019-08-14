//
//  ViewController.swift
//  APICollectionImage
//
//  Created by Thawatchai Phuchana on 14/8/2562 BE.
//  Copyright © 2562 Thawatchai Phuchana. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet private var collectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = Bundle(for : BeerCollectionViewCell.self)
        
        let nib =  UINib(nibName : "BeerCollectionViewCell", bundle:bundle)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "BeerCollectionViewCell")
        
        ApiManager().getItems(urlString: "https://api.punkapi.com/v2/beers") { [weak self] (beers) in self?.beers = beers
            DispatchQueue.main.sync {
                self?.collectionView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//           super.viewWillDisappear(animated)
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//    }
    
    
    var beers: [Beer] = []

}

extension ListViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as? BeerCollectionViewCell else{
            return UICollectionViewCell()
        }
        let beer = beers[indexPath.row]
        cell.setUpUI(beer: beer)
        return cell
        
    }
}
extension ListViewController : UICollectionViewDelegate{
    
}

extension ListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.size.width/2.0, height: 300)
    }
}
