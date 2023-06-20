//
//  MealViewController.swift
//  SampleUIKitIntegration
//
//  Created by Vincent Kergonna on 12/07/2022.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUIOSTemplate

class MealViewController: UIHostingController<CoursesUBudgetFormStandaloneWrapper> {
    // Initialize our controller with RecipeCardView as a root view and show
    // recipe 1.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: CoursesUBudgetFormStandaloneWrapper())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 0/255, green: 85/255, blue: 98/255, alpha: 1.0)
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = appearance
          navigationController?.navigationBar.compactAppearance = appearance
          navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = "Mon assistant Budget repas"
        navigationController?.navigationBar.backItem?.title = "     "
    }
}
