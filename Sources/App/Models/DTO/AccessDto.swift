//
//  AccessDto.swift
//  App
//
//  Created by Mykola Buhaiov on 10.04.2020.
//

import Vapor

struct AccessDto: Content {
    let refreshToken: String
    let accessToken: String
    let expiredAt: Date
}
