//
//  PlaceCell.swift
//  tv
//
//  Created by Владислав Галкин on 24.05.2021.
//

import UIKit

protocol PlaceCellProtocol {
    func doSometh(cell: PlaceCell)
}

class PlaceCell: UITableViewCell {
    
    var delegate: PlaceCellProtocol?
    var checkark: Bool?
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("☑︎", for: .normal)
        button.backgroundColor = .gray
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        checkark = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 150),
            label.heightAnchor.constraint(equalToConstant: 25),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }
    
    @objc func buttonTapped(){
        self.delegate?.doSometh(cell: self)
    }
}
