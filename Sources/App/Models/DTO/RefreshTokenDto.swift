//
//  RefreshTokenDto.swift
//  App
//
//  Created by Mykola Buhaiov on 10.04.2020.
//

import Vapor

struct RefreshTokenDto: Content {
    let refreshToken: String
}
