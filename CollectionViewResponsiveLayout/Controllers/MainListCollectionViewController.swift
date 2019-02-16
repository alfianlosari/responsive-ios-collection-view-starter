//
//  MainListCollectionViewController.swift
//  CollectionViewResponsiveLayout
//
//  Created by Alfian Losari on 2/8/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

private let listReuseIdentifier = "ListCell"
private let gridReuseIdentifier = "GridCell"

class MainListCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBarItem()
        setupLayout(with: view.bounds.size)
    }

    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "MovieLayoutListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: listReuseIdentifier)
        collectionView.register(UINib(nibName: "MovieLayoutGridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: gridReuseIdentifier)
    }
    
    private func setupLayout(with containerSize: CGSize) {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        collectionView.reloadData()
    }
    
    private func setupNavigationBarItem() {
        let barButtonItem = UIBarButtonItem(title: "Layout", style: .plain, target: self, action: #selector(layoutTapped(_:)))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func layoutTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Select Layout", message: nil, preferredStyle: .actionSheet)
        alertController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        alertController.addAction(UIAlertAction(title: "List", style: .default, handler: { (_) in

        }))
        
        alertController.addAction(UIAlertAction(title: "Large Grid", style: .default, handler: { (_) in

        }))
        
        alertController.addAction(UIAlertAction(title: "Small Grid", style: .default, handler: { (_) in

        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

