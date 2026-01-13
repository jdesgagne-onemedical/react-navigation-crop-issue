// Copyright © 2025 1Life Healthcare, Inc. All rights reserved.

import UIKit
import React
import React_RCTAppDelegate
import ReactAppDependencyProvider

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // Create window
        window = UIWindow(frame: UIScreen.main.bounds)

        // Create tab bar controller
        let tabBarController = UITabBarController()

        // Create 5 tabs
        let tab1 = createPlaceholderViewController(title: "Home", systemImage: "house.fill")
        let tab2 = createReactNativeTab()
        let tab3 = createReactNavigationTab()

        tabBarController.viewControllers = [tab1, tab2, tab3]
        tabBarController.tabBar.isTranslucent = false

        // Set tab bar controller as root
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }

    private func createReactNativeTab() -> UIViewController {
        let reactVC = ReactNativeViewController(
            for: "RNNavigationCropIssue",
            initialProps: nil
        )
        reactVC.title = "React"
        
        let navigationController = UINavigationController(rootViewController: reactVC)
        navigationController.tabBarItem = UITabBarItem(
            title: "React",
            image: UIImage(systemName: "atom"),
            selectedImage: UIImage(systemName: "atom")
        )
        
        return navigationController
    }

    private func createReactNavigationTab() -> UIViewController {
        let reactNavVC = ReactNativeViewController(
            for: "ReactNavigationScreen",
            initialProps: nil
        )
        reactNavVC.title = "RN Navigation"
        
        let navigationController = UINavigationController(rootViewController: reactNavVC)
        navigationController.navigationBar.isHidden = true
        navigationController.tabBarItem = UITabBarItem(
            title: "RN Nav",
            image: UIImage(systemName: "arrow.triangle.branch"),
            selectedImage: UIImage(systemName: "arrow.triangle.branch")
        )
        
        return navigationController
    }

    private func createPlaceholderViewController(title: String, systemImage: String) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBackground
        viewController.title = title

        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        ])

        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: systemImage),
            selectedImage: UIImage(systemName: systemImage)
        )

        return viewController
    }
}
