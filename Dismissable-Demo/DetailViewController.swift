//
//  DetailViewController.swift
//  FlexibleViewController-Demo
//
//  Created by Seungyoun Yi on 03/02/2019.
//  Copyright © 2019 Seungyoun Yi. All rights reserved.
//

import UIKit
import Dismissable

class DetailViewController: DismissableUIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
    }
    
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "first")
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "second")
            return cell!
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "third")
            return cell!

        default:
            return UITableViewCell()
        }
    }
}
