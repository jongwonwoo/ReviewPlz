//
//  ViewController.swift
//  ReviewPlz
//
//  Created by Jongwon Woo on 19/02/2017.
//  Copyright © 2017 WooJongwon. All rights reserved.
//

import UIKit
import ReviewPlz

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func touchReviewButton(_ sender: Any) {
        let appID = "1177884800" // TODO: Use your app ID
        let daysLater = 7 // If a user touch 'No thanks' button, the view will be shown the days later.
        if let reviewController = ReviewPlzViewController.init(withAppId: appID, daysLater: daysLater) {
            self.present(reviewController, animated: false) {
            }
        }
    }
}

