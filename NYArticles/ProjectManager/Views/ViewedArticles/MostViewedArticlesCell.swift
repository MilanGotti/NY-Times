//
//  MostViewedArticlesCell.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import UIKit
import SDWebImage

class MostViewedArticlesCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageArticle: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelByLine: UILabel!
    @IBOutlet weak var labelSection: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    
    var articles: ArticlesResults? {
        didSet {
            self.imageArticle.sd_setImage(with: URL(string: self.articles?.media?.first?.mediaMetadata?.first?.url ?? ""), placeholderImage: placeHolderLogo)
            self.labelTitle.text = self.articles?.title ?? ""
            self.labelByLine.text = self.articles?.byline ?? ""
            self.labelSection.text = self.articles?.section ?? ""
            self.labelDate.text = self.articles?.publishedDate?.convertDateString(fromFormat: serverDateFormate, toFormat: appDateFormate)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    override func draw(_ rect: CGRect) {
        self.imageArticle.layer.cornerRadius = self.imageArticle.frame.height / 2
    }
    
    func setupView() {
        self.labelTitle.setupLabel(font: AppFont.size16.semibold, color: .appBlack)
        self.labelByLine.setupLabel(font: AppFont.size15.medium, color: .appGray)
        self.labelSection.setupLabel(font: AppFont.size14.medium, color: .appGray)
        self.labelDate.setupLabel(font: AppFont.size14.medium, color: .appGray)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
