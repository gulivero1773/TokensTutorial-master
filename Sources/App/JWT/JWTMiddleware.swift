//
//  JWTMiddleware.swift
//  App
//
//  Created by Mykola Buhaiov on 10.04.2020.
//

import Vapor
import JWT

class JWTMiddleware: Middleware {
    
    func respond(to request: Request, chainingTo next: Responder) throws -> EventLoopFuture<Response> {
        if let token = request.http.headers[.authorization].first {
            do {
                try TokenHelpers.verifyToken(token)
                return try next.respond(to: request)
            } catch let error as JWTError {
                throw Abort(.unauthorized, reason: error.reason)
            }
        } else {
            throw Abort(.unauthorized, reason: "No Access Token")
        }
    }
}
