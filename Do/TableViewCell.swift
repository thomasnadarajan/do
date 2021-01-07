//
//  TableViewCell.swift
//  Do
//
//  Created by Tom Nadarajan on 27/12/20.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 15.0
        return cell
    }
    
    var mainCollectionView: UICollectionView!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/2 - 10, height: self.frame.height * 0.7)
        flowLayout.scrollDirection = .horizontal
        mainCollectionView = UICollectionView(frame: self.contentView.frame, collectionViewLayout: flowLayout)
        self.addSubview(mainCollectionView)
        mainCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        mainCollectionView.alwaysBounceHorizontal = true
        mainCollectionView.backgroundColor = UIColor.white
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //flowLayout.minimumInteritemSpacing = 0.0
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.frame.height * 0.9, height: self.frame.height * 0.9)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        flowLayout.scrollDirection = .horizontal
        
        mainCollectionView.collectionViewLayout = flowLayout
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
