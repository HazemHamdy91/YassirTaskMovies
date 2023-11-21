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
    // MARK: Views
    private let noDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "There is no Movies to show"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.loadMovies()
    }

    // MARK: Setup
    private func setupViews() {
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "Cell")
        title = "Trending Now"

        view.addSubview(noDataLabel)
        noDataLabel.isHidden = true

        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        // noDataLabelConstraints
        let noDataLabelConstraints: [NSLayoutConstraint] = [
            noDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            noDataLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ]
        view.addConstraints(noDataLabelConstraints)

        // activityIndicatorConstraints
        let activityIndicatorConstraints: [NSLayoutConstraint] = [
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ]
        view.addConstraints(activityIndicatorConstraints)
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movies = movies {
            presenter?.didSelect(movie: movies[indexPath.row])
        }
    }
}

extension MovieListViewController: MovieListView {
    func reloadTableData(movies: [Movie]?) {
        self.movies = movies
        noDataLabel.isHidden = true
        activityIndicator.isHidden = true
        tableView.reloadData()
    }

    func show(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Reload", style: .default, handler: { [weak self] _ in
            self?.presenter?.loadMovies()
            self?.activityIndicator.isHidden = false
        }))
        present(alert, animated: true, completion: nil)
    }

    func showNoDataLabel() {
        noDataLabel.isHidden = false
        activityIndicator.isHidden = true
    }
}
