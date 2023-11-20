//
//  MovieListViewController.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 08.11.23.
//

import Foundation
import UIKit

protocol MovieListView: AnyObject {
    func reloadTableData(movies: [Movie]?)
    func show(errorMessage: String)
    func showNoDataLabel()
}

class MovieListViewController: UITableViewController {

    // MARK: Proprties
    var presenter: MovieListPresenter?
    var movies: [Movie]?
    private let noDataLabel = UILabel()

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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "Cell")

        // noDataLabel
        noDataLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        noDataLabel.translatesAutoresizingMaskIntoConstraints = false
        noDataLabel.numberOfLines = 0
        noDataLabel.text = "There is no Movies to show"
        noDataLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(noDataLabel)
        noDataLabel.isHidden = true

        // noDataLabelConstraints
        let noDataLabelConstraints: [NSLayoutConstraint] = [
            noDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            noDataLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ]
        view.addConstraints(noDataLabelConstraints)
    }

    // MARK: UITableViewDataSource, UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MovieTableViewCell,
              let movies = movies
        else { return UITableViewCell() }
        cell.configureCell(with: movies[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension MovieListViewController: MovieListView {
    func reloadTableData(movies: [Movie]?) {
        self.movies = movies
        noDataLabel.isHidden = true
        tableView.reloadData()
    }

    func show(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Reload", style: .default, handler: { [weak self] _ in
            self?.presenter?.loadMovies()
        }))
        present(alert, animated: true, completion: nil)
    }

    func showNoDataLabel() {
        self.noDataLabel.isHidden = false
    }
}
