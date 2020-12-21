//
//  TVShowsResponse.swift
//  BookStore
//
//  Created by Satya Rajput on 21/12/20.
//  Copyright © 2020 Abhishek Singh. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct TVShows: Codable {
    let id: String
    let assetType: Int
    let assetSubtype: WelcomeAssetSubtype
    let title, originalTitle: String
    let isIndiaImageEnabled: Bool
    let welcomeDescription, shortDescription: String?
    let tags: [String]
    let ageRating: String
    let rating: Int
    let listImage, coverImage: String?
    let minultelyActive: Int
    let image: Image
    let imageURL: ImageURL
    let languages: [String]
    let audioLanguages: [JSONAny]
    let seoTitle, releaseDate, contentOwner: String
    let countries: [String]
    let buckets: [TVShows]?
    let etag, appcoverImage: String?
    let page, limit: Int?
    let total: Int
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case id
        case assetType = "asset_type"
        case assetSubtype = "asset_subtype"
        case title
        case originalTitle = "original_title"
        case isIndiaImageEnabled = "is_india_image_enabled"
        case welcomeDescription = "description"
        case shortDescription = "short_description"
        case tags
        case ageRating = "age_rating"
        case rating
        case listImage = "list_image"
        case coverImage = "cover_image"
        case minultelyActive = "minultely_active"
        case image
        case imageURL = "image_url"
        case languages
        case audioLanguages = "audio_languages"
        case seoTitle = "seo_title"
        case releaseDate = "release_date"
        case contentOwner = "content_owner"
        case countries, buckets, etag
        case appcoverImage = "appcover_image"
        case page, limit, total, items
    }
}

enum WelcomeAssetSubtype: String, Codable {
    case manual = "Manual"
}

// MARK: - Image
struct Image: Codable {
    let listclean: String?
    let square, appCover, tvCover, cover: String
    let list: String
    let portraitclean, portrait: String?

    enum CodingKeys: String, CodingKey {
        case listclean, square
        case appCover = "app_cover"
        case tvCover = "tv_cover"
        case cover, list, portraitclean, portrait
    }
}

// MARK: - ImageURL
struct ImageURL: Codable {
    let list, cover: String
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let assetType: Int
    let assetSubtype: ItemAssetSubtype
    let title, originalTitle: String
    let isIndiaImageEnabled: Bool
    let itemDescription: String
    let businessType: BusinessType
    let slug: String?
    let genres: [Genre]
    let tags: [String]
    let ageRating: AgeRating
    let rating: Double
    let listImage, coverImage, appcoverImage: String
    let minultelyActive: Int
    let image: Image
    let imageURL: ImageURL
    let languages: [String]
    let subtitleLanguages: [Language]?
    let audioLanguages: [Language]
    let seoTitle, releaseDate: String
    let contentOwner: ContentOwner
    let countries: [Country]
    let tier: String
    let billingType: BillingType
    let shortDescription: String?
    let related: [Related]?
    let duration, episodeNumber: Int?
    let tvshowImage: TvshowImage?
    let tvshow: Tvshow?
    let isDRM: Int?
    let countryMeta: CountryMeta?

    enum CodingKeys: String, CodingKey {
        case id
        case assetType = "asset_type"
        case assetSubtype = "asset_subtype"
        case title
        case originalTitle = "original_title"
        case isIndiaImageEnabled = "is_india_image_enabled"
        case itemDescription = "description"
        case businessType = "business_type"
        case slug, genres, tags
        case ageRating = "age_rating"
        case rating
        case listImage = "list_image"
        case coverImage = "cover_image"
        case appcoverImage = "appcover_image"
        case minultelyActive = "minultely_active"
        case image
        case imageURL = "image_url"
        case languages
        case subtitleLanguages = "subtitle_languages"
        case audioLanguages = "audio_languages"
        case seoTitle = "seo_title"
        case releaseDate = "release_date"
        case contentOwner = "content_owner"
        case countries, tier
        case billingType = "billing_type"
        case shortDescription = "short_description"
        case related, duration
        case episodeNumber = "episode_number"
        case tvshowImage = "tvshow_image"
        case tvshow
        case isDRM = "is_drm"
        case countryMeta = "country_meta"
    }
}

enum AgeRating: String, Codable {
    case a = "A"
    case empty = ""
    case u = "U"
    case uA = "U/A"
}

enum ItemAssetSubtype: String, Codable {
    case episode = "episode"
    case externalLink = "external_link"
    case original = "original"
    case preview = "preview"
    case promo = "promo"
    case tvshow = "tvshow"
    case webisode = "webisode"
}

enum Language: String, Codable {
    case en = "en"
    case hi = "hi"
}

enum BillingType: String, Codable {
    case club = "club"
    case empty = ""
}

enum BusinessType: String, Codable {
    case advertisement = "advertisement"
    case advertisementDownloadable = "advertisement_downloadable"
    case free = "free"
    case premiumDownloadable = "premium_downloadable"
}

enum ContentOwner: String, Codable {
    case empty = ""
    case greenGold = "Green Gold"
    case international = "International"
    case zeeEnterainmentEnterprisesLtd = "Zee Enterainment Enterprises Ltd"
    case zeeEntertainementEnterprisesLimited = "Zee Entertainement Enterprises Limited"
    case zeeEntertainmentEnterprisesLimited = "Zee Entertainment Enterprises Limited"
    case zeeEntertainmentEnterprisesLtd = "Zee Entertainment Enterprises Ltd"
    case zeeEntertaintmentEnterprisesLimited = "Zee Entertaintment Enterprises Limited"
}

enum Country: String, Codable {
    case countryIN = "IN"
    case india = "India"
    case indiaIN = "India (IN)"
}

// MARK: - CountryMeta
struct CountryMeta: Codable {
    let countryMetaIn: In

    enum CodingKeys: String, CodingKey {
        case countryMetaIn = "in"
    }
}

// MARK: - In
struct In: Codable {
    let billingType: BillingType

    enum CodingKeys: String, CodingKey {
        case billingType = "billing_type"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id, value: String
}

// MARK: - Related
struct Related: Codable {
    let id: String
}

// MARK: - Tvshow
struct Tvshow: Codable {
    let id, title, originalTitle: String
    let assetSubtype: ItemAssetSubtype

    enum CodingKeys: String, CodingKey {
        case id, title
        case originalTitle = "original_title"
        case assetSubtype = "asset_subtype"
    }
}

// MARK: - TvshowImage
struct TvshowImage: Codable {
    let square, appCover: String
    let inPassport: InPassport
    let list: String
    let inList: InList
    let inTvCover: InTvCover
    let inSquare: InSquare
    let portrait, listclean, portraitclean, passport: String
    let tvCover, telcoSquare: String
    let inCover: InCover
    let inPortraitclean: InPortraitclean
    let originals: String
    let inPortrait: InPortrait
    let inListclean: InListclean
    let cover, inOriginals: String
    let inTelcoSquare: InTelcoSquare
    let inAppCover: InAppCover

    enum CodingKeys: String, CodingKey {
        case square
        case appCover = "app_cover"
        case inPassport = "in__passport"
        case list
        case inList = "in__list"
        case inTvCover = "in__tv_cover"
        case inSquare = "in__square"
        case portrait, listclean, portraitclean, passport
        case tvCover = "tv_cover"
        case telcoSquare = "telco_square"
        case inCover = "in__cover"
        case inPortraitclean = "in__portraitclean"
        case originals
        case inPortrait = "in__portrait"
        case inListclean = "in__listclean"
        case cover
        case inOriginals = "in__originals"
        case inTelcoSquare = "in__telco_square"
        case inAppCover = "in__app_cover"
    }
}

enum InAppCover: String, Codable {
    case empty = ""
    case the06366_InAppcove755800409 = "06366_in_appcove_755800409"
    case the1440X8101127889310 = "1440x810_1127889310"
}

enum InCover: String, Codable {
    case empty = ""
    case the06366_InCover1536688464 = "06366_in_cover_1536688464"
    case the1920X7701644051509 = "1920x770_1644051509"
}

enum InList: String, Codable {
    case empty = ""
    case the06366_InList236770256 = "06366_in_list_236770256"
    case the1170X658Withlog2118559094 = "1170x658withlog_2118559094"
}

enum InListclean: String, Codable {
    case empty = ""
    case the06366_InListcl1760599282 = "06366_in_listcl_1760599282"
    case the1170X6581444347157 = "1170x658_1444347157"
}

enum InPassport: String, Codable {
    case empty = ""
    case the06366_InPasspor108737733 = "06366_in_passpor_108737733"
    case the750X1000481187247 = "750x1000_481187247"
}

enum InPortrait: String, Codable {
    case empty = ""
    case the06366_InPortra1220900721 = "06366_in_portra_1220900721"
    case the630X945Withlogo1642186506 = "630x945withlogo_1642186506"
}

enum InPortraitclean: String, Codable {
    case empty = ""
    case the06366_InPortrai989693215 = "06366_in_portrai_989693215"
    case the630X9451037594447 = "630x945_1037594447"
}

enum InSquare: String, Codable {
    case empty = ""
    case the06366_InSquare892952277 = "06366_in_square_892952277"
    case the374X374872143294 = "374x374_872143294"
}

enum InTelcoSquare: String, Codable {
    case empty = ""
    case the06366_InTelcos1488298182 = "06366_in_telcos_1488298182"
    case the750X7501988351030 = "750x750_1988351030"
}

enum InTvCover: String, Codable {
    case empty = ""
    case the06366_InTvcove1396172681 = "06366_in_tvcove_1396172681"
    case the1920X522124814542 = "1920x522_124814542"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
