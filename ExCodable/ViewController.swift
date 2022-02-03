//
//  ViewController.swift
//  ExCodable
//
//  Created by 김종권 on 2022/02/03.
//

import UIKit

class ViewController: UIViewController {
  
  let jsonSample = """
{
  "user_id": "jake",
  "blog_name": {
    "first": "iOS 앱 개발 알아가기",
    "second": "SwiftUI 앱 개발 알아가기"
  }
}
"""

  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard
      let data = self.jsonSample.data(using: .utf8),
      let myModel = try? JSONDecoder().decode(MyModel.self, from: data)
    else { return }
    
    print(myModel.blogName)
  }
}

struct MyModelOld: Codable {
  struct BlogName: Codable {
    let first, second: String
  }
  enum CodingKeys: String, CodingKey {
    case userID = "user_id"
    case blogName = "blog_name"
  }
  let userID: String
  let blogName: BlogName
}
