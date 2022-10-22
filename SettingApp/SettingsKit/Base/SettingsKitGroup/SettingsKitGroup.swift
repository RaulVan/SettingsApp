//
//  SettingsKitGroup.swift
//  SettingsKit
//
//  Created by Seb Vidal on 02/09/2022.
//

import UIKit


public struct Icon {
    var symbol: UIImage?
    var config: UIImage.SymbolConfiguration
    var colour: UIColor
    
    
    public init(name: String) {
        self.symbol = UIImage(named: name)
        self.config = .init(pointSize: 21)
        self.colour = .white
    }
    
//    public init(symbol: UIImage? = nil, config: UIImage.SymbolConfiguration = .init(pointSize: 21), colour: UIColor) {
//        self.symbol = symbol
//        self.config = config
//        self.colour = colour
//    }
    
    func view(_ width: CGFloat = 29, _ radius: CGFloat = 6.5 ) -> UIView {
        let iconView = UIView()
        iconView.clipsToBounds = true
        iconView.layer.cornerRadius = 6.5
        iconView.backgroundColor = .clear
        iconView.layer.cornerCurve = .continuous
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView()
        iconImageView.tintColor = .white
        iconImageView.image = symbol //symbol?.withConfiguration(config)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        iconView.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: width),
            iconView.heightAnchor.constraint(equalToConstant: width),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor)
        ])
        
        return iconView
    }
}

public struct SettingsKitGroup: SettingsKitSetting {
    public var shouldHighlight: Bool
    
    public let icon: Icon?
    public let title: String
    public let titleColor: UIColor?
    public let children: [SettingsKitSection]?
    public let value: Value?
    
    public enum Value {
        case string(_: String)
        case userDefaults(key: String)
    }
    
    public init(icon: Icon? = nil, title: String, children: [SettingsKitSection]? = nil,  shouldHighlight: Bool = false) {
        self.icon = icon
        self.title = title
        self.children = children
        self.value = nil
        self.titleColor = .black
        self.shouldHighlight = shouldHighlight
    }
    
    public init(icon: Icon? = nil, title: String, value: Value? = nil, children: [SettingsKitSection]? = nil,  shouldHighlight: Bool = false) {
        self.icon = icon
        self.title = title
        self.children = children
        self.value = value
        self.titleColor = .black
        self.shouldHighlight = shouldHighlight
    }
    
    public init(icon: Icon? = nil, title: String, titleColor: UIColor? = .black, value: Value? = nil, children: [SettingsKitSection]? = nil,  shouldHighlight: Bool = false) {
        self.icon = icon
        self.title = title
        self.children = children
        self.value = value
        self.titleColor = titleColor
        self.shouldHighlight = shouldHighlight
    }
    
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitGroupCell"
    }
}

public extension SettingsKitGroup {
    
}
