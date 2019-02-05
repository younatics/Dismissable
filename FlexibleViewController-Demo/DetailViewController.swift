//
//  DetailViewController.swift
//  FlexibleViewController-Demo
//
//  Created by Seungyoun Yi on 03/02/2019.
//  Copyright © 2019 Seungyoun Yi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var interactor:Interactor? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(pangestureClicked))
        panGesture.delegate = self
        self.view.addGestureRecognizer(panGesture)
    }
    
    
    @objc func pangestureClicked(_ sender: UIPanGestureRecognizer) {
        let percentThreshold:CGFloat = 0.3
        
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        print("progress: \(progress)")
        guard let interactor = interactor else { return }
        
        switch sender.state {
        case .began:
            interactor.hasStarted = true
            dismiss(animated: true, completion: nil)
        case .changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finish()
                : interactor.cancel()
        default:
            break
        }
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

extension DetailViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
extension DetailViewController: UITableViewDelegate {
    
}
