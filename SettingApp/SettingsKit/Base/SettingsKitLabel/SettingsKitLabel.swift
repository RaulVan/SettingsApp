//
//  SettingsKitLabel.swift
//  SettingsKit
//
//  Created by Seb Vidal on 05/09/2022.
//

import UIKit


public struct SettingsKitLabel: SettingsKitSetting {
    public var shouldHighlight: Bool
    
    public let title: String
    public let children: [SettingsKitSection]?
    public let value: Value?
    
    public enum Value {
        case string(_: String)
        case userDefaults(key: String)
    }
    
    @available(*, unavailable, renamed: "init(title:value:)")
    public init(title: String, key: String) {
        self.title = title
        self.children = nil
        self.value = nil
        self.shouldHighlight = false
    }
    
    public init(title: String, value: Value, children: [SettingsKitSection]? = nil, shouldHighlight: Bool = false) {
        self.title = title
        self.children = nil
        self.value = value
        self.shouldHighlight = shouldHighlight
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitLabelCell"
    }
}
