//
//  QuizDataServiceProtocol.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import Foundation

protocol QuizDataServiceProtocol {
    func fetchStylistFocus() async throws -> [StylistFocus]
    func fetchStyleOptions() async throws -> [RepresentStyle]
    func fetchColorOptions() async throws -> [FavouriteColor]
}
