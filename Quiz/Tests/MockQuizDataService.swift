//
//  MockQuizDataService.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import Foundation

final class MockQuizDataService: QuizDataServiceProtocol {
    
    func fetchStylistFocus() async throws -> [StylistFocus] {
        return [
            .init(id: "1001", title: "Reinvent wardrobe", description: "to discover fresh outfit ideas"),
            .init(id: "1002", title: "Define color palette", description: "to enhance my natural features"),
            .init(id: "1003", title: "Create a seasonal capsule", description: "to curate effortless and elegant looks"),
            .init(id: "1004", title: "Define my style", description: "to discover my signature look"),
            .init(id: "1004", title: "Create an outfit for an event", description: "to own a spotlight wherever you go")
        ]
    }
    
    // I've tried to upload pictures to the Firebase storage but I have some troubles with adding my bank's card in the google account (which is required to use the Firebase storage), so I decided to use the imgur service instead
    func fetchStyleOptions() async throws -> [RepresentStyle] {
        return [
            .init(id: "2001", title: "SEXY", imageUrl: "https://i.imgur.com/tMXFVFz.png"),
            .init(id: "2002", title: "SPORTY", imageUrl: "https://i.imgur.com/0HThVP9.png"),
            .init(id: "2003", title: "BOHO", imageUrl: "https://i.imgur.com/n0KHSMa.png"),
            .init(id: "2004", title: "LADYLIKE", imageUrl: "https://i.imgur.com/n0KHSMa.png"),
            .init(id: "2005", title: "FUNKY ROCK", imageUrl: "https://i.imgur.com/uNfbfPS.png"),
        ]
    }
    
    func fetchColorOptions() async throws -> [FavouriteColor] {
        return [
            .init(name: "LIGHT BLUE", color: "#ABE2FF"),
            .init(name: "BLUE", color: "#5EA8FF"),
            .init(name: "INDIGO", color: "#2237A8"),
            .init(name: "TURQUOISE", color: "#69D1ED"),
            .init(name: "MINT", color: "#87DBC8")
        ]
    }
}
