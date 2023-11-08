//
//  MovieListCoordinator.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 08.11.23.
//

import Foundation
import UIKit

public class MovieListCoordinator {
    // MARK: Properties
    var rootViewController = UINavigationController()
    var movieListViewController: MovieListViewController
    
    // MARK: Init
    public init(title: String) {
        // initiate NavigationController and movielistViewController
        movieListViewController = MovieListViewController()
        rootViewController.navigationItem.title = title
    }

    // MARK: Start
    public func start() {
        // Setup movieListViewController as root vc of the navigation
        rootViewController = UINavigationController(rootViewController: movieListViewController)
        movieListViewController.navigationItem.largeTitleDisplayMode = .always
    }
    
}
