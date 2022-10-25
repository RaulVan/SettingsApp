//
//  SettingsKitToggleCell.swift
//  SettingsKit
//
//  Created by Seb Vidal on 29/08/2022.
//

import UIKit

class SettingsKitToggleCell: UITableViewCell, SettingsKitCell {
    private var setting: SettingsKitToggle!

    private var iconView: UIView = UIView()
    private var iconImageView = UIImageView()
    private var titleLabel: UILabel = UILabel()
    private var switchView: UISwitch = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with setting: any SettingsKitSetting, parent: SettingsKitTableViewController) {
        self.setting = setting as? SettingsKitToggle
        
        setupCell()
        setupIconView()
        setupTitleLabel()
        setupSwitchView()
    }
    
    private func setupCell() {
        isUserInteractionEnabled = true
        separatorInset = UIEdgeInsets(top: 0, left: setting.icon == nil ? 20 : 64, bottom: 0, right: 0)
    }
    
    private func setupIconView() {
        if let view = setting.icon?.view() {
            
//            if iconView == nil {
//                iconView = view
//                addSubview(iconView!)
//
//                NSLayoutConstraint.activate([
//                    iconView!.centerYAnchor.constraint(equalTo: centerYAnchor),
//                    iconView!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
//                ])
                
                iconView.clipsToBounds = true
                iconView.layer.cornerRadius = 6.5
                iconView.backgroundColor = .clear
                iconView.layer.cornerCurve = .continuous
                iconView.translatesAutoresizingMaskIntoConstraints = false
                addSubview(iconView)
                
                iconImageView.tintColor = .white
                iconImageView.image = setting.icon?.symbol //symbol?.withConfiguration(config)
                iconImageView.translatesAutoresizingMaskIntoConstraints = false
                iconImageView.contentMode = .scaleAspectFit
                iconView.addSubview(iconImageView)
                
                NSLayoutConstraint.activate([
                    iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                    iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    iconView.widthAnchor.constraint(equalToConstant: 29),
                    iconView.heightAnchor.constraint(equalToConstant: 29),
                    iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
                    iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
                ])

//            }
        }
        
    }
    
    private func setupTitleLabel() {

        titleLabel.text = setting.title
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        
        var iconViewLeadingAnchor: NSLayoutXAxisAnchor {
            return setting.icon != nil ? iconView.trailingAnchor : leadingAnchor
        }
        
        var iconViewLeadingConstant: CGFloat {
            return setting.icon != nil ? 14 : 20
        }
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconViewLeadingAnchor, constant: iconViewLeadingConstant)
        ])
    }
    
    private func setupSwitchView() {
        
        switchView.isOn = boolValue()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        
        contentView.addSubview(switchView)
        
        NSLayoutConstraint.activate([
            switchView.centerYAnchor.constraint(equalTo: centerYAnchor),
            switchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
        ])
    }
    
    private func boolValue() -> Bool {
        if let value = setting.value {
            switch value {
            case .bool(let bool):
                return bool
            case .userDefaults(let key):
                return UserDefaults.standard.bool(forKey: key)
            }
        }
        
        return false
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        if case let .userDefaults(key) = setting.value {
            UserDefaults.standard.set(sender.isOn, forKey: key)
        }
    }
}
