//
//  MovieModel.swift
//  App-Movie-Database
//
//  Created by Immanuel Matthews-Feemster on 2/9/24.
//

import UIKit

struct Movie: Codable {
    let id: Int
    let posterPath: String
    let title: String
}
