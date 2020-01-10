//
//  ViewController.swift
//  DemoSimplexApps
//
//  Created by Kazim Walji on 1/10/20.
//  Copyright © 2020 HenryKazim. All rights reserved.
//

import UIKit
import Firebase
import GoogleMobileAds

var pass = ""
class ViewController: UIViewController, GADBannerViewDelegate {
   
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signUp: UIButton!
    var bannerView: GADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let adSize = GADAdSizeFromCGSize(CGSize(width: 300, height: 80))
        bannerView = GADBannerView(adSize: adSize)
        addBannerViewToView(bannerView)
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
             bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        
        Utilities.styleFilledButton(login)
        Utilities.styleFilledButton(signUp)
    }

      func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
          [NSLayoutConstraint(item: bannerView,
                              attribute: .bottom,
                              relatedBy: .equal,
                              toItem: bottomLayoutGuide,
                              attribute: .top,
                              multiplier: 1,
                              constant: 0),
           NSLayoutConstraint(item: bannerView,
                              attribute: .centerX,
                              relatedBy: .equal,
                              toItem: view,
                              attribute: .centerX,
                              multiplier: 1,
                              constant: 0)
          ])
       }
     func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
          bannerView.alpha = 1
        })
      }

       /// Tells the delegate an ad request failed.
       func adView(_ bannerView: GADBannerView,
           didFailToReceiveAdWithError error: GADRequestError) {
         print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
       }

       /// Tells the delegate that a full-screen view will be presented in response
       /// to the user clicking on an ad.
       func adViewWillPresentScreen(_ bannerView: GADBannerView) {
         print("adViewWillPresentScreen")
       }

       /// Tells the delegate that the full-screen view will be dismissed.
       func adViewWillDismissScreen(_ bannerView: GADBannerView) {
         print("adViewWillDismissScreen")
       }

       /// Tells the delegate that the full-screen view has been dismissed.
       func adViewDidDismissScreen(_ bannerView: GADBannerView) {
         print("adViewDidDismissScreen")
       }

       /// Tells the delegate that a user click will open another app (such as
       /// the App Store), backgrounding the current app.
       func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
         print("adViewWillLeaveApplication")
       }
   
    }
