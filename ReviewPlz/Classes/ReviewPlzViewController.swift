//
//  ReviewPlzViewController.swift
//
//  Created by Jongwon Woo on 11/02/2017.
//  Copyright © 2017 Jongwon Woo. All rights reserved.
//

import UIKit

public class ReviewPlzViewController: UIViewController {
    fileprivate let haveReviewedKey = "haveReviewed"
    fileprivate let lastDateForAskingReviewKey = "lastDateForAskingReview"
    var appID: String = ""
    
    @IBOutlet weak var reviewAlertView: ReviewAlertView!
    
    public init?(withAppId appID: String, daysLater: Int) {
        let podBundle = Bundle(for: ReviewPlzViewController.self)
        super.init(nibName: "\(ReviewPlzViewController.self)", bundle: podBundle)
        
        if !canOpenReviewGuide(daysLater: daysLater) {
            return nil
        }
        
        self.appID = appID
        
        self.modalPresentationStyle = .overCurrentContext;
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        initReviewAlertView()
    }
    
    func initReviewAlertView() {
        self.reviewAlertView.agreeHandler = {
            self.reviewed()
            self.openAppStore()
            self.dismiss(animated: false, completion: {})
        }
        
        self.reviewAlertView.notAgreeHandler = {
            self.writeLastDateForAskingReview()
            self.dismiss(animated: false, completion: {})
        }
    }
}

extension ReviewPlzViewController {
    fileprivate func canOpenReviewGuide(daysLater: Int) -> Bool {
        let defaults = UserDefaults.standard
        let haveReviewed = defaults.bool(forKey: haveReviewedKey)
        if haveReviewed {
            return false
        }
        
        if let lastDate = defaults.object(forKey: lastDateForAskingReviewKey) as? Date {
            let theDay = lastDate.addDays(daysLater)
            let today = Date()
            if today.isLessThanDate(theDay) {
                return false
            }
        }
        
        return true
    }
    
    fileprivate func openAppStore() {
        func open(url: URL) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    print("Open \(url): \(success)")
                })
            } else {
                if UIApplication.shared.openURL(url) {
                    print("Open \(url): success")
                }
            }
        }
        
        
        if let checkURL = URL(string: "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(appID)&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8") {
            open(url: checkURL)
        } else {
            print("invalid url")
        }
    }
    
    fileprivate func reviewed() {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: haveReviewedKey)
        defaults.synchronize()
    }
    
    fileprivate func writeLastDateForAskingReview() {
        let defaults = UserDefaults.standard
        defaults.set(Date(), forKey: lastDateForAskingReviewKey)
        defaults.synchronize()
    }
}

extension Date {
    func isLessThanDate(_ dateToCompare: Date) -> Bool {
        return self.compare(dateToCompare) == ComparisonResult.orderedAscending
    }
    
    func addDays(_ daysToAdd: Int) -> Date {
        let secondsInDays = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded = self.addingTimeInterval(secondsInDays)
        return dateWithDaysAdded
    }
}
