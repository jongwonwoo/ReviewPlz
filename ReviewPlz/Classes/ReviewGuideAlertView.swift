//
//  ReviewGuideView.swift
//  LivePhotoPlayground
//
//  Created by Jongwon Woo on 11/02/2017.
//  Copyright © 2017 Jongwon Woo. All rights reserved.
//

import UIKit

class ReviewGuideAlertView: UIView {

    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var laterButton: UIButton!
    
    var agreeHandler: (() -> Swift.Void)?
    var notAgreeHandler: (() -> Swift.Void)?
    
    @IBAction func touchReviewButton(_ sender: Any) {
        guard let callback = self.agreeHandler else { return }
        
        callback()
    }
    
    @IBAction func touchLaterButton(_ sender: Any) {
        guard let callback = self.notAgreeHandler else { return }
        
        callback()
    }
    
}
