//
//  ArticleTypesCell.swift
//  CompositionLayout
//
//  Created by Kevin on 08/09/20.
//

import UIKit
import SDWebImage

class ArticleTypesCell: UICollectionViewCell {
    
  static let reuseIdentifer = "ArticleTypesCell"
  let featuredPhotoView = UIImageView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        featuredPhotoView.layer.cornerRadius = 10
        featuredPhotoView.layer.masksToBounds = true
    }

    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withImageName name: String) {
        
        featuredPhotoView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(featuredPhotoView)
        
        NSLayoutConstraint.activate([

            featuredPhotoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            featuredPhotoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            featuredPhotoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            featuredPhotoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

        featuredPhotoView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        featuredPhotoView.sd_setImage(with: URL(string: name), placeholderImage: placeHolderLogo)
    }
}


