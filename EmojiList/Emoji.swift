//
//  Emoji.swift
//  EmojiList
//
//  Created by Jon Sakas on 1/13/19.
//  Copyright © 2019 Doubledrop. All rights reserved.
//

struct Emoji : Decodable {
    let emoji: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case emoji = "unified"
        case description = "name"
    }
}

