//
//  ItemSelectorViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 7/4/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework

class ItemSelectorViewController: UIViewController {
    deinit {
        print("deinit: ItemSelectorViewController is being deallocated")
    }
    let recipeId = UserDefaults.standard.value(forKey: "miam_mealplanner_recipeId") as? String ?? ""
    // Your SwiftUI View
    var swiftUIView: ItemSelector {
        return ItemSelector(
            recipeId: recipeId,
            onItemSelected: { [weak self] in
                // added small delay to ensure image reloads
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {
                    self?.navigationController?.popViewController(animated: true)
                }
            })
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<ItemSelector>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Retour", style: .plain, target: nil, action: nil)
        // Initialize the hosting controller with your SwiftUI view
        hostingController = UIHostingController(rootView: swiftUIView)
        // Add as a child of the current view controller
        addChild(hostingController)
        // Add the SwiftUI view to the view controller view hierarchy
        view.addSubview(hostingController.view)
        // Setup constraints to dictate the size and positioning of the SwiftUI view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        // Complete the addition of the child view controller
        hostingController.didMove(toParent: self)
    }
}
