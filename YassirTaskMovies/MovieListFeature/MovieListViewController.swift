//
//  MovieListViewController.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 08.11.23.
//

import Foundation
import UIKit

class MovieListViewController: UITableViewController {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Setup
    
    private func setupViews() {
        view.backgroundColor = .white
    }
}
