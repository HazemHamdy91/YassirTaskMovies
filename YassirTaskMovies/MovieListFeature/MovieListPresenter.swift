//
//  MovieListPresenter.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 08.11.23.
//

import Foundation

protocol MovieListPresenterDelegate: AnyObject {
    func didSelect(movie: String)
}

class MovieListPresenter: NSObject {

    let viewDelegate: MovieListView
    weak var delegate: MovieListPresenterDelegate?

    init(viewDelegate: MovieListView, delegate: MovieListPresenterDelegate?) {
        self.viewDelegate = viewDelegate
        self.delegate = delegate
    }

    func loadMovies() {
        NetworkManager.shared.loadMovies(movieListType: MovieResult.self) { [weak self] result in
            switch result {
            case .success(let movieResult):
                    if movieResult.movies?.count == 0 {
                        self?.viewDelegate.showNoDataLabel()
                    } else {
                        self?.viewDelegate.reloadTableData(movies: movieResult.movies)
                    }
            case .failure(let error):
                    self?.viewDelegate.show(errorMessage: error.localizedDescription)
            }
        }
    }
}
