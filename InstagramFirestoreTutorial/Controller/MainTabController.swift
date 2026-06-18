//
//  MainTabController.swift
//  InstagramFirestoneTutorial
//
//  Created by Nathaniel Faxon on 2/20/26.
//

import UIKit
import Firebase
import FirebaseAuth

class MainTabController: UITabBarController {
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        checkIfUserIsLoggedIn()
    }
    
    // MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }

    // MARK: - Helpers

    func configureViewControllers() {
        view.backgroundColor = .white

        let layout = UICollectionViewFlowLayout()
        let feed = TemplateNavigationController(unselectedImage: UIImage(named: "home_unselected")!, selectedImage: UIImage(named: "home_selected")!, rootViewController: FeedController(collectionViewLayout: layout))

        let search = TemplateNavigationController(unselectedImage: UIImage(named: "search_unselected")!, selectedImage: UIImage(named: "search_selected")!, rootViewController: SearchController())

        let imageSelector = TemplateNavigationController(unselectedImage: UIImage(named: "plus_unselected")!, selectedImage: UIImage(named: "plus_unselected")!, rootViewController: ImageSelectorController())

        let notifications = TemplateNavigationController(unselectedImage: UIImage(named: "like_unselected")!, selectedImage: UIImage(named: "like_selected")!, rootViewController: NotificationController())

        let profileLayout = UICollectionViewFlowLayout()
        let profile = TemplateNavigationController(unselectedImage: UIImage(named: "profile_unselected")!, selectedImage: UIImage(named: "profile_selected")!, rootViewController: ProfileController(collectionViewLayout: profileLayout))

        viewControllers = [feed, search, imageSelector, notifications, profile]

        tabBar.tintColor = .black
    }

    func TemplateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)

        nav.tabBarItem.image = unselectedImage

        nav.tabBarItem.selectedImage = selectedImage

        nav.navigationBar.tintColor = .black

        return nav
    }
}
