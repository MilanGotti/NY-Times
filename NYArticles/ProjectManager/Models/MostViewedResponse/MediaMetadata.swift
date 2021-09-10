//
//  MediaMetadata.swift
//
//  Created by iMac on 08/09/21
//  Copyright (c) . All rights reserved.
//

import Foundation

class MediaMetadata: Codable {

  enum CodingKeys: String, CodingKey {
    case height
    case url
    case format
    case width
    case type
    case subtype
    case caption
    case copyright
  }

  var height: Int?
  var url: String?
  var format: String?
  var width: Int?
  var type: String?
  var subtype: String?
  var caption: String?
  var copyright: String?
    
  init () {
    
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    height = try container.decodeIfPresent(Int.self, forKey: .height)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    format = try container.decodeIfPresent(String.self, forKey: .format)
    width = try container.decodeIfPresent(Int.self, forKey: .width)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    subtype = try container.decodeIfPresent(String.self, forKey: .subtype)
    caption = try container.decodeIfPresent(String.self, forKey: .caption)
    copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
  }

}
