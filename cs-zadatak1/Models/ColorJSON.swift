//
//  ColorJSON.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 13.08.2022..
//

import Foundation

struct ColorJSON: Codable {
    let colorID: Int?
    let hexString: String?
    let rgb: RGB?
    let hsl: Hsl?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case colorID = "colorId"
        case hexString, rgb, hsl, name
    }
}

struct Hsl: Codable {
    let h, s, l: Int?
}

struct RGB: Codable {
    let r, g, b: Int?
}

struct Colors: Codable{
    let colors: [ColorJSON]
}
