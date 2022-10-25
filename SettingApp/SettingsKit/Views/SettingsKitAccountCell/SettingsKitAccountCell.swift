//
//  SettingsKitAccountCell.swift
//  SettingApp
//
//  Created by Eleven on 10/23/22.
//

import UIKit

class SettingsKitAccountCell: UITableViewCell, SettingsKitCell {
    private var setting: SettingsKitAccount!
    
    private var iconView: UIView = UIView()
    private var iconImageView = UIImageView()
    private var titleLabel = UILabel()
    private var detailLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCell(with setting: any SettingsKitSetting, parent: SettingsKitTableViewController) {
        self.setting = setting as? SettingsKitAccount
        setupIconView()
        setupTitleLabel()
        setupDetailLabel()
    }
    
    
    private func setupIconView() {
        if let view = setting.icon?.view(58,29) {
//            if iconView == nil {
//                iconView = view
//                addSubview(iconView!)
//                NSLayoutConstraint.activate([
//                    iconView!.centerYAnchor.constraint(equalTo: centerYAnchor),
//                    iconView!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
//                ])
//            }
//
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
                iconView.widthAnchor.constraint(equalToConstant: 58),
                iconView.heightAnchor.constraint(equalToConstant: 58),
                iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
                iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            ])
        }
        
        
    }
    
    private func setupTitleLabel() {
        titleLabel.textColor = .systemBlue
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
            titleLabel.bottomAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconViewLeadingAnchor, constant: iconViewLeadingConstant)
        ])
    }
    
    private func setupDetailLabel() {
        detailLabel.textColor = .secondaryLabel
        detailLabel.font = .systemFont(ofSize: 13)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.text = stringValue()
        
        addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 2),
            detailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if UIDevice.current.userInterfaceIdiom == .pad {
            titleLabel.textColor = selected ? .white : .label
        }
    }
    
    func stringValue() -> String? {
        if let value = setting.value {
            switch value {
            case .string(let string):
                return string
            }
        }
        
        return nil
    }
}
