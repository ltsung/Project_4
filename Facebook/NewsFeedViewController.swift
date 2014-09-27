//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Lauren Tsung on 9/4/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\ltsung. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var examplePhoto: UIImageView!
    
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
        var destinationViewController = segue.destinationViewController as FeedPhotoViewController
        
        destinationViewController.image = self.examplePhoto.image
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
