//
//  FeedController.swift
//  InstagramFirestoneTutorial
//
//  Created by Nathaniel Faxon on 2/28/26.
//

import UIKit
import FirebaseAuth

private let reuseIdentifier = "Cell" // Helps with queueing/dequeueing cells in memory

class FeedController: UICollectionViewController {
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
            let controller = LoginController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        } catch {
            print("DEBUG: Failed to sign out")
        }
    }

    // MARK: - Helpers

    func configureUI() {
        collectionView.backgroundColor = .white

        // Register cell in collection view
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Temp logout button
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        navigationItem.title = "Feed"
    }
}

// MARK: - UICollectionViewDataSource

extension FeedController {
    /// Tells collection view how many cells to create
    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 10
    }

    /// Tells collection view how to create each cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
    /// Returns size of each collection view cell
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let width = view.frame.width
        
        var height = width + 8 + 40 + 8
        height += 50 // Height of image view
        height += 60
        
        return CGSize(width: width, height: height)
    }
}
