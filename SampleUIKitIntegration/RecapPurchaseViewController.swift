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

class RecapPurchaseViewController: UIHostingController<MealPlannerRecapView<CoursesUMealPlannerRecapView>> {


    required init?(coder aDecoder: NSCoder) {
        let recapPurchase = MealPlannerRecapView.init(
            template: CoursesUMealPlannerRecapView(),
            onOurPromotions: {},
            onClose: {}
        )
        super.init(coder: aDecoder, rootView: recapPurchase)
    }

    override init(rootView: MealPlannerRecapView<CoursesUMealPlannerRecapView>) {
        super.init(rootView: rootView)
    }

    public init() {
        let recapPurchase = MealPlannerRecapView.init(
            template: CoursesUMealPlannerRecapView(),
            onOurPromotions: {},
            onClose: {}
        )
        super.init(rootView: recapPurchase)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        let recapPurchase = MealPlannerRecapView.init(
            template: CoursesUMealPlannerRecapView(),
            onOurPromotions: {
                print("promoting")
            },
            onClose: {
                print("closing")
            }
        )
        self.rootView = recapPurchase
        // Do any additional setup after loading the view.
    }
}
