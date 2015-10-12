//
//  AppInfo.swift
//  AppStoreParser
//
//  Created by Luo Sheng on 15/10/12.
//  Copyright © 2015年 Pop Tap. All rights reserved.
//

import Foundation

public struct AppInfo {
    let title: String?
    let descriptionHTMLString: String?
    let category: String?
    let iconURLString: String?
    let iPhoneScreenshots: [String?]
    let iPadScreenshots: [String?]
    let watchScreenshots: [String?]
}