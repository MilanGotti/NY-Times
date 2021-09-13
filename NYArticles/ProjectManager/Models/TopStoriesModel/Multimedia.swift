//
//  Multimedia.swift
//
//  Created by DREAMWORLD on 11/09/21
//  Copyright (c) . All rights reserved.
//

import Foundation

class Multimedia: Codable {

  enum CodingKeys: String, CodingKey {
    case copyright
    case caption
    case subtype
    case height
    case width
    case type
    case url
    case format
  }

  var copyright: String?
  var caption: String?
  var subtype: String?
  var height: Int?
  var width: Int?
  var type: String?
  var url: String?
  var format: String?

  init (copyright: String?, caption: String?, subtype: String?, height: Int?, width: Int?, type: String?, url: String?, format: String?) {
    self.copyright = copyright
    self.caption = caption
    self.subtype = subtype
    self.height = height
    self.width = width
    self.type = type
    self.url = url
    self.format = format
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
    caption = try container.decodeIfPresent(String.self, forKey: .caption)
    subtype = try container.decodeIfPresent(String.self, forKey: .subtype)
    height = try container.decodeIfPresent(Int.self, forKey: .height)
    width = try container.decodeIfPresent(Int.self, forKey: .width)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    format = try container.decodeIfPresent(String.self, forKey: .format)
  }

}
