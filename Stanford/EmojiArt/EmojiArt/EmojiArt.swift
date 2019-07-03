//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Wiley on 2019/6/20.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation

struct EmojiArt: Codable {
    
    var url: URL
    
    var emojis = [EmojiInfo]()
    
    struct EmojiInfo: Codable {
        let centerX: Int
        let centerY: Int
        let text: String
        let size: Int
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data) {
        if let newValue = try? JSONDecoder().decode(EmojiArt.self, from: json) {
            self = newValue
        } else {
            return nil
        }
    }
    
    init(url: URL, emojis: [EmojiInfo]) {
        self.url = url
        self.emojis = emojis
    }
}
