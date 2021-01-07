//
//  CategoryTableViewCell.swift
//  Do
//
//  Created by Tom Nadarajan on 2/1/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    var label: UILabel!
    var descLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Futura-Bold", size: 18.0)
        label.textColor = UIColor.black
        self.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        descLabel = UILabel(frame: .zero)
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.font = UIFont(name: "SF-Compact", size: 12.0)
        descLabel.textColor = UIColor.black
        self.addSubview(descLabel)
        NSLayoutConstraint.activate([
            descLabel.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            descLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
