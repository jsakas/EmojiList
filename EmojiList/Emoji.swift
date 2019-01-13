//
//  Emoji.swift
//  EmojiList
//
//  Created by Jon Sakas on 1/13/19.
//  Copyright © 2019 Doubledrop. All rights reserved.
//

class Emoji {
    let emoji: String?
    let description: String?
    
    init() {
        self.emoji = ""
        self.description = ""
    }
    
    init(emoji: String, description: String) {
        self.emoji = emoji
        self.description = description
    }
}
