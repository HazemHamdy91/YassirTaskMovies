//
//  MovieListCoorinatorExpectable.swift
//  YassirTaskMoviesTests
//
//  Created by Hazem  on 22.11.23.
//

import Foundation
import XCTest
@testable import YassirTaskMovies

class MovieListCoorinatorExpectable: MovieListPresenterDelegate {

    fileprivate var onDidSelectMoviewExpectation: XCTestExpectation?

    func didSelect(movie: Movie) {
        onDidSelectMoviewExpectation?.fulfill()
    }

    fileprivate init() { }

    class Builder {

        let delegate = MovieListCoorinatorExpectable()

        func withOnDidStartLoginExpectable(expectation: XCTestExpectation) -> Builder {
            delegate.onDidSelectMoviewExpectation = expectation
            return self
        }

        func build() -> MovieListCoorinatorExpectable {
            return delegate
        }

    }

}
