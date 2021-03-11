//
//  ViewController.swift
//  SampleDataSource
//
//  Created by DuongTH on 3/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var recommendedCollectionView: UICollectionView! {
        didSet {
            recommendDataSource = HLHotelMediumDataSource.config(for: recommendedCollectionView)
        }
    }
    private var recommendDataSource: HLHotelMediumDataSource? {
        didSet {
            recommendDataSource?.didSelectedAt = {[weak self] (model, index) in
                self?.didTouchRecommendItem(model, index)
            }
        }
    }
    
    @IBOutlet private weak var dealsCollectionView: UICollectionView! {
        didSet {
            dealsDataSource = HLHotelMediumDataSource.config(for: dealsCollectionView)
        }
    }
    private var dealsDataSource: HLHotelMediumDataSource? {
        didSet {
            dealsDataSource?.didSelectedAt = {[weak self] (model, index) in
                self?.didTouchDealItem(model, index)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendDataSource?.models = [HotelModel(),HotelModel(),HotelModel(), HotelModel() , HotelModel(), HotelModel()]
        dealsDataSource?.models = [HotelModel(),HotelModel(),HotelModel()]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        recommendedCollectionView.reloadData()
        dealsCollectionView.reloadData()
    }
}

extension ViewController {
    func didTouchRecommendItem(_ model: HotelCellModel,_ index: Int) {
        print(Date(), Self.self, #function, model, index)
    }
    func didTouchDealItem(_ model: HotelCellModel,_ index: Int) {
        print(Date(), Self.self, #function, model, index)
    }
}
