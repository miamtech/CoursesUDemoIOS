//
//  CatalogViewController.swift
//  CoursesUDemo
//
//  Created by Diarmuid McGonagle on 07/02/2024.
//

import UIKit
import MealzNavModuleIOS

class CatalogFeatureViewController: UINavigationController {
    
    var rootCoordinator: CatalogFeatureNavCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
            let coordinator = CatalogFeatureNavCoordinator(
                baseConstructor: MealzBaseNavCoordinator.Constructor(
                    navigationController: self
                ))
            
            self.rootCoordinator = coordinator
            self.rootCoordinator?.showCatalog()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
