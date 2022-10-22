//
//  SettingsKitToggle.swift
//  SettingsKit
//
//  Created by Seb Vidal on 02/09/2022.
//

import UIKit

public struct SettingsKitToggle: SettingsKitSetting {
    public var shouldHighlight: Bool
    
    public let icon: Icon?
    public let title: String
    public let children: [SettingsKitSection]?
    public let value: Value?
    
    public enum Value {
        case bool(_: Bool)
        case userDefaults(key: String)
    }
    
    @available(*, unavailable, renamed: "init(title:value:)")
    public init(icon: Icon? = nil, title: String, key: String) {
        self.icon = icon
        self.title = title
        self.children = []
        self.value = nil
        self.shouldHighlight = false
    }
    
    public init(icon: Icon? = nil, title: String, value: Value) {
        self.icon = icon
        self.title = title
        self.children = []
        self.value = value
        self.shouldHighlight = false
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitToggleCell"
    }
}
