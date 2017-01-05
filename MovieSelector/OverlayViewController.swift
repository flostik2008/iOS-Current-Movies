//
//  OverlayViewController.swift
//  MovieSelector
//
//  Created by Evgeny Vlasov on 1/4/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var movieItem:Movie!
    
    
    func configureView() {
        if let movie = self.movieItem {
            self.titleLabel.text = movie.title
            self.descriptionTextView.text = movie.description
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
        /*
     override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.bounds.size = CGSize(width: UIScreen.main.bounds.size.width-20, height: 200)
        
        self.view.layer.cornerRadius = 5
        
        descriptionTextView.setContentOffset(CGPoint.zero, animated: false)
        titleLabel.lineBreakMode = .byTruncatingMiddle;

    }
         */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    /*
    @IBAction func closePressed(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    */
    
}
