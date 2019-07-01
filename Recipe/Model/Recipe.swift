//
//  Recipe.swift
//  Recipe
//
//  Created by Suryakant Sharma on 25/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
import Contentful

final class Recipe: EntryDecodable, FieldKeysQueryable {
    
    static let contentTypeId: String = "recipe"
    
    // FlatResource members.
    let id: String
    let localeCode: String?
    let updatedAt: Date?
    let createdAt: Date?
    
    let title: String?
    let description: String?
    var chefName: Entry?
    var image: Asset?
    
    public required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()
        
        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt
        
        let fields      = try decoder.contentfulFieldsContainer(keyedBy: Recipe.FieldKeys.self)
        
        self.title       = try fields.decodeIfPresent(String.self, forKey: .title)
        self.description = try fields.decodeIfPresent(String.self, forKey: .description)
        try fields.resolveLink(forKey: .image, decoder: decoder) { [weak self] image in
            self?.image = image as? Asset
        }
        
        try fields.resolveLink(forKey: .chefname, decoder: decoder) { [weak self] chef in
            self?.chefName = chef as? Entry
        }
    }
    
    // If your field names and your properties names differ, you can define the mapping in your `FieldKeys` enum.
    enum FieldKeys: String, CodingKey {
        case title, description, locale
        case image = "photo"
        case chefname = "chef"
        case listOfTags = "tags"
    }
    public init(sys: Sys, title: String, description: String, image: Asset?, chefName:Entry){
        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt
        self.title = title
        self.description = description
        self.image = image
        self.chefName = chefName
    }
}

