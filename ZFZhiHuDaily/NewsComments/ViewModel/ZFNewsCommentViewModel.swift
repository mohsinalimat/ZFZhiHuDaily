//
//  ZFNewsCommentViewModel.swift
//  ZFZhiHuDaily
//
//  Created by 任子丰 on 16/1/29.
//  Copyright © 2016年 任子丰. All rights reserved.
//

import UIKit
import SwiftyJSON

class ZFNewsCommentViewModel {
    typealias LongCommentSuccessBlock = (commentsArray: [ZFComments]) -> Void
    
    func getLongComment(newsId: String, longComment : LongCommentSuccessBlock?) {
        ZFNetworkTool.get(NEWS_LONG_COMMENT(newsId), params: nil, success: { (json) -> Void in
            print("======\(json)")
            var comments: [ZFComments]?
            comments = []
            if let items = JSON(json)["comments"].array {
                for item in items {
                    comments?.append(ZFComments(json: item))
                }
                if longComment != nil {
                    longComment!(commentsArray: comments!)
                }
            } else {
                comments = nil
            }
        }) { (error) -> Void in
                
        }
    }
    
}