//
//  MovieListViewController.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 08.11.23.
//

import Foundation
import UIKit

protocol MovieListView: AnyObject {
    func reloadTableData()
}

class MovieListViewController: UITableViewController {

    // MARK: Proprties
    var presenter: MovieListPresenter?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.loadMovies()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: Setup

    private func setupViews() {
        view.backgroundColor = .white
    }
}

extension MovieListViewController: MovieListView {

    func reloadTableData() {
    }

}
