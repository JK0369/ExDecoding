//
//  MyModel.swift
//  ExCodable
//
//  Created by 김종권 on 2022/02/03.
//

import Foundation

struct MyModel {
  enum CodingKeys: String, CodingKey {
    case userID = "user_id"
    case blogInfo = "blog_info"
  }
  enum BlogInfoKeys: String, CodingKey {
    case name
  }
  enum NameKeys: String, CodingKey {
    case first
    case second
  }
  var userID: String?
  var blogName: String?
}

extension MyModel: Decodable {
  init(from decoder: Decoder) throws {
    let codingKeys = try decoder.container(keyedBy: CodingKeys.self)
    self.userID = try codingKeys.decode(String.self, forKey: .userID)
    
    let blogInfoKeys = try codingKeys.nestedContainer(keyedBy: BlogInfoKeys.self, forKey: .blogInfo)
    let nameKeys = try blogInfoKeys.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
    self.blogName = try nameKeys.decode(String.self, forKey: .first)
  }
}
