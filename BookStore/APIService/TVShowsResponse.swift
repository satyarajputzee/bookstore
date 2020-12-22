//
//  TVShowResponse.swift
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


// MARK: - Welcome
struct TVShow: Decodable {
    let id: String?
    let assetType: Int?
    let assetSubtype: String?
    let title, originalTitle: String?
    let isIndiaImageEnabled: Bool?
    let description, shortDescription: String?
    let tags: [String]?
    let ageRating: String?
    let rating: Int?
    let listImage, coverImage: String?
    let minultelyActive: Int?
    let image: Image?
    let imageURL: ImageURL?
    let languages: [String]?
    let audioLanguages: [String]?
    let seoTitle, releaseDate, contentOwner: String?
    let countries: [String]?
    let buckets: [TVShow]?
    let etag, appcoverImage: String?
    let page, limit: Int?
    let total: Int?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case id
        case assetType = "asset_type"
        case assetSubtype = "asset_subtype"
        case title
        case originalTitle = "original_title"
        case isIndiaImageEnabled = "is_india_image_enabled"
        case description = "description"
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
// MARK: - Image
struct Image: Decodable {
    let listclean: String?
    let square, appCover, tvCover, cover: String?
    let list: String?
    let portraitclean, portrait: String?

    enum CodingKeys: String, CodingKey {
        case listclean, square
        case appCover = "app_cover"
        case tvCover = "tv_cover"
        case cover, list, portraitclean, portrait
    }
}

// MARK: - ImageURL
struct ImageURL: Decodable {
    let list, cover: String
}

// MARK: - Item
struct Item: Decodable {
    let id: String?
    let assetType: Int?
    let assetSubtype: String?
    let title, originalTitle: String?
    let isIndiaImageEnabled: Bool?
    let itemDescription: String?
    let businessType: String?
    let slug: String?
    let genres: [Genre]?
    let tags: [String]?
    let ageRating: String?
    let rating: Double?
    let listImage, coverImage, appcoverImage: String?
    let minultelyActive: Int?
    let image: Image?
    let imageURL: ImageURL?
    let languages: [String]?
    let subtitleLanguages: [String]?
    let audioLanguages: [String]?
    let seoTitle, releaseDate: String?
    let contentOwner: String?
    let countries: [String]?
    let tier: String?
    let billingType: String?
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


// MARK: - CountryMeta
struct CountryMeta: Decodable {
    let countryMetaIn: In

    enum CodingKeys: String, CodingKey {
        case countryMetaIn = "in"
    }
}

// MARK: - In
struct In: Decodable {
    let billingType: String

    enum CodingKeys: String, CodingKey {
        case billingType = "billing_type"
    }
}

// MARK: - Genre
struct Genre: Decodable {
    let id, value: String?
}

// MARK: - Related
struct Related: Decodable {
    let id: String
}

// MARK: - Tvshow
struct Tvshow: Decodable {
    let id, title, originalTitle: String
    let assetSubtype: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case originalTitle = "original_title"
        case assetSubtype = "asset_subtype"
    }
}

// MARK: - TvshowImage
struct TvshowImage: Decodable {
    let square, appCover: String?
    let inPassport: String?
    let list: String?
    let inList: String?
    let inTvCover: String?
    let inSquare: String?
    let portrait, listclean, portraitclean, passport: String?
    let tvCover, telcoSquare: String?
    let inCover: String?
    let inPortraitclean: String?
    let originals: String?
    let inPortrait: String?
    let inListclean: String?
    let cover, inOriginals: String?
    let inTelcoSquare: String?
    let inAppCover: String?

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
