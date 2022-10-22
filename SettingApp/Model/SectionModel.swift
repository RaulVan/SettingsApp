//
//  SectionModel.swift
//  SettingApp
//
//  Created by Eleven on 10/22/22.
//

import UIKit

class SectionModel {
    
    
    var rootSections: [SettingsKitSection] = []
    var generalSections: [SettingsKitSection] = []
    var aboutSections: [SettingsKitSection] = []
    
    init() {
        
        let hasNextSections = [
            SettingsKitSection(settings: [SettingsKitLabel(title: "", value: .string(""))])
        ]
        
        
        aboutSections = [
            SettingsKitSection(settings: [
                SettingsKitGroup(title: "名称", value: .string("iPhone"), children: hasNextSections),
                SettingsKitGroup(title: "iOS 版本", value: .string("16.0.2(20A380)"), children: hasNextSections),
                SettingsKitLabel(title: "型号名称", value: .string("iPhone 14 Pro Max")),
                SettingsKitLabel(title: "型号号码", value: .string("MQ8A3CH/A")),
                SettingsKitLabel(title: "序列号", value: .string("HJYWNXQHKY"))
            ]),
            SettingsKitSection(settings: [
                SettingsKitLabel(title: "歌曲", value: .string("0")),
                SettingsKitLabel(title: "视频", value: .string("0")),
                SettingsKitLabel(title: "照片", value: .string("1")),
                SettingsKitLabel(title: "应用程序", value: .string("8")),
                SettingsKitLabel(title: "总容量", value: .string("256 GB")),
                SettingsKitLabel(title: "可用容量", value: .string("240.09 GB")),
            ]),
            SettingsKitSection(settings: [
                SettingsKitLabel(title: "无线局域网地址", value: .string("18:FA:B7:22:0E:77")),
                SettingsKitLabel(title: "蓝牙", value: .string("18:FA:B7:1B:8A:94")),
                SettingsKitLabel(title: "调制解调器固件", value: .string("1.00.05")),
                SettingsKitGroup(title: "SEID", children: hasNextSections),
                SettingsKitLabel(title: "运营商锁", value: .string("无SIM卡限制")),
            ]),
            SettingsKitSection(settings: [
                SettingsKitLabel(title: "网络", value: .string("中国联通")),
                SettingsKitLabel(title: "运营商", value: .string("中国联通 51.0.1")),
                SettingsKitLabel(title: "IEMI", value: .string("35 278498 700782 3")),
                SettingsKitLabel(title: "ICCID", value: .string("89860118801324065078")),
            ], header: "正面SIM卡"),
            
            SettingsKitSection(settings: [
                SettingsKitLabel(title: "IMEI2", value: .string("35 278498 748538 3"))
            ], header: "背面SIM卡"),
            SettingsKitSection(settings: [
                SettingsKitGroup(title: "证书信任设置", children: hasNextSections)
            ]),
        ]
        
        generalSections = [
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(title: "关于本机",children: aboutSections),
                    SettingsKitGroup(title: "软件更新",children: aboutSections)
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(title: "隔空投送",children: aboutSections),
                    SettingsKitGroup(title: "隔空播放与接力",children: aboutSections),
                    SettingsKitGroup(title: "画中画",children: aboutSections),
                    SettingsKitGroup(title: "CarPlay车载",children: aboutSections),
                    SettingsKitGroup(title: "NFC",children: aboutSections),
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(title: "iPhone存储空间",children: aboutSections),
                    SettingsKitGroup(title: "后台App刷新",children: aboutSections)
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(title: "日期与时间",children: aboutSections),
                    SettingsKitGroup(title: "键盘",children: aboutSections),
                    SettingsKitGroup(title: "字体",children: aboutSections),
                    SettingsKitGroup(title: "语言与地区",children: aboutSections),
                    SettingsKitGroup(title: "词典",children: aboutSections)
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(title: "VPN与设备管理",children: aboutSections)
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(title: "法律与监管",children: aboutSections)
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(title: "传输或还原iPhone",children: aboutSections),
                    SettingsKitGroup(title: "关机", titleColor: .systemBlue ,children: nil, shouldHighlight: true)
                ]
            ),
        ]
        
        
        rootSections = [
            SettingsKitSection(
                settings: [
                    SettingsKitAccount(icon: Icon(name: "头像"), title: "登录 iPhone", value: .string("设置 iCloud、App Store 等。"))
            ]),
            SettingsKitSection(
                settings: [
                    
                    SettingsKitToggle(icon:Icon(name:"飞行模式"), title: "飞行模式", value: .bool(false)),
                    SettingsKitGroup(icon: Icon(name: "无线局域网"), title: "无线局域网",value: .string("未连接") ,children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "蓝牙"), title: "蓝牙", value: .string("打开"), children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "蜂窝网络"), title: "蜂窝网络", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "个人热点"), title: "个人热点", value: .string("关闭"),children: hasNextSections),
//                    SettingsKitGroup(icon: Icon(name: "VPN"), title: "VPN", value: .string("未连接"),children: hasNextSections)
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(icon: Icon(name: "通知"), title: "通知", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "声音与触感"), title: "声音与触感", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "专注模式"), title: "专注模式", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "屏幕使用时间"), title: "屏幕使用时间", children: hasNextSections),
                ]
            ),
            
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(icon: Icon(name: "通用"), title: "通用", children: generalSections),
                    SettingsKitGroup(icon: Icon(name: "控制中心"), title: "控制中心", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "显示与亮度"), title: "显示与亮度", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "辅助功能"), title: "辅助功能", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "墙纸"), title: "墙纸", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "Siri"), title: "Siri与搜索", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "面容"), title: "面容ID与密码", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "SOS"), title: "SOS紧急联络", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "暴露通知"), title: "暴露通知", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "电池"), title: "电池", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "隐私与安全"), title: "隐私与安全", children: hasNextSections),
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(icon: Icon(name: "Appstore"), title: "App Store", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "钱包"), title: "钱包与 Apple Pay", children: hasNextSections)
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(icon: Icon(name: "密码"), title: "密码", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "邮件"), title: "邮件", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "通讯录"), title: "通讯录", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "日历"), title: "日历", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "备忘录"), title: "备忘录", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "提醒事项"), title: "提醒事项", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "语音备忘录"), title: "语音备忘录", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "电话"), title: "电话", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "信息"), title: "信息", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "Facetime"), title: "FaceTime通话", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "Safari"), title: "Safari浏览器", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "天气"), title: "天气", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "翻译"), title: "翻译", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "地图"), title: "地图", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "指南针"), title: "指南针", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "测距仪"), title: "测距仪", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "快捷指令"), title: "快捷指令", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "健康"), title: "健康", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "家庭"), title: "家庭", children: hasNextSections),
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(icon: Icon(name: "音乐"), title: "音乐", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "视频"), title: "视频", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "照片"), title: "照片", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "相机"), title: "相机", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "图书"), title: "图书", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "播客"), title: "播客", children: hasNextSections),
                    SettingsKitGroup(icon: Icon(name: "GameCenter"), title: "Game Center", children: hasNextSections),
                ]
            ),
            SettingsKitSection(
                settings: [
                    SettingsKitGroup(icon: Icon(name: "电视提供商"), title: "电视提供商", children: hasNextSections)
                ]
            ),
        ]
        
        
        
        
    }
}
