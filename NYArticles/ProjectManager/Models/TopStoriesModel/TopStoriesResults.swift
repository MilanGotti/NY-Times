//
//  TopStoriesResults.swift
//
//  Created by DREAMWORLD on 11/09/21
//  Copyright (c) . All rights reserved.
//

import Foundation

class TopStoriesResults: Codable {

  enum CodingKeys: String, CodingKey {
    case orgFacet = "org_facet"
    case perFacet = "per_facet"
    case publishedDate = "published_date"
    case geoFacet = "geo_facet"
    case kicker
    case byline
    case materialTypeFacet = "material_type_facet"
    case title
    case itemType = "item_type"
    case abstract
    case url
    case shortUrl = "short_url"
    case updatedDate = "updated_date"
    case section
    case uri
    case multimedia
    case subsection
    case createdDate = "created_date"
    case desFacet = "des_facet"
  }

  var orgFacet: [String]?
  var perFacet: [String]?
  var publishedDate: String?
  var geoFacet: [String]?
  var kicker: String?
  var byline: String?
  var materialTypeFacet: String?
  var title: String?
  var itemType: String?
  var abstract: String?
  var url: String?
  var shortUrl: String?
  var updatedDate: String?
  var section: String?
  var uri: String?
  var multimedia: [Multimedia]?
  var subsection: String?
  var createdDate: String?
  var desFacet: [String]?

  init (orgFacet: [String]?, perFacet: [String]?, publishedDate: String?, geoFacet: [String]?, kicker: String?, byline: String?, materialTypeFacet: String?, title: String?, itemType: String?, abstract: String?, url: String?, shortUrl: String?, updatedDate: String?, section: String?, uri: String?, multimedia: [Multimedia]?, subsection: String?, createdDate: String?, desFacet: [String]?) {
    self.orgFacet = orgFacet
    self.perFacet = perFacet
    self.publishedDate = publishedDate
    self.geoFacet = geoFacet
    self.kicker = kicker
    self.byline = byline
    self.materialTypeFacet = materialTypeFacet
    self.title = title
    self.itemType = itemType
    self.abstract = abstract
    self.url = url
    self.shortUrl = shortUrl
    self.updatedDate = updatedDate
    self.section = section
    self.uri = uri
    self.multimedia = multimedia
    self.subsection = subsection
    self.createdDate = createdDate
    self.desFacet = desFacet
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    orgFacet = try container.decodeIfPresent([String].self, forKey: .orgFacet)
    perFacet = try container.decodeIfPresent([String].self, forKey: .perFacet)
    publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
    geoFacet = try container.decodeIfPresent([String].self, forKey: .geoFacet)
    kicker = try container.decodeIfPresent(String.self, forKey: .kicker)
    byline = try container.decodeIfPresent(String.self, forKey: .byline)
    materialTypeFacet = try container.decodeIfPresent(String.self, forKey: .materialTypeFacet)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    itemType = try container.decodeIfPresent(String.self, forKey: .itemType)
    abstract = try container.decodeIfPresent(String.self, forKey: .abstract)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    shortUrl = try container.decodeIfPresent(String.self, forKey: .shortUrl)
    updatedDate = try container.decodeIfPresent(String.self, forKey: .updatedDate)
    section = try container.decodeIfPresent(String.self, forKey: .section)
    uri = try container.decodeIfPresent(String.self, forKey: .uri)
    multimedia = try container.decodeIfPresent([Multimedia].self, forKey: .multimedia)
    subsection = try container.decodeIfPresent(String.self, forKey: .subsection)
    createdDate = try container.decodeIfPresent(String.self, forKey: .createdDate)
    desFacet = try container.decodeIfPresent([String].self, forKey: .desFacet)
  }

}
