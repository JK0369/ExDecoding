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
    case blogName = "blog_name"
  }
  enum BlogNameKeys: String, CodingKey {
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
    
    let blogNameKeys = try codingKeys.nestedContainer(keyedBy: BlogNameKeys.self, forKey: .blogName)
    self.blogName = try blogNameKeys.decode(String.self, forKey: .first)
  }
}

extension MyModel: Encodable {
  
}
