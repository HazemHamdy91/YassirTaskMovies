//
//  MovieTableViewCell.swift
//  YassirTaskMovies
//
//  Created by Hazem  on 20.11.23.
//

import Foundation
import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {

    // MARK: Private

    private let nameLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let clubImageView = UIImageView()

    // MARK: Interface

    func configureCell(with movie: Movie) {

        nameLabel.text = movie.title
        releaseDateLabel.text = movie.apadtedReleaseYear()
        let imageURLString = Config.shared.imageBaseURL() + (movie.posterPath ?? "")
        if let imageURL = URL(string: imageURLString) {
            self.clubImageView.af.setImage(withURL: imageURL)
        }
    }

    // MARK: Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // nameLabel
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true

        // releaseDateLabel
        releaseDateLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false

        // clubImageView
        clubImageView.translatesAutoresizingMaskIntoConstraints = false
        clubImageView.contentMode = .scaleAspectFit

        addSubview(nameLabel)
        addSubview(releaseDateLabel)
        addSubview(clubImageView)

        setupConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Constraints

    private func setupConstrains() {

        // clubImageView
        let clubImageViewConstraints: [NSLayoutConstraint] = [
            clubImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            clubImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            clubImageView.widthAnchor.constraint(equalToConstant: 100),
            clubImageView.heightAnchor.constraint(equalToConstant: 100)
        ]
        addConstraints(clubImageViewConstraints)

        // nameLabel
        let nameLabelConstraints: [NSLayoutConstraint] = [
            nameLabel.leadingAnchor.constraint(equalTo: clubImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8)
        ]
        addConstraints(nameLabelConstraints)

        // releaseDateLabel
        let releaseDateLabelConstraints: [NSLayoutConstraint] = [
            releaseDateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0),
            releaseDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            releaseDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            releaseDateLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -8)
        ]
        addConstraints(releaseDateLabelConstraints)
    }
}
