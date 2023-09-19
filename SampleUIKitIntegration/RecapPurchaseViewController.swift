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
    var swiftUIView: MealPlannerRecapView<CoursesUMealPlannerRecapView> {
        return MealPlannerRecapView(
            template: CoursesUMealPlannerRecapView(
                // i believe onClose is depreciated as designers don't want x
                onClose: { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.navigationController?.popToRootViewController(animated: true)
            }),
            onTapGesture: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.navigationController?.popToRootViewController(animated: true)
            })
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerRecapView<CoursesUMealPlannerRecapView>>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Retour", style: .plain, target: nil, action: nil)
        hostingController = UIHostingController(rootView: swiftUIView)
        guard let hostingController = hostingController, let hcView = hostingController.view
        else { return }
        // Since hostingController is optional, using guard to safely unwrap its view
        hcView.translatesAutoresizingMaskIntoConstraints = false
        addChild(hostingController)
        view.addSubview(hcView)
        NSLayoutConstraint.activate([
            hcView.topAnchor.constraint(equalTo: view.topAnchor),
            hcView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hcView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hcView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        hostingController.didMove(toParent: self)
    }
}
