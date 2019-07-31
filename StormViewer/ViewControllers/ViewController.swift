//
//  ViewController.swift
//  StormViewer
//
//  Created by Jeffrey Lai on 5/23/19.
//  Copyright © 2019 Talisman Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Variables
    var pictures = [String]()
    let picturesTableView = UITableView()
    let navBarTitle: String = "Storm Viewer"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFiles()
        setupNavigationBar()
        setupConstraints()
    }

    func setupFiles() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                //Picture to load
                pictures.append(item)
            }
        }
        print(pictures)
    }

    func setupNavigationBar() {
        //Navigation Bar Setup
        self.navigationItem.title = navBarTitle
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = _ColorLiteralType(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 0.7)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:_ColorLiteralType(red: 1, green: 1, blue: 1, alpha: 1)]
    }

    func setupConstraints() {
        //TableView Setup
        picturesTableView.dataSource = self
        picturesTableView.delegate = self
        picturesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "pictureCell")

        view.addSubview(picturesTableView)

        picturesTableView.translatesAutoresizingMaskIntoConstraints = false
        picturesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        picturesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picturesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        picturesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true

    }

}



