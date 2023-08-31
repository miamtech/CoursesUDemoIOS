//
//  RecapPurchaseViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUxMiamFramework

class RecapPurchaseViewController: UIViewController {
    deinit {
        print("deinit: RecapPurchaseViewController is being deallocated")
    }
    // Your SwiftUI View
    var swiftUIView: MealPlannerRecapView<CoursesUMealPlannerRecapView> {
        return MealPlannerRecapView(
            template: CoursesUMealPlannerRecapView(
                // i believe onClose is depreciated as designers don't want x
                onClose: { [weak self] in
                    self?.navigationController?.popToRootViewController(animated: true)
            }),
            onTapGesture: { [weak self] in
                self?.navigationController?.popToRootViewController(animated: true)
            })
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerRecapView<CoursesUMealPlannerRecapView>>!

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
