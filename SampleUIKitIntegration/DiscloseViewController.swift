//
//  DiscloseViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/28/23.
//

import UIKit
import MiamIOSFramework
import CoursesUIOSTemplate
import SwiftUI

class DiscloseViewController: UIViewController {
    
    @IBOutlet weak var actionButton: UIButton!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Styling
//        self.view.backgroundColor = UIColor.white
//        self.actionButton.backgroundColor = UIColor.red
//        self.actionButton.setTitleColor(UIColor.white, for: .normal)
//
//        // Your SwiftUI Button
//        let coursesUMealPlannerCallToAction = CoursesUMealPlannerCallToAction()
//        let coursesUMealPlannerCallToActionView = coursesUMealPlannerCallToAction.content {
//            print("CoursesUMealPlannerCallToAction tapped!")
//        }
//
//        // Create a UIHostingController with coursesUMealPlannerCallToActionView
//        let hostingController = UIHostingController(rootView: coursesUMealPlannerCallToActionView)
//
//        // Add the hostingController as a child view controller
//        self.addChild(hostingController)
//
//        // Add hostingController's view to the current view
//        self.view.addSubview(hostingController.view)
//
//        // Set hostingController's view size and position
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            hostingController.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            hostingController.view.topAnchor.constraint(equalTo: self.actionButton.bottomAnchor, constant: 20),
//            hostingController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            hostingController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        ])
//
//        // Notify the hostingController that it has been moved to the current view controller
//        hostingController.didMove(toParent: self)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styling
        self.view.backgroundColor = UIColor.white
        
        // Remove the old UIKit button
        self.actionButton.removeFromSuperview()

        // Your SwiftUI Button
        let coursesUMealPlannerCallToAction = CoursesUMealPlannerCallToAction()
        let coursesUMealPlannerCallToActionView = coursesUMealPlannerCallToAction.content {
            print("CoursesUMealPlannerCallToAction tapped!")
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(MealPlannerFormViewController(), animated: true)
            }
        }
        
        // Create a UIHostingController with coursesUMealPlannerCallToActionView
        let hostingController = UIHostingController(rootView: coursesUMealPlannerCallToActionView)
        
        // Add the hostingController as a child view controller
        self.addChild(hostingController)
        
        // Add hostingController's view to the current view
        self.view.addSubview(hostingController.view)
        
        // Set hostingController's view size and position
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            hostingController.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        // Notify the hostingController that it has been moved to the current view controller
        hostingController.didMove(toParent: self)
    }

}

