//
//  MostViewedModel.swift
//
//  Created by iMac on 08/09/21
//  Copyright (c) . All rights reserved.
//

import Foundation

class MostViewedModel: Codable {

  enum CodingKeys: String, CodingKey {
    case status
    case articlesResults = "results"
    case copyright
    case numResults = "num_results"
  }

  var status: String?
  var articlesResults: [ArticlesResults]?
  var copyright: String?
  var numResults: Int?

  init (status: String?, articlesResults: [ArticlesResults]?, copyright: String?, numResults: Int?) {
    self.status = status
    self.articlesResults = articlesResults
    self.copyright = copyright
    self.numResults = numResults
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    articlesResults = try container.decodeIfPresent([ArticlesResults].self, forKey: .articlesResults)
    copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
    numResults = try container.decodeIfPresent(Int.self, forKey: .numResults)
  }

}
