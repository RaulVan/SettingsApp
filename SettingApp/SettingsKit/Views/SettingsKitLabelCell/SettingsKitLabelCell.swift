//
//  SettingsKitLabelCell.swift
//  SettingsKit
//
//  Created by Seb Vidal on 05/09/2022.
//

import UIKit

class SettingsKitLabelCell: UITableViewCell, SettingsKitCell {
    private var setting: SettingsKitLabel!
    
    private var titleLabel: UILabel!
    private var detailLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with setting: any SettingsKitSetting, parent: SettingsKitTableViewController) {
        self.setting = setting as? SettingsKitLabel
        
        setupCell()
        setupTitleLabel()
        setupDetailLabel()
    }
    
    private func setupCell() {
        isUserInteractionEnabled = true
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        guard let children = setting.children else { return }
        
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            if let isRoot = parent?.isRoot, !isRoot {
//                accessoryType = children.isEmpty ? .none : .disclosureIndicator
//            }
//        } else {
            accessoryType = children.isEmpty ? .none : .disclosureIndicator
//        }
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = setting.title
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func setupDetailLabel() {
        detailLabel = UILabel()
        detailLabel.textColor = .secondaryLabel
        detailLabel.font = .systemFont(ofSize: 17)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.text = stringValue()
        
        addSubview(detailLabel)
        
        var trail: CGFloat = -22
        if let children = setting.children, !children.isEmpty {
            trail = -37
        }
        
        NSLayoutConstraint.activate([
            detailLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trail),
        ])
    }
    
    func stringValue() -> String? {
        if let value = setting.value {
            switch value {
            case .userDefaults(let key):
                return UserDefaults.standard.string(forKey: key)
            case .string(let string):
                return string
            }
        }
        
        return nil
    }
}
