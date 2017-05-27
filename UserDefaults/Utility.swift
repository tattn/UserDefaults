//
//  Utility.swift
//  UserDefaults
//
//  Created by Tatsuya Tanaka on 20170527.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation

extension UserDefaults.Key: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self = UserDefaults.Key(value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
}
