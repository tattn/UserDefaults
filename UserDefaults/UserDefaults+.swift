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
    struct Key: RawRepresentable {
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
    func get<T: Codable>(_ type: T.Type = T.self, for key: Key) -> T? {
        guard let data = data(for: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    func object<T>(_ type: T.Type = T.self, for key: Key) -> T? {
        return object(forKey: key.rawValue) as? T
    }
    
    func object(for key: Key) -> Any? {
        return object(forKey: key.rawValue)
    }

    func string(for key: Key) -> String? {
        return string(forKey: key.rawValue)
    }
    
    func array<T>(_ elementType: T, for key: Key) -> [T]? {
        return array(forKey: key.rawValue) as? [T]
    }

    func array(for key: Key) -> [Any]? {
        return array(forKey: key.rawValue)
    }
    
    func dictionary(for key: Key) -> [String : Any]? {
        return dictionary(forKey: key.rawValue)
    }

    func data(for key: Key) -> Data? {
        return data(forKey: key.rawValue)
    }
    
    func url(for key: Key) -> URL? {
        return url(forKey: key.rawValue)
    }

    func integer(for key: Key) -> Int {
        return integer(forKey: key.rawValue)
    }

    func float(for key: Key) -> Float {
        return float(forKey: key.rawValue)
    }

    func double(for key: Key) -> Double {
        return double(forKey: key.rawValue)
    }

    func bool(for key: Key) -> Bool {
        return bool(forKey: key.rawValue)
    }
}

// MARK:- setter

public extension UserDefaults {
    func set<T: Codable>(_ value: T, for key: Key) {
        guard let data = try? JSONEncoder().encode(value) else { return }
        set(data, forKey: key.rawValue)
    }

    func set(_ value: Any?, for key: Key) {
        set(value, forKey: key.rawValue)
    }
    
    func set(_ url: URL?, for key: Key) {
        set(url, forKey: key.rawValue)
    }
    
    func set(_ value: Int, for key: Key) {
        set(value, forKey: key.rawValue)
    }

    func set(_ value: Float, for key: Key) {
        set(value, forKey: key.rawValue)
    }

    func set(_ value: Double, for key: Key) {
        set(value, forKey: key.rawValue)
    }

    func set(_ value: Bool, for key: Key) {
        set(value, forKey: key.rawValue)
    }
}

// MARK:- other

public extension UserDefaults {
    func remove(for key: Key) {
        removeObject(forKey: key.rawValue)
    }
}
