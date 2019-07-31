//
//  ViewControllerExtension.swift
//  StormViewer
//
//  Created by Jeffrey Lai on 5/25/19.
//  Copyright © 2019 Talisman Mobile. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    //MARK: UITableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped Cell")
        if let vc = UIViewController() as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }

        let detailVC = DetailViewController()
        detailVC.selectedImage = pictures[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)

    }
}
