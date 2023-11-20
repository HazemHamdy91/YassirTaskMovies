//
//  ImageConfiguration.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 20.11.23.
//

import Foundation

public struct Image: Codable {
    public let config: Configuration?

    enum CodingKeys: String, CodingKey {
        case config = "images"
    }
}

public struct Configuration: Codable {
    public let baseURL: String?
    public let posterSizes: [String]?

    enum CodingKeys: String, CodingKey {
        case baseURL = "secure_base_url"
        case posterSizes = "poster_sizes"
    }
}
