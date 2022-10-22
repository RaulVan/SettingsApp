//
//  SettingsKitAccount.swift
//  SettingApp
//
//  Created by Eleven on 10/23/22.
//

import UIKit

public struct SettingsKitAccount: SettingsKitSetting {
    public var shouldHighlight: Bool
    
    public let icon: Icon?
    public var title: String
    public var children: [SettingsKitSection]?
    public let value: Value?
    
    public enum Value {
        case string(_: String)
    }
    
    public init(icon: Icon?, title: String, value: Value?, children: [SettingsKitSection]? = nil) {
        self.icon = icon
        self.title = title
        self.children = children
        self.value = value
        self.shouldHighlight = true
    }
    
    public func cellHeight() -> CGFloat {
        return 81
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitAccountCell"
    }
    
    
}
