//
//  TodoDto.swift
//  App
//
//  Created by Mykola Buhaiov on 10.04.2020.
//

import Vapor

struct TodoDto: Content {
    
    let id: Int?
    let title: String
}
