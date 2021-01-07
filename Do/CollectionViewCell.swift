//
//  CollectionViewCell.swift
//  Do
//
//  Created by Tom Nadarajan on 19/12/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let titleLabel = UILabel()
    let numberCompleted = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15.0
        
        let imageBack = UIImageView(frame: self.frame)
        imageBack.layer.cornerRadius = 15.0
        imageBack.backgroundColor = UIColor.black
        self.backgroundView = imageBack
        let effectView = UIVisualEffectView(frame: self.frame)
        let blurView = UIBlurEffect(style: UIBlurEffect.Style.regular)
        effectView.effect = blurView
        
        titleLabel.textColor = UIColor.white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        numberCompleted.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "SF-Compact", size: 12.0)
        numberCompleted.font = UIFont(name: "SF-Compact", size: 10.0)
        titleLabel.text = "Activity Name"
        numberCompleted.text = "12.2K \u{2713}'s"
        numberCompleted.textColor = UIColor.white
        effectView.layer.cornerRadius = 15.0
        self.addSubview(effectView)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            effectView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            effectView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            effectView.topAnchor.constraint(equalTo: self.topAnchor),
            effectView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        self.addSubview(titleLabel)
        self.addSubview(numberCompleted)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0)
        ])
        NSLayoutConstraint.activate([
            numberCompleted.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            numberCompleted.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
