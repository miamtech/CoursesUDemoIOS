//
//  RecapPurchaseViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUIOSTemplate

class RecapPurchaseViewController: UIHostingController<BudgetRecapView<CoursesURecapView>> {
    
    
    required init?(coder aDecoder: NSCoder) {
        let recapPurchase = BudgetRecapView.init(
            template: CoursesURecapView(),
            onTapGesture: {}
        )
        super.init(coder: aDecoder, rootView: recapPurchase)
    }
    
    override init(rootView: BudgetRecapView<CoursesURecapView>) {
        super.init(rootView: rootView)
    }
    
    public init() {
        let recapPurchase = BudgetRecapView.init(
            template: CoursesURecapView(),
            onTapGesture: {}
        )
        super.init(rootView: recapPurchase)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        let recapPurchase = BudgetRecapView.init(
            template: CoursesURecapView(),
            onTapGesture: {}
        )
        self.rootView = recapPurchase
        // Do any additional setup after loading the view.
    }
}
