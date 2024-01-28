//
//  struct PostFeed.swift
//  Navigation
//
//  Created by Alexander Balash on 18.01.24.
//

import Foundation
import UIKit

struct PostFeed: Identifiable {
        
    //MARK: -  Описание свойств
        var id: Int
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
    
        static func make() -> [PostFeed] {
            [
                PostFeed(id: 1, author: "Alexander Balash", description: "Изменения – закон жизни. И те, кто смотрит только в прошлое или только на настоящее, бесспорно, пропустят будущее.", image: "AlexanderBalash", likes: 223289094, views: 238774234),
                PostFeed(id: 2, author: "Nikita Glutay", description: "Секрет перемен состоит в том, чтобы сосредоточиться на создании нового, а не на борьбе со старым", image: "NikitaGlytay", likes: 234234, views: 324234),
                PostFeed(id: 3, author: "Misha Osipchuk", description: "Поворот дороги — это не конец пути, если, конечно, вы успеете развернуться.", image: "MishaOsipchuk", likes: 3324234, views: 234234),
                PostFeed(id: 4, author: "Vladislau Ulasovec", description: "В этом мире всё рано или поздно гибнет. Это не должно быть поводом для отчаяния. Одним нравится строить, другим разрушать.", image: "VladUlasovec", likes: 234234, views: 342437676)
                    ]
        }
    }
     





