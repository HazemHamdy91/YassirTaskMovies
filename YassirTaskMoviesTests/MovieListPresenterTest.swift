//
//  MovieListPresenterTest.swift
//  YassirTaskMoviesTests
//
//  Created by Hazem  on 22.11.23.
//

import Foundation
import XCTest
@testable import YassirTaskMovies

class MovieListPresenterTest: BaseTestCase {

    func test_didSelectMovie() {

        given("MovieListCoordinatorExpectable instance with didStartLoginExpectation") {
            let expectation = XCTestExpectation(description: "didSelectMovie called")
            let expectableDelegate = MovieListCoorinatorExpectable.Builder()
                .withOnDidStartLoginExpectable(expectation: expectation)
                .build()
            let viewController = MovieListViewController()
            let presenter = MovieListPresenter(viewDelegate: viewController, delegate: expectableDelegate)
            let movie = Movie(title: "", releaseDate: "", movieId: 0, posterPath: "")
            when("calling didSelect") {
                presenter.didSelect(movie: movie)
                then("Expectation fullfilled") {
                    wait(for: [expectation], timeout: 0.1)
                }
            }
        }
    }
}
