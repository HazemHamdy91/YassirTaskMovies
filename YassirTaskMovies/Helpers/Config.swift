//
//  Config.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 20.11.23.
//

import Foundation

class Config {

    static let shared = Config()

    var imageConfiguration: Configuration?

    func loadImageConfiguration() {
        NetworkManager.shared.loadImageConfiguration { [weak self] result in
            switch result {
            case .success(let imageConfiguration):
                    self?.imageConfiguration = imageConfiguration.config
            case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    func imageBaseURL() -> String {
        guard let imageConfiguration = imageConfiguration,
              let baseURL = imageConfiguration.baseURL,
              let posterSizes = imageConfiguration.posterSizes
        else { return "" }
        // check first expected size inside returned posterSizes
        if posterSizes.contains("w500") {
            return baseURL + "w500"
        } else {
            return baseURL + (posterSizes.last ?? "")
        }
    }
}
