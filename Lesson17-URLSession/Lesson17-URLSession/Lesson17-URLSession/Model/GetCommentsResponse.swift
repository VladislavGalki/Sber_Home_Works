//
//  GetCommentsResponse.swift
//  Lesson17-URLSession
//
//  Created by Владислав Галкин on 02.06.2021.
//

import Foundation

struct GetCommentsResponse: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
