//
//  SettingsKitTextField.swift
//  SettingsKit
//
//  Created by Seb Vidal on 02/09/2022.
//

import UIKit

public struct SettingsKitTextField: SettingsKitSetting {
    public var shouldHighlight: Bool
    
    public let title: String
    public let children: [SettingsKitSection]?
    public let type: UIKeyboardType
    public let value: Value?
    
    public enum Value {
        case string(_: String)
        case userDefaults(key: String)
    }
    
    @available(*, unavailable, renamed: "init(title:type:key:)")
    public init(title: String, type: UIKeyboardType = .default, key: String) {
        self.title = title
        self.children = nil
        self.type = type
        self.value = nil
        self.shouldHighlight = false
    }
    
    public init(title: String, type: UIKeyboardType = .default, value: Value) {
        self.title = title
        self.children = nil
        self.type = type
        self.value = value
        self.shouldHighlight = false
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitTextFieldCell"
    }
}
