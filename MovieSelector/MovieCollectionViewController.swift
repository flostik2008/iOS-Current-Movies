//
//  MovieCollectionViewController.swift
//  MovieSelector
//
//  Created by Evgeny Vlasov on 12/30/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MovieCollectionViewController: UICollectionViewController {

    
    var nowPlaying = [Movie]()

    var movieTransitionDelegate = MovieTransitionDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    func loadData () {
        Movie.nowPlaying { (success:Bool, movieList:[Movie]?) in
            if success {
                self.nowPlaying = movieList!
                DispatchQueue.main.async {
                    self.collectionView!.reloadData()
                }
            }
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return nowPlaying.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
    
        let movie = nowPlaying[indexPath.row]
        cell.movieTitleLable.text = movie.title
        
        Movie.getImage(forCell: cell, withMovieObject: movie)
        
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showOverlayFor(indexPath: indexPath)
    }
    
    func showOverlayFor (indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let overlayVC = sb.instantiateViewController(withIdentifier: "Overlay") as! OverlayViewController
        
        transitioningDelegate = movieTransitionDelegate
        overlayVC.transitioningDelegate = movieTransitionDelegate
        overlayVC.modalPresentationStyle = .custom
        
        let movie = nowPlaying[indexPath.row]
        self.present(overlayVC, animated: true, completion: nil)
        overlayVC.movieItem = movie
        
    }
}














