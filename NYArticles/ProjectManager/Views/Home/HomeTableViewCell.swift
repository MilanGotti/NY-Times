//
//  HomeTableViewCell.swift
//  NYArticles
//
//  Created by DREAMWORLD on 13/09/21.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    
    var articles: TopStoriesResults? {
        didSet {
            self.articleImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.articleImage.sd_setImage(with: URL(string: self.articles?.multimedia?.first?.url ?? ""), placeholderImage: placeHolderLogo)
            self.labelTitle.text = self.articles?.title ?? ""
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.labelTitle.setupLabel(font: AppFont.size18.bold, color: .appBlack)
        self.mainView.setCorner(color: .clear, size: 10, addShadow: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}


extension HomeTableViewCell {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    animate(isHighlighted: true)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    animate(isHighlighted: false)
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    animate(isHighlighted: false)
  }
  
  private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)? = nil) {
    let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
    if isHighlighted {
      UIView.animate(
        withDuration: 0.5,
        delay: 0,
        usingSpringWithDamping: 1,
        initialSpringVelocity: 0,
        options: animationOptions, animations: {
          self.transform = .init(scaleX: 0.95, y: 0.95)
      }, completion: completion)
    } else {
      UIView.animate(
        withDuration: 0.5,
        delay: 0,
        usingSpringWithDamping: 1,
        initialSpringVelocity: 0,
        options: animationOptions, animations: {
          self.transform = .identity
      }, completion: completion)
    }
  }
}
