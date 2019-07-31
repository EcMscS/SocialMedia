//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Jeffrey Lai on 5/23/19.
//  Copyright © 2019 Talisman Mobile. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let displayedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()

        if let imageToLoad = selectedImage {
            displayedImageView.image = UIImage(named: imageToLoad)
        }

        setupContraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.hidesBarsOnTap = false
    }

    private func setupNavigationBar() {
        navigationItem.title = selectedImage
        
        //Add Navigation Right BarButton Item - Action Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }

    private func setupContraints() {

        view.addSubview(displayedImageView)

        displayedImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        displayedImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        displayedImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        displayedImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

    }
    
    @objc private func shareTapped() {
        //Shows icons for AcivityViewController
        guard let image = displayedImageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No Image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }


}
