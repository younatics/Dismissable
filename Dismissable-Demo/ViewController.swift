//
//  ViewController.swift
//  FlexibleViewController-Demo
//
//  Created by Seungyoun Yi on 03/02/2019.
//  Copyright © 2019 Seungyoun Yi. All rights reserved.
//

import UIKit
import Dismissable

class ViewController: UIViewController, DismissTriggerUsable {
    
    var dismissInteractor: DismissInteractor = DismissInteractor()
    var dismissAnimator: DismissAnimator = DismissAnimator()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Custom Values
        dismissAnimator.transitionDuration = 0.35
        dismissAnimator.dimmedViewStartColor = UIColor.black.withAlphaComponent(0.4)
        dismissAnimator.dimmedViewEndColor = UIColor.black.withAlphaComponent(0)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.setup(dismissable: (self, dismissInteractor))
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
}
