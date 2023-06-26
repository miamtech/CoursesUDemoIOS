//
//  BaseViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/26/23.
//

import UIKit
import SwiftUI
class CustomUIHostingController<Content: View>: UIHostingController<Content> {
    var imageView: UIImageView?

    override init(rootView: Content) {
        super.init(rootView: rootView)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if imageView == nil {
            // Create an image view with your image
            let imageView = UIImageView(image: UIImage(named: "WhiteWave"))
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false

            // Add the image view to the view controller's view
            self.view.insertSubview(imageView, at: 0)

            // Set up constraints to position and size your image
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2)
            ])

            // Store imageView for later use if needed
            self.imageView = imageView
        }
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()

           // Make sure the imageView is at the back of the view stack
        self.view.sendSubviewToBack(imageView!)
       }

    
    func configureBackground(imageName: String) {
            self.imageView?.image = UIImage(named: imageName)
        }
}
