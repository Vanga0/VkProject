//
//  Selection.swift
//  VkBootcampAlbertyan
//
//  Created by Vagan Albertyan on 12.07.2022.
//

import Foundation
struct Services: Codable{
    let services: [ResultItem]
}
struct Jsoner: Codable{
    let body: Services
    let status:Int
}
struct ResultItem: Codable{
    let name: String
    let description: String
    let link: String
    let icon_url: String
}
