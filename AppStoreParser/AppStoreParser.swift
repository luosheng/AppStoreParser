//
//  AppStoreParser.swift
//  AppStoreParser
//
//  Created by Luo Sheng on 15/10/12.
//  Copyright © 2015年 Pop Tap. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

public enum Error: ErrorType {
    case NetworkError
    case DocError
}

public func parseAppInfoForIdentifier(identifier: String, callback: ((AppInfo?, Error?)) -> ()) {
    Alamofire.request(.GET, "https://itunes.apple.com/app/id\(identifier)")
        .responseString { response in
            guard let htmlString = response.result.value else {
                callback((nil, Error.NetworkError))
                return
            }
            guard let doc = HTML(html: htmlString, encoding: NSUTF8StringEncoding) else {
                callback((nil, Error.DocError))
                return
            }
            let info = AppInfo(doc: doc)
            callback((info, nil))
    }
}

private extension AppInfo {
    init(doc: HTMLDocument) {
        title = doc.xpath("//h1[@itemprop='name']").first?.text
        descriptionHTMLString = doc.xpath("//p[@itemprop='description']").first?.toHTML
        category = doc.xpath("//span[@itemprop='applicationCategory']").first?.text
        iconURLString = doc.xpath("//img[@class='artwork']").first?["src-swap-high-dpi"]
        iPhoneScreenshots = doc.xpath("//div[contains(@class,'iphone-screen-shots')]//img").map { $0["src"] }
        iPadScreenshots = doc.xpath("//div[contains(@class,'ipad-screen-shots')]//img").map { $0["src"] }
        watchScreenshots = doc.xpath("//div[@id='watch-screenshots-swoosh']//img").map { $0["src"] }
    }
}
