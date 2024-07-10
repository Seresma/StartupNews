//
//  InshortAPIResponse.swift
//  StartupNews
//
//  Created by Sergio Escudero Manzano on 07/07/2024.
//

import Foundation

struct InshortAPIResponse: Decodable {
    let category: String
    let data: [Article]
    let success: Bool
}

struct Article: Decodable {
    let author: String
    let content: String
    let date: String
    let id: String
    let imageUrl: String
    let readMoreUrl: String
    let time: String
    let title: String
    let url: String
}
