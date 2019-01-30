//
//  ViewController.swift
//  Watermarks
//
//  Created by Prashant G on 1/28/19.
//  Copyright © 2019 Prashant G. All rights reserved.
//

import UIKit
import MediaWatermark

class ViewController: UIViewController {
    
    @IBOutlet var baseImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        let url = URL(string: "https://images.unsplash.com/photo-1502261159926-e31d770eb6e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2681&q=80")
        
        let item = MediaItem(image: baseImageView.image!)
        
        let logoImage = UIImage(named: "watermark")
        
        let firstElement = MediaElement(image: logoImage!)
        firstElement.type = .image
        firstElement.frame = CGRect(x: 200, y: 200, width: 400, height: 400)
        
        item.add(elements: [firstElement])
        
        let mediaProcessor = MediaProcessor()
        mediaProcessor.processElements(item: item) { [weak self] (result, error) in
            self?.baseImageView.image = result.image
        }
    }
}

