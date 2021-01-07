//
//  CategorySelectViewController.swift
//  Do
//
//  Created by Tom Nadarajan on 2/1/21.
//

import UIKit
import RAGTextField
class CategorySelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var categoryTable : UITableView!
    var textField: RAGTextField!
    var tempButton: UIButton!
    var taskLabel : UILabel!
    
    var taskTopConstraint: NSLayoutConstraint!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CategoryTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "tableCell")
        cell.label.text = "This is a Category"
        cell.descLabel.text = "This is a description."
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.textField.isHidden = false
        self.tempButton.isHidden = false
        let botAnchor = self.taskLabel.bottomAnchor.constraint(equalTo: self.textField.topAnchor, constant: -16.0)
        NSLayoutConstraint.deactivate([taskTopConstraint])
        NSLayoutConstraint.activate([botAnchor])
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()
            self.categoryTable.alpha = 0
            self.textField.alpha = 1
            self.tempButton.alpha = 1
        }, completion: {(finished: Bool) -> Void in
            self.categoryTable.isHidden = true
        })
        self.taskLabel.fadeTransition(0.4)
        self.taskLabel.text = "name your experience"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskLabel = UILabel(frame: .zero)
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.text = "choose a category"
        taskLabel.font = UIFont(name: "SF-Compact", size: 18.0)
        taskLabel.textColor = UIColor.black
        self.view.addSubview(taskLabel)
        taskTopConstraint = taskLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 16.0)
        NSLayoutConstraint.activate([
            taskLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16.0),
            taskTopConstraint
        ])
        categoryTable = UITableView(frame: .zero)
        
        categoryTable.translatesAutoresizingMaskIntoConstraints = false
        categoryTable.dataSource = self
        categoryTable.delegate = self
        self.view.addSubview(categoryTable)
        NSLayoutConstraint.activate([
            categoryTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            categoryTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            categoryTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            categoryTable.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 8.0)
        ])
        textField = RAGTextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.adjustsFontSizeToFitWidth = false
        textField.font = UIFont(name: "SF-Compact", size: 48.0)
        textField.textColor = UIColor.white
        textField.placeholderMode = RAGTextFieldPlaceholderMode.simple
        let bgView = UnderlineView(frame: .zero)
        bgView.textField = textField
        bgView.backgroundLineColor = UIColor.clear
        bgView.foregroundLineColor = UIColor.black
        bgView.foregroundLineWidth = 2.0
        bgView.expandDuration = 0.2
        bgView.backgroundColor = UIColor.lightGray
        bgView.layer.cornerRadius = 5.0
        textField.textBackgroundView = bgView
        self.view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 18.0),
            textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -18.0)
        ])
        textField.alpha = 0.0
        textField.isHidden = true
        // Do any additional setup after loading the view.
        
        tempButton = UIButton(frame: .zero)
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        tempButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        tempButton.setTitle("\u{2713}", for: UIControl.State.normal)
        tempButton.backgroundColor = UIColor.orange
        
        self.view.addSubview(tempButton)
        
        NSLayoutConstraint.activate([
            tempButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16.0),
            tempButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        tempButton.alpha = 0.0
        tempButton.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tempButton.layer.cornerRadius = tempButton.frame.size.width / 2
        tempButton.clipsToBounds = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
