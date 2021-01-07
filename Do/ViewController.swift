//
//  ViewController.swift
//  Do
//
//  Created by Tom Nadarajan on 17/12/20.
//
import Foundation
import UIKit
import LFTwitterProfile
import TRMosaicLayout
import AFNetworking
import ImageViewer

private let reuseIdentifier = "TRMosaicCell"

class ViewController: TwitterProfileViewController {
  
  //var tweetTableView: UITableView!
var memoriesCollectionView: UICollectionView!
  var photosTableView: UITableView!
  var favoritesTableView: UITableView!
  
  var custom: UIView!
  var label: UILabel!
    var books = [String]()
    var selectedCell :IndexPath! = nil
  override func numberOfSegments() -> Int {
    return 2
  }
  
  override func segmentTitle(forSegment index: Int) -> String {
    switch index {
    case 0:
        return "Memories"
    
    case 1:
        return "Accepted"
    default:
        return "NULL"
    }
  }
  
  override func prepareForLayout() {
    // TableViews
    //let _tweetTableView = UITableView(frame: CGRect.zero, style: .plain)
    //self.tweetTableView = _tweetTableView
    let mosaicLayout = TRMosaicLayout()
    mosaicLayout.delegate = self
    let _memoriesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: mosaicLayout)
    _memoriesCollectionView.backgroundColor = UIColor.white
    self.memoriesCollectionView = _memoriesCollectionView
    
    let _photosTableView = UITableView(frame: CGRect.zero, style: .plain)
    self.photosTableView = _photosTableView
    
    let _favoritesTableView = UITableView(frame: CGRect.zero, style: .plain)
    self.favoritesTableView = _favoritesTableView
    
    self.setupTables()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.memoriesCollectionView.allowsMultipleSelection = false
    self.memoriesCollectionView.allowsSelection = true
    self.locationString = "Hong Kong"
    self.username = "memem"
    
    //self.profileImage = UIImage.init(named: "icon.png")
  }
  
   override func scrollView(forSegment index: Int) -> UIScrollView {
    switch index {
    case 0:
      return memoriesCollectionView
    case 1:
      return photosTableView
    case 2:
      return favoritesTableView
    default:
      return memoriesCollectionView
    }
  }
    @objc func didTapImage(_ sender: UITapGestureRecognizer) {
        let touch = sender.location(in: self.memoriesCollectionView)
        selectedCell = self.memoriesCollectionView.indexPathForItem(at: touch)
        let input : UIImageView = self.memoriesCollectionView.cellForItem(at: selectedCell)?.backgroundView as! UIImageView
        ImageViewer.show(input, presentingVC: self)
    }
}



// MARK: UITableViewDelegates & DataSources
extension ViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    
  
  fileprivate func setupTables() {
    /*
    self.tweetTableView.delegate = self
    self.tweetTableView.dataSource = self
    self.tweetTableView.register(UITableViewCell.self, forCellReuseIdentifier: "tweetCell")
 */
    
    self.memoriesCollectionView.delegate = self
    self.memoriesCollectionView.dataSource = self
    self.memoriesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
    
    self.photosTableView.delegate = self
    self.photosTableView.dataSource = self
    //self.photosTableView.isHidden = true
    self.photosTableView.register(UITableViewCell.self, forCellReuseIdentifier: "photoCell")
    
    self.favoritesTableView.delegate = self
    self.favoritesTableView.dataSource = self
    //self.favoritesTableView.isHidden = true
    self.favoritesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "favCell")
    fetchBooks()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch tableView {
    /*
    case self.tweetTableView:
      return 30
 */
    case self.photosTableView:
      return 10
    case self.favoritesTableView:
      return 0
    default:
      return 10
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch tableView {
    
    case self.photosTableView:
      let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath)
      cell.textLabel?.text = "Photo \(indexPath.row)"
      return cell
      
    case self.favoritesTableView:
      let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)
      cell.textLabel?.text = "Fav \(indexPath.row)"
      return cell
      
    default:
      return UITableViewCell()
    }
  }
    
    func fetchBooks() {
            let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=subject:science%20fiction")
            let request = URLRequest(url: url!)
            let session = URLSession(
                configuration: URLSessionConfiguration.default,
                delegate: nil,
                delegateQueue:OperationQueue.main
            )
            let task : URLSessionDataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if let _ = data,
                    let responseDictionary = try! JSONSerialization.jsonObject( with: data!, options:[]) as? NSDictionary {
                    let items = responseDictionary["items"] as! [NSDictionary]
                    self.books = items.compactMap {
                        $0.value(forKeyPath: "volumeInfo.imageLinks.thumbnail") as? String
                    }
                    self.memoriesCollectionView?.reloadData()
                }
            });
            task.resume()
        }
     func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }


         func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 100
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            
            if !books.isEmpty {
                let imageView = UIImageView()
                imageView.setImageWith(URL(string: books[indexPath.item % books.count])!, placeholderImage: nil)
                imageView.frame = cell.frame
                cell.backgroundView = imageView
                cell.backgroundColor = UIColor.white
                let tapper = UITapGestureRecognizer(target: self, action: #selector(didTapImage(_:)))
                cell.addGestureRecognizer(tapper)
            }
            
            return cell
        }

    }

extension ViewController: TRMosaicLayoutDelegate {
    
    func collectionView(_ collectionView:UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath:IndexPath) -> TRMosaicCellType {
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return 150
    }
}
