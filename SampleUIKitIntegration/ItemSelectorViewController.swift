//
//  ItemSelectorViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 7/4/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
//import CoursesUxMiamFramework

//class ItemSelectorViewController: UIHostingController<ItemSelector> {
//
//   required init?(coder aDecoder: NSCoder) {
////            let itemSelector = ItemSelector(recipeId: "", onItemSelected: {})
//            super.init(coder: aDecoder)
//        }
//
//        override init(rootView: ItemSelector) {
//            super.init(rootView: rootView)
//        }
//
//        public init() {
//            let itemSelector = ItemSelector(recipeId: "", onItemSelected: {})
//            super.init(rootView: itemSelector)
//        }
//
//        override func viewDidLoad() {
//            let recipeId = UserDefaults.standard.value(forKey: "miam_mealplanner_recipeId") as? String ?? ""
//
//            super.viewDidLoad()
//            self.title = "Mon assistant Budget repas"
//            let itemSelector = ItemSelector(recipeId: recipeId, onItemSelected: {
//                // added small delay to ensure image reloads
//                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {
//                    self.navigationController?.popViewController(animated: true)
//                }
//            })
//            self.rootView = itemSelector
//            // Do any additional setup after loading the view.
//        }
//    }

class ItemSelectorViewController: UIViewController {
    deinit {
        print("deinit: ItemSelectorViewController is being deallocated")
    }
    let recipeId = UserDefaults.standard.value(forKey: "miam_mealplanner_recipeId") as? String ?? ""
    // Your SwiftUI View
    var swiftUIView: ItemSelector {
        return ItemSelector(
            recipeId: recipeId,
            onItemSelected: {
                // added small delay to ensure image reloads
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) { [weak self] in
                    self?.navigationController?.popViewController(animated: true)
                }
            })
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<ItemSelector>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
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
