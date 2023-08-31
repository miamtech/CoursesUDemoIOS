//
//  MealViewController.swift
//  SampleUIKitIntegration
//
//  Created by Vincent Kergonna on 12/07/2022.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUxMiamFramework

class MealPlannerFormViewController: UIViewController {
    deinit {
        print("deinit: MealPlannerFormViewController is being deallocated")
    }
    // Your SwiftUI View
    var swiftUIView: MealPlannerFormView<CoursesUMealPlannerForm> {
        return MealPlannerFormView(
            budgetForm: CoursesUMealPlannerForm(),
            budgetInfos: nil,
            onBudgetValidated: { [weak self] recipe in
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(MealPlannerViewController(), animated: true)
                }
            })
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerFormView<CoursesUMealPlannerForm>>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0/255, green: 85/255, blue: 98/255, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor.white
        
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
