//
//  TopStoriesModel.swift
//
//  Created by DREAMWORLD on 11/09/21
//  Copyright (c) . All rights reserved.
//

import Foundation

class TopStoriesModel: Codable {

  enum CodingKeys: String, CodingKey {
    case numResults = "num_results"
    case status
    case section
    case topStoriesResults = "results"
    case lastUpdated = "last_updated"
    case copyright
  }

  var numResults: Int?
  var status: String?
  var section: String?
  var topStoriesResults: [TopStoriesResults]?
  var lastUpdated: String?
  var copyright: String?

  init (numResults: Int?, status: String?, section: String?, topStoriesResults: [TopStoriesResults]?, lastUpdated: String?, copyright: String?) {
    self.numResults = numResults
    self.status = status
    self.section = section
    self.topStoriesResults = topStoriesResults
    self.lastUpdated = lastUpdated
    self.copyright = copyright
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    numResults = try container.decodeIfPresent(Int.self, forKey: .numResults)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    section = try container.decodeIfPresent(String.self, forKey: .section)
    topStoriesResults = try container.decodeIfPresent([TopStoriesResults].self, forKey: .topStoriesResults)
    lastUpdated = try container.decodeIfPresent(String.self, forKey: .lastUpdated)
    copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
  }

}
