//
//  HLHotelMediumDataSource.swift
//  Hotellify
//
//  Created by DuongTH on 2/21/21.
//  Copyright © 2021 DuongTH.dev. All rights reserved.
//

import UIKit

protocol HotelCellModel {
    
}
struct HotelModel: HotelCellModel {
    
}
class HLHotelMediumDataSource: NSObject {
    
    static func config(for collectionView: UICollectionView?) -> HLHotelMediumDataSource {
        let dataSource = HLHotelMediumDataSource()
        dataSource.collectionView = collectionView
        return dataSource
    }
    
    private weak var collectionView: UICollectionView? {
        didSet {
            registerCell()
            registerLayout()
            collectionView?.dataSource = self
            collectionView?.delegate = self
        }
    }
    
    private override init() {
        super.init()
    }
    
    var didSelectedAt:((_ model: HotelCellModel,_ index: Int) -> Void)?
    var models: [HotelCellModel] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private func registerCell() {
        collectionView?.register(HLHotelMediumCell.nib, forCellWithReuseIdentifier: HLHotelMediumCell.reuseIdentifier)
    }

    private func registerLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 18
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        collectionView?.collectionViewLayout = layout
        collectionView?.alwaysBounceVertical = false
        collectionView?.alwaysBounceHorizontal = true

//        collectionView?.showsVerticalScrollIndicator = false
//        collectionView?.showsHorizontalScrollIndicator = false
    }
}

extension HLHotelMediumDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HLHotelMediumCell.reuseIdentifier, for: indexPath) as! HLHotelMediumCell
        cell.bind(models[indexPath.row])
        return cell
    }
}

extension HLHotelMediumDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        self.didSelectedAt?(models[index],index)
    }
}

extension HLHotelMediumDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return HLHotelMediumCell.cellSize
    }
}
