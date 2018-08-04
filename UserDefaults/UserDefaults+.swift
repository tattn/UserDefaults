//
//  UserDefaults+.swift
//  UserDefaults
//
//  Created by Tatsuya Tanaka on 20170526.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation

// MARK:- UserDefaults.Key

public extension UserDefaults {
    public struct Key: RawRepresentable {
        public private(set) var rawValue: String

        public init(_ rawValue: String) {
            self.init(rawValue: rawValue)
        }

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

// MARK:- getter

public extension UserDefaults {
    public func get<T: Codable>(_ type: T.Type = T.self, for key: Key) -> T? {
        guard let data = data(for: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    public func object<T>(_ type: T.Type = T.self, for key: Key) -> T? {
        return object(forKey: key.rawValue) as? T
    }
    
    public func object(for key: Key) -> Any? {
        return object(forKey: key.rawValue)
    }

    public func string(for key: Key) -> String? {
        return string(forKey: key.rawValue)
    }
    
    public func array<T>(_ elementType: T, for key: Key) -> [T]? {
        return array(forKey: key.rawValue) as? [T]
    }

    public func array(for key: Key) -> [Any]? {
        return array(forKey: key.rawValue)
    }
    
    public func dictionary(for key: Key) -> [String : Any]? {
        return dictionary(forKey: key.rawValue)
    }

    public func data(for key: Key) -> Data? {
        return data(forKey: key.rawValue)
    }
    
    public func url(for key: Key) -> URL? {
        return url(forKey: key.rawValue)
    }

    public func integer(for key: Key) -> Int {
        return integer(forKey: key.rawValue)
    }

    public func float(for key: Key) -> Float {
        return float(forKey: key.rawValue)
    }

    public func double(for key: Key) -> Double {
        return double(forKey: key.rawValue)
    }

    public func bool(for key: Key) -> Bool {
        return bool(forKey: key.rawValue)
    }
}

// MARK:- setter

public extension UserDefaults {
    public func set<T: Codable>(_ value: T, for key: Key) {
        guard let data = try? JSONEncoder().encode(value) else { return }
        set(data, forKey: key.rawValue)
    }

    public func set(_ value: Any?, for key: Key) {
        set(value, forKey: key.rawValue)
    }
    
    public func set(_ url: URL?, for key: Key) {
        set(url, forKey: key.rawValue)
    }
    
    public func set(_ value: Int, for key: Key) {
        set(value, forKey: key.rawValue)
    }

    public func set(_ value: Float, for key: Key) {
        set(value, forKey: key.rawValue)
    }

    public func set(_ value: Double, for key: Key) {
        set(value, forKey: key.rawValue)
    }

    public func set(_ value: Bool, for key: Key) {
        set(value, forKey: key.rawValue)
    }
}

// MARK:- other

public extension UserDefaults {
    public func remove(for key: Key) {
        removeObject(forKey: key.rawValue)
    }
}
