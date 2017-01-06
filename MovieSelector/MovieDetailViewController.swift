//
//  MovieDetailViewController.swift
//  MovieSelector
//
//  Created by Evgeny Vlasov on 1/4/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit
import MovieSelectorBridge

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    
    var movieObject: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    func configureView () {
        movieTitle.text = movieObject.title
        movieDescription.text = movieObject.description
        
        if let availableImage = Movie.getImage(forMovie: movieObject) {
            movieImageView.image = availableImage
        }
    }
    

}








