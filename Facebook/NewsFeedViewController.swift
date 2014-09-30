//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Lauren Tsung on 9/4/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\ltsung. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var examplePhoto: UIImageView!
    var isPresenting: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSizeMake(320, 2160)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func tappedPhoto(sender: UITapGestureRecognizer) {
        println("tapped photo")
        performSegueWithIdentifier("photoView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        
        if (segue.identifier == "photoView") {
            var destinationViewController = segue.destinationViewController as FeedPhotoViewController
            
            
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
            
            destinationViewController.image = self.examplePhoto.image

        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        var tempImageView = UIImageView(image: self.examplePhoto.image)
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            var window = UIApplication.sharedApplication().keyWindow
    
            
        
            tempImageView.contentMode = UIViewContentMode.ScaleAspectFill
            
            tempImageView.frame.size = CGSizeMake(154.0, 157.0)
            
            tempImageView.frame.origin.x = 4
            tempImageView.frame.origin.y = 190
            tempImageView.clipsToBounds = true
            

            
            window.addSubview(tempImageView)
            self.examplePhoto.hidden = true
            
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
               
                toViewController.view.alpha = 1
                
                tempImageView.frame.origin.x += 75
                tempImageView.frame.origin.y += 20

                tempImageView.clipsToBounds = false
                
                tempImageView.transform = CGAffineTransformMakeScale(2, 2)


                }) { (finished: Bool) -> Void in
                    tempImageView.removeFromSuperview()
                    transitionContext.completeTransition(true)
            }

           

            
        } else {
  
            self.examplePhoto.hidden = false

            
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                println("Dismissing feed photo view controller")
                
                //fromViewController.view.alpha = 0
                
                containerView.backgroundColor = UIColor(white: 0, alpha: 0)
                
                containerView.frame.size = CGSizeMake(154.0, 230.0)
                containerView.frame.origin.x = 4
                containerView.frame.origin.y = 145
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
}
