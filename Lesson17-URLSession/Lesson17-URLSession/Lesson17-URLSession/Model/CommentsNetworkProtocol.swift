//
//  CommentsNetworkProtocol.swift
//  Lesson17-URLSession
//
//  Created by Владислав Галкин on 02.06.2021.
//

import Foundation

typealias GetCommentsApiResponse = Result<[GetCommentsResponse], NetworkServiceError>

protocol CommentsNetworkProtocol {
    func getComments(completion: @escaping (GetCommentsApiResponse) -> Void)
}
