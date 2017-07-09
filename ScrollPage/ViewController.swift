//
//  ViewController.swift
//  ScrollPage
//
//  Created by Chris Olson on 7/7/17.
//  Copyright © 2017 Chris Olson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(scrollView.panGestureRecognizer)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        // This function imports our images and appends them into a list called images
        for x in 0 ... 2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
           
            var newX : CGFloat = 0.0
            
            // Because we are scorlling horizontally, we are changing the postion of our images x value. This does just that
            newX = scrollView.frame.width / 2 + scrollView.frame.size.width * CGFloat(x)
            // This is the size of the invisible placeholder that our images are on and moves on.
            contentWidth += newX - 100
            
        
            // This adds our images to the scroll view
            scrollView.addSubview(imageView)
            
            
            
            // This sets the frame on the image
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
            
        scrollView.clipsToBounds = false
        // This is what creates the scrolling by telling our scroll view how long our content size is
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        }
    }
    
}

