//
//  ViewController.swift
//  FilterImageApp
//
//  Created by Anurag kumar dwivedi on 11/11/17.
//  Copyright © 2017 Anurag kumar dwivedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    // create a place to render the filtered image
    let context = CIContext(options: nil)
    
    @IBAction func ApplyFilter(_ sender: AnyObject) {
        // create an image to a filter
        let inputImage = CIImage(image: photoImageView.image!)
        
        // create a random color to pass to a filter
        let randomcolor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        
        // Apply a filter to the imag
        
        let filteredImage = inputImage?.applyingFilter("CIHueAdjust", parameters: randomcolor)
        
        // Render the filtered image
        
        let renderedImage = context.createCGImage(filteredImage!, from: filteredImage!.extent)
        
        // reflect the change back in interface
        
        photoImageView.image = UIImage(cgImage: renderedImage!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

