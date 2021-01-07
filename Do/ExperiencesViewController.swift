//
//  ExperiencesViewController.swift
//  Do
//
//  Created by Tom Nadarajan on 23/12/20.
//

import UIKit
import SnapKit
import BetterSegmentedControl
class ExperiencesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var control : BetterSegmentedControl!
    var headerView : ExperienceHeaderView!
    var organisationTable: UITableView!
    var currentMode: Int!
    var createText: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let discoverTitle = UILabel()
        discoverTitle.text = "discover"
        discoverTitle.font = UIFont(name: "Futura", size: 18.0)
        discoverTitle.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(discoverTitle)
        NSLayoutConstraint.activate([
            discoverTitle.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 8.0),
            discoverTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            discoverTitle.heightAnchor.constraint(equalToConstant: 20.0)
        ])
        currentMode = 0
        control = BetterSegmentedControl(frame: CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: 50), segments: LabelSegment.segments(withTitles: ["Popular", "For You"], normalFont: UIFont(name: "Futura", size: 16.0), normalTextColor: .black, selectedBackgroundColor: UIColor.orange, selectedFont: UIFont(name: "Futura-Bold", size: 16.0), selectedTextColor: .white), options: [.backgroundColor(UIColor.white), .indicatorViewBorderColor(UIColor.orange), .cornerRadius(15.0), .animationSpringDamping(1.0)])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.segmentPadding = 16.0
        self.view.addSubview(control)
        NSLayoutConstraint.activate([
            control.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 16.0),
            control.topAnchor.constraint(equalTo: discoverTitle.bottomAnchor, constant: 16.0)
        ])
        
        let collectionViewFrame = CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.85)
        organisationTable = UITableView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: collectionViewFrame))
        organisationTable.translatesAutoresizingMaskIntoConstraints = false
        organisationTable.delegate = self
        organisationTable.dataSource = self
        
        self.view.addSubview(organisationTable)
        NSLayoutConstraint.activate([
            organisationTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            organisationTable.topAnchor.constraint(equalTo: self.control.bottomAnchor, constant: 16.0),
            organisationTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            organisationTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])

        // Do any additional setup after loading the view.
        
        
        createText = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.25, height: 50))
        createText.backgroundColor = UIColor.black
        createText.setTitle("create +", for: UIControl.State.normal)
        createText.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        createText.layer.cornerRadius = 15.0
        createText.translatesAutoresizingMaskIntoConstraints = false
        createText.setTitleColor(UIColor.white, for: UIControl.State.normal)
        createText.titleLabel?.font = UIFont(name: "Futura-Bold", size: 14.0)
        self.view.addSubview(createText)
        NSLayoutConstraint.activate([
            createText.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -16.0),
            createText.centerYAnchor.constraint(equalTo: control.centerYAnchor, constant: 0.0)
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        /*
        organisationTable.tableHeaderView!.frame.size.height = organisationTable.tableHeaderView!.systemLayoutSizeFitting(CGSize(width: self.view.bounds.width - 32.0, height: 0)).height
 */
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let testView = UIView()
        testView.backgroundColor = UIColor.white
        let titleLabel = UILabel()
        testView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        switch section {
        case 0:
            titleLabel.text = "Trending Now"
        case 1:
            titleLabel.text = "Popular Near Me"
        case 2:
            titleLabel.text = "Popular with Friends"
        default:
            titleLabel.text = "This is a Placeholder"
        }
        titleLabel.font = UIFont(name: "Futura", size: 16.0)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: testView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: testView.centerYAnchor)
        ])
        return testView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return floor(self.view.frame.height / 5 / 8)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "tableCell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return floor(self.view.frame.height / 5)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
