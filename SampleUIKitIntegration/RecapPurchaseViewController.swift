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

//class RecapPurchaseViewController: UIHostingController<MealPlannerRecapView<CoursesUMealPlannerRecapView>> {
//
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
//    override init(rootView: MealPlannerRecapView<CoursesUMealPlannerRecapView>) {
//        super.init(rootView: rootView)
//    }
//
//    public init() {
//        let recapPurchase = MealPlannerRecapView.init(
//            template: CoursesUMealPlannerRecapView(onClose: {}),
//            onTapGesture: {}
//        )
//        super.init(rootView: recapPurchase)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "Mon assistant Budget repas"
//        let recapPurchase = MealPlannerRecapView.init(
//            template: CoursesUMealPlannerRecapView(
//                onClose: {
//                    print("closing")
//            }),
//            onTapGesture: {
//                print("promoting")
//            }
//        )
//        self.rootView = recapPurchase
//        // Do any additional setup after loading the view.
//    }
//}

class RecapPurchaseViewController: UIViewController {
    deinit {
        print("deinit: RecapPurchaseViewController is being deallocated")
    }
    // Your SwiftUI View
    var swiftUIView: MealPlannerRecapView<CoursesUMealPlannerRecapView> {
        return MealPlannerRecapView(
            template: CoursesUMealPlannerRecapView(
                onClose: { [weak self] in
                    self?.navigationController?.popToRootViewController(animated: true)
            }),
            onTapGesture: {
                print("promoting")
            })
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerRecapView<CoursesUMealPlannerRecapView>>!

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
