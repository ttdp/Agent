//
//  Response.swift
//  Agent
//
//  Created by Tian Tong on 3/16/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

public struct Response {
    
    public let data: Data?
    public let urlResponse: URLResponse?
    public let error: Error?
    
    public var statusCode: Int {
        return (urlResponse as? HTTPURLResponse)?.statusCode ?? 0
    }
    
    public var headerFields: [String: Any] {
        return (urlResponse as? HTTPURLResponse)?.allHeaderFields as? [String: Any] ?? [:]
    }
    
    public var json: [String: Any]? {
        return parseData()
    }
    
    private func parseData() -> [String: Any]? {
        if let jsonData = data {
            return try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
        } else {
            return nil
        }
    }
    
}

extension Response {
    init(error: Error) {
        self.init(data: nil, urlResponse: nil, error: error)
    }
}
