//
//  ArticlesResults.swift
//
//  Created by iMac on 08/09/21
//  Copyright (c) . All rights reserved.
//

import Foundation

class ArticlesResults: Codable {

  enum CodingKeys: String, CodingKey {
    case assetId = "asset_id"
    case section
    case uri
    case url
    case perFacet = "per_facet"
    case source
    case id
    case type
    case publishedDate = "published_date"
    case nytdsection
    case abstract
    case orgFacet = "org_facet"
    case media
    case updated
    case subsection
    case adxKeywords = "adx_keywords"
    case byline
    case etaId = "eta_id"
    case title
    case desFacet = "des_facet"
    case geoFacet = "geo_facet"
  }

  var assetId: Int?
  var section: String?
  var uri: String?
  var url: String?
  var perFacet: [String]?
  var source: String?
  var id: Int?
  var type: String?
  var publishedDate: String?
  var nytdsection: String?
  var abstract: String?
  var orgFacet: [String]?
  var media: [Media]?
  var updated: String?
  var subsection: String?
  var adxKeywords: String?
  var byline: String?
  var etaId: Int?
  var title: String?
  var desFacet: [String]?
  var geoFacet: [String]?

  init (assetId: Int?, section: String?, uri: String?, url: String?, perFacet: [String]?, source: String?, id: Int?, type: String?, publishedDate: String?, nytdsection: String?, abstract: String?, orgFacet: [String]?, media: [Media]?, updated: String?, subsection: String?, adxKeywords: String?, byline: String?, etaId: Int?, title: String?, desFacet: [String]?, geoFacet: [String]?) {
    self.assetId = assetId
    self.section = section
    self.uri = uri
    self.url = url
    self.perFacet = perFacet
    self.source = source
    self.id = id
    self.type = type
    self.publishedDate = publishedDate
    self.nytdsection = nytdsection
    self.abstract = abstract
    self.orgFacet = orgFacet
    self.media = media
    self.updated = updated
    self.subsection = subsection
    self.adxKeywords = adxKeywords
    self.byline = byline
    self.etaId = etaId
    self.title = title
    self.desFacet = desFacet
    self.geoFacet = geoFacet
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    assetId = try container.decodeIfPresent(Int.self, forKey: .assetId)
    section = try container.decodeIfPresent(String.self, forKey: .section)
    uri = try container.decodeIfPresent(String.self, forKey: .uri)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    perFacet = try container.decodeIfPresent([String].self, forKey: .perFacet)
    source = try container.decodeIfPresent(String.self, forKey: .source)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
    nytdsection = try container.decodeIfPresent(String.self, forKey: .nytdsection)
    abstract = try container.decodeIfPresent(String.self, forKey: .abstract)
    orgFacet = try container.decodeIfPresent([String].self, forKey: .orgFacet)
    media = try container.decodeIfPresent([Media].self, forKey: .media)
    updated = try container.decodeIfPresent(String.self, forKey: .updated)
    subsection = try container.decodeIfPresent(String.self, forKey: .subsection)
    adxKeywords = try container.decodeIfPresent(String.self, forKey: .adxKeywords)
    byline = try container.decodeIfPresent(String.self, forKey: .byline)
    etaId = try container.decodeIfPresent(Int.self, forKey: .etaId)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    desFacet = try container.decodeIfPresent([String].self, forKey: .desFacet)
    geoFacet = try container.decodeIfPresent([String].self, forKey: .geoFacet)
  }

}
