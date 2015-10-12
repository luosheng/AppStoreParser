//
//  AppInfo.swift
//  AppStoreParser
//
//  Created by Luo Sheng on 15/10/12.
//  Copyright © 2015年 Pop Tap. All rights reserved.
//

import Foundation

public struct AppInfo {
    public let title: String?
    public let descriptionHTMLString: String?
    public let category: String?
    public let iconURLString: String?
    public let iPhoneScreenshots: [String?]
    public let iPadScreenshots: [String?]
    public let watchScreenshots: [String?]
}