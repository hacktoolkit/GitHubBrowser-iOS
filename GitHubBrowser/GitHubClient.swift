//
//  GitHubClient.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import Foundation

let GITHUB_API_BASE_URL = "https://api.github.com"

class GitHubClient {

    var cache = [String:AnyObject]()

    class var sharedInstance : GitHubClient {
        struct Static {
            static var token : dispatch_once_t = 0
            static var instance : GitHubClient? = nil
        }
        dispatch_once(&Static.token) {
            Static.instance = GitHubClient()
        }
        return Static.instance!
    }

    func makeApiRequest(resource: String, callback: (AnyObject) -> ()) {
        var apiUrl = "\(GITHUB_API_BASE_URL)\(resource)"
        let request = NSMutableURLRequest(URL: NSURL.URLWithString(apiUrl))

        var cachedResult: AnyObject? = cache[apiUrl]
        if cachedResult != nil {
            callback(cachedResult!)
        } else {
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) in
                var errorValue: NSError? = nil
                let result: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &errorValue)
                if result != nil {
                    callback(result!)
                    self.cache[apiUrl] = result!
                } else {
                    HTKNotificationUtils.displayNetworkErrorMessage()
                }
            })
        }
    }
}
