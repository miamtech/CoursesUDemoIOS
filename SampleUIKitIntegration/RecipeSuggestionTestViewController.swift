//
//  RecipeSuggestionTestViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/26/23.
//

import UIKit
import miamCore
import MiamIOSFramework
import SwiftUI

class RecipeSuggestionTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let suggestionsCriteria = SuggestionsCriteria(
            shelfIngredientsIds: ["99142453"],
            currentIngredientsIds:nil,
            basketIngredientsIds: nil,
            groupId: nil
        )

        let recipeCardView = RecipeCardView(criteria: suggestionsCriteria, showMealIdeaTag: false)
        let mealIdeasHostingController = UIHostingController(rootView: recipeCardView)
        mealIdeasHostingController.willMove(toParent: self)
        view.addSubview(mealIdeasHostingController.view)
        mealIdeasHostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint.init(item: mealIdeasHostingController.view!,
                                                   attribute: .leading, relatedBy: .equal, toItem: view,
                                                   attribute: .leadingMargin, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint.init(item: mealIdeasHostingController.view!,
                                                   attribute: .top, relatedBy: .equal, toItem: view,
                                                   attribute: .topMargin, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint.init(item: mealIdeasHostingController.view!,
                                                   attribute: .trailing, relatedBy: .equal, toItem: view,
                                                   attribute: .trailingMargin, multiplier: 1.0, constant: 0.0))
        mealIdeasHostingController.didMove(toParent: self)
    }
}
