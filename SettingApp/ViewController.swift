//
//  ViewController.swift
//  SettingApp
//
//  Created by Eleven on 10/22/22.
//

import UIKit

class ViewController: SettingsKitViewController {
    
    let rootSections: [SettingsKitSection] = [
        SettingsKitSection(
            settings: [
                SettingsKitGroup(icon: nil, title: "通用")
            ]
        )
    ]
    
    init() {
        super.init(sections: self.rootSections)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override init(sections: [SettingsKitSection]) {
//        super.init(sections: rootSections)
//    }
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "设置"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
    }


}

