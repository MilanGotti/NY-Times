//
//  Media.swift
//
//  Created by iMac on 08/09/21
//  Copyright (c) . All rights reserved.
//

import Foundation

class Media: Codable {

  enum CodingKeys: String, CodingKey {
    case mediaMetadata = "media-metadata"
    case caption
    case type
    case approvedForSyndication = "approved_for_syndication"
    case subtype
    case copyright
  }

  var mediaMetadata: [MediaMetadata]?
  var caption: String?
  var type: String?
  var approvedForSyndication: Int?
  var subtype: String?
  var copyright: String?

  init (mediaMetadata: [MediaMetadata]?, caption: String?, type: String?, approvedForSyndication: Int?, subtype: String?, copyright: String?) {
    self.mediaMetadata = mediaMetadata
    self.caption = caption
    self.type = type
    self.approvedForSyndication = approvedForSyndication
    self.subtype = subtype
    self.copyright = copyright
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    mediaMetadata = try container.decodeIfPresent([MediaMetadata].self, forKey: .mediaMetadata)
    caption = try container.decodeIfPresent(String.self, forKey: .caption)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    approvedForSyndication = try container.decodeIfPresent(Int.self, forKey: .approvedForSyndication)
    subtype = try container.decodeIfPresent(String.self, forKey: .subtype)
    copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
  }

}
