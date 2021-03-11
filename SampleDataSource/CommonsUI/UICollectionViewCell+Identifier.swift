//
//  UICollectionViewCell+Identifier.swift
//  SampleDataSource
//
//  Created by DuongTH on 3/11/21.
//

import UIKit

extension UICollectionViewCell {
    static var nib: UINib? {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return "\(Self.self)"
    }
}
