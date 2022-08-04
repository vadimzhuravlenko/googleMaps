//
//  Response.swift
//  googleMapsTestTask
//
//  Created by Vadim Zhuravlenko on 3.08.22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? newJSONDecoder().decode(Empty.self, from: jsonData)

import Foundation

// MARK: - Element
struct Element: Codable {
    var id, langID: Int?
    var point: Point?
    var pointName: String?
    var visible: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case langID = "lang_id"
        case point
        case pointName = "point_name"
        case visible
    }
}

// MARK: - Point
struct Point: Codable {
    var id, pointDistrictID, waterObjectID: Int?
    var pointGeoType: PointGeoType?
    var lat, lng: Double?
    var lat2, lng2: Double?
    var visible: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case pointDistrictID = "point_district_id"
        case waterObjectID = "water_object_id"
        case pointGeoType = "point_geo_type"
        case lat, lng
        case lat2 = "lat_2"
        case lng2 = "lng_2"
        case visible
    }
}

enum PointGeoType: String, Codable {
    case line = "Line"
    case point = "Point"
}

typealias Empty = [Element]
