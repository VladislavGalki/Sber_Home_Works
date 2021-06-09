//
//  CollectionVIewCell.swift
//  Lesson19-Filter
//
//  Created by Владислав Галкин on 09.06.2021.

import UIKit

class CollectionVIewCell: UICollectionViewCell {
    
    static let identifier = "filterCell"
    
    lazy var filteredImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            filteredImage.topAnchor.constraint(equalTo: topAnchor),
            filteredImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            filteredImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            filteredImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        super.updateConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(filteredImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
