//
//  ColorJSON.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 13.08.2022..
//

import Foundation

struct ColorJSON: Codable {
    let colorID: Int
    let rgb: RGB

    enum CodingKeys: String, CodingKey {
        case colorID = "colorId"
        case rgb
    }
}

struct RGB: Codable {
    let r, g, b: Int
}

struct Colors: Codable{
    let colors: [ColorJSON]
}
