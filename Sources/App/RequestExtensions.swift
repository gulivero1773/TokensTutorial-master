//
//  RequestExtensions.swift
//  App
//
//  Created by Mykola Buhaiov on 10.04.2020.
//

import Vapor
import JWT

extension Request {
    
    var token: String {
        if let token = self.http.headers[.authorization].first {
            return token
        } else {
            return ""
        }
    }
    
    func authorizedUser() throws -> Future<User> {
        let userID = try TokenHelpers.getUserID(fromPayloadOf: self.token)
        
        return User.find(userID, on: self).unwrap(or: Abort(.unauthorized, reason: "Authorized user not found"))
    }
}
