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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            let val = try values.decode(String.self, forKey: .emoji)
            let arr = val.components(separatedBy: "-")
            let text = String(
                String.UnicodeScalarView(
                    arr.flatMap{ Unicode.Scalar(UInt32($0, radix: 16)!) }
                )
            )
            
            emoji = text
        } catch {
            emoji = ""
        }
        
        do {
            var val : String
            val = try values.decode(String.self, forKey: .description)
            description = val
        } catch {
            description = ""
        }
        
    }
}

