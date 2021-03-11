//
//  HLHotelMediumCell.swift
//  Hotellify
//
//  Created by DuongTH on 2/20/21.
//  Copyright © 2021 DuongTH.dev. All rights reserved.
//

import UIKit

class HLHotelMediumCell: UICollectionViewCell {
    @IBOutlet internal weak var containerView: UIView!

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var shortAddressLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var rateButton: UIButton!
    @IBOutlet private var thumbnailImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.isUserInteractionEnabled = false
    }

    func bind(_ data: Any) {
        
    }
    static var cellSize: CGSize {
        return CGSize(width: 265, height: 185)
    }
}
