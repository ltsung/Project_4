//
//  FeedPhotoViewController.swift
//  Facebook
//
//  Created by Lauren Tsung on 9/27/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\ltsung. All rights reserved.
//

import UIKit

class FeedPhotoViewController: UIViewController, UIScrollViewDelegate {

    var image: UIImage!
    
    @IBOutlet var theView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var actionButtons: UIImageView!
    
    var alphaCount: CGFloat!
    
    var dismissedModal: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
        scrollView.contentSize = imageView.image!.size
        scrollView.delegate = self
        
        alphaCount = 1.0
        
        dismissedModal = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dismissViewController(sender: AnyObject) {
        println("dismiss")
        doneButton.alpha = 0
        actionButtons.alpha = 0
        theView.backgroundColor = UIColor(white: 0, alpha: 0)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        
        alphaCount = alphaCount - 0.05
        
        theView.backgroundColor = UIColor(white: 0, alpha: alphaCount)
        
        
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        println("fade out the buttons")
        
        
        doneButton.alpha = 0
        actionButtons.alpha = 0
    }

    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
      
        println("content offset \(scrollView.contentOffset.y)")
            
        
        if (scrollView.contentOffset.y < -100) {
            println("Dismiss me")
              alphaCount = 0
            
            dismissViewControllerAnimated(true, completion: nil)
            dismissedModal = true
        }
        else {
            println("Not enough for treshold")
            doneButton.alpha = 1
            actionButtons.alpha = 1
            
            alphaCount = 1.0
        }

    
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        
        if (!dismissedModal) {
            theView.backgroundColor = UIColor(white: 0, alpha: 1)
        }
        else {
            theView.backgroundColor = UIColor(white: 0, alpha: 0)
        }
    }
   
}
