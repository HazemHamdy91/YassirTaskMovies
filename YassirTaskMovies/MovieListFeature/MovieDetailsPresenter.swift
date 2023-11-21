//
//  MovieDetailsPresenter.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 20.11.23.
//

import Foundation

class MovieDetailsPresenter: NSObject {

    let viewDelegate: MovieDetailsView

    init(viewDelegate: MovieDetailsView) {
        self.viewDelegate = viewDelegate
    }

    func loadMoviesDetails(movie: Movie) {
        guard let movieID = movie.movieId else { return }
        NetworkManager.shared.loadMovieDetails(movieID: movieID,
                                               movieDetailsType: MovieDetails.self,
                                               completion: { [weak self] result in
            switch result {
            case .success(let movieDetails):
                    self?.viewDelegate.showMovieOverView(overview: movieDetails.overview ?? "No Overview Availabel")
            case .failure(_):
                    self?.viewDelegate.showMovieOverView(overview: "No Overview Availabel")
            }
        })
    }
}
