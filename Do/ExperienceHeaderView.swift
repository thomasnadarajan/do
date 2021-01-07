//
//  ExperienceHeaderView.swift
//  Do
//
//  Created by Tom Nadarajan on 27/12/20.
//

import UIKit

class ExperienceHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let experienceTitleLabel = UILabel(frame: .zero)
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(experienceTitleLabel)
        experienceTitleLabel.font = UIFont(name: "Futura", size: 24)
        experienceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            experienceTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            experienceTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            experienceTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            experienceTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                    ])
        
    }
    
    func configure(text: String) {
        experienceTitleLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
