//
//  MovieTableViewCell.swift
//  Movies and series
//
//  Created by Русинов Евгений on 29.03.2023.
//

import UIKit

final class MovieTableViewCell: UITableViewCell {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        return title
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 2
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.minimumScaleFactor = 0.5
        return descriptionLabel
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
    
        image.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.leading.equalTo(contentView.snp.leading).inset(16)
            make.top.equalTo(contentView.snp.top).inset(8)
            make.trailing.equalTo(titleLabel.snp.leading).inset(-16)
            make.trailing.equalTo(descriptionLabel.snp.leading).inset(-16)
        }
        titleLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).inset(24)
            make.top.equalTo(contentView.snp.top).inset(8)
            make.height.equalTo(19)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).inset(24)
            make.height.equalTo(34)
            make.top.equalTo(titleLabel.snp.bottom).inset(-8)
            make.bottom.equalTo(contentView.snp.bottom).inset(8)
        }
        
    }
    
    func configure(savedMovie: SavedMovie) {
        titleLabel.text = savedMovie.movieTitle
        descriptionLabel.text = savedMovie.movieDescription
        guard let url = URL(string: savedMovie.movieImage) else { return }
        image.load(url: url)
    }
}

