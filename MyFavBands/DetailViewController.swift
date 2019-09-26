//
//  DetailViewController.swift
//  MyFavBands
//
//  Created by Bernard Slater on 9/24/19.
//  Copyright © 2019 Bernard Slater. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

   // @IBOutlet weak var detailDescriptionLabel: UILabel!

    
    @IBOutlet weak var productImageView: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if detailItem != nil  {
                    if let photo = productImageView {
                        photo.image = UIImage(named:detailItem!)
                    }
                }else{
                    productImageView.image = UIImage(named:"main.jpg")
                    title = "My Bands"
                }
            }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

