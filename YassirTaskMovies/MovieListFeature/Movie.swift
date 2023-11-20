//
//  Movie.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 12.11.23.
//

import Foundation

public struct MovieResult: Codable {

    public let movies: [Movie]?

    enum CodingKeys: String, CodingKey {
           case movies = "results"
       }

}

public struct Movie: Codable {

    public let title: String?
    public let releaseDate: String?
    public let movieId: Int?
    public let posterPath: String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case releaseDate = "release_date"
        case movieId = "id"
        case posterPath = "poster_path"
    }

    public func apadtedReleaseYear() -> String? {
        guard let releaseDate = releaseDate else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "YYYY-MM-dd"
        guard let date = dateFormatter.date(from: releaseDate) else { return "" }
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: date)
    }
}
