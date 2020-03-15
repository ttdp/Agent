//
//  Agent.swift
//  Agent
//
//  Created by Tian Tong on 3/15/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

public enum Scheme: String {
    case https
    case http
    case wss
    case ws
}

public enum Session {
    case standard
    case ephemeral
    case background(String)
}

public struct Agent {
    
    let scheme: Scheme
    let host: String
    let session: Session
    
    public var url: String {
        return scheme.rawValue + "://" + host
    }
    
    public init(scheme: Scheme = .https, host: String, session: Session = .standard) {
        self.scheme = scheme
        self.host = host
        self.session = session
    }
    
}