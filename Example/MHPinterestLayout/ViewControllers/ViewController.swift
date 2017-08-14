//
//  ViewController.swift
//  MHPinterestLayout
//
//  Created by Michael Henry Pantaleon on 08/01/2017.
//  Copyright (c) 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit
import SwiftCommonUtils

import MHPinterestLayout

typealias Dimension = (captionHeight:CGFloat, attachmentHeight:CGFloat)

class ViewController: UIViewController {

    @IBOutlet weak var collectionView:UICollectionView!
    var items:[Story] = Story.sampleStories()
    var layout = MHPinterestLayout()
    var dimensions:[String:Dimension] = [:]
    
    func setupCollectionView() {
        
        layout.configure {
            $0.delegate = self
            $0.headerHeight = 150
            $0.columns = UIApplication.shared.statusBarOrientation == .portrait ? 2 : 3
        }
        
        collectionView
            .configure {
                $0.setCollectionViewLayout(layout, animated: false)
                $0.delegate = self
                $0.dataSource = self
                $0.register(ItemCollectionViewCell.self)
                $0.registerHeader(HeaderReusableView.self)
                $0.backgroundColor = UIColor.white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       print(size)
        
        if size.width > size.height {
            layout.columns = 3
        } else {
            layout.columns = 2
        }
    }
}

extension ViewController:UICollectionViewDelegate {

}

extension ViewController:UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let storyCell:ItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        let story = items[indexPath.item]
        let caption = story.indexedCaption(indexPath.row)
        storyCell.captionLabel.text = caption
        storyCell.attachmentView.image = story.attachment
        
        if let dimension:Dimension = dimensions["\(indexPath.item)"] {
            storyCell.imageHeightConstraint.constant = dimension.attachmentHeight
            storyCell.captionHeightConstraint.constant = dimension.captionHeight
        }
        
        return storyCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            
            let headerView:HeaderReusableView = collectionView
                .dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderReusableView.reuseIdentifier, for: IndexPath(index: 0)) as! HeaderReusableView
            
            headerView.postsCountLabel.text = "2M"
            headerView.followersCountLabel.text = "1M"
            headerView.followingsCountLabel.text = "100K"
            
            headerView.postsLabel.text = "posts"
            headerView.followingsLabel.text = "followings"
            headerView.followersLabel.text = "followers"
            
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
}

extension ViewController:MHPinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        let story = items[indexPath.item]
        
        let caption = story
            .indexedCaption(indexPath.row)
        
        let itemWidth:CGFloat = layout.cellContentWidth
        
        let captionHeight = caption
            .computedHeight(atWidth: itemWidth, font: AppFont.caption.value)
        
        let imageHeight = story
            .attachment?
            .computedHeight(atWidth: itemWidth) ?? 0
        
        let yPaddings:CGFloat = 10
        dimensions["\(indexPath.item)"] = Dimension(captionHeight: captionHeight,
                                                    attachmentHeight: imageHeight)
        
        return captionHeight + imageHeight + yPaddings
    }
}
