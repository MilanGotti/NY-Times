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
  }

  var height: Int?
  var url: String?
  var format: String?
  var width: Int?

  init (height: Int?, url: String?, format: String?, width: Int?) {
    self.height = height
    self.url = url
    self.format = format
    self.width = width
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    height = try container.decodeIfPresent(Int.self, forKey: .height)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    format = try container.decodeIfPresent(String.self, forKey: .format)
    width = try container.decodeIfPresent(Int.self, forKey: .width)
  }

}
