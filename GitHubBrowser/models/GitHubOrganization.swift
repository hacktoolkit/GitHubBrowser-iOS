//
//  GitHubOrganization.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import Foundation


class GitHubOrganization: GitHubResource {
    // https://developer.github.com/v3/orgs/

    let GITHUB_ORGANIZATION_RESOURCE_BASE = "/orgs/"

    // meta
    var handle: String

    // Organization attributes
    var login: String!
    var id: Int!
    var url: String!
    var avatarUrl: String!
    var name: String!
    var company: String!
    var blog: String!
    var location: String!
    var email: String!
    var publicRepos: Int!
    var publicGists: Int!
    var followers: Int!
    var following: Int!
    var htmlURL: String!

    init(name: String, onInflated: ((GitHubResource) -> ())? = nil) {
        self.handle = name
        super.init(onInflated)
    }

    override func getResourceURL() -> String {
        var resource = "\(GITHUB_ORGANIZATION_RESOURCE_BASE)\(self.handle)"
        return resource
    }

    override func inflater(resultJSON: NSDictionary) {
        self.login = resultJSON["login"] as? String
        self.id = resultJSON["id"] as? Int
        self.url = resultJSON["url"] as? String
        self.avatarUrl = resultJSON["avatar_url"] as? String
        self.name = resultJSON["name"] as? String
        self.company = resultJSON["company"] as? String
        self.blog = resultJSON["blog"] as? String
        self.location = resultJSON["location"] as? String
        self.email = resultJSON["email"] as? String
        self.publicRepos = resultJSON["publicRepos"] as? Int
        self.publicGists = resultJSON["publicGists"] as? Int
        self.followers = resultJSON["followers"] as? Int
        self.following = resultJSON["following"] as? Int
        self.htmlURL = resultJSON["htmlURL"] as? String

        super.inflater(resultJSON)
    }
}

//{
//    "login": "github",
//    "id": 1,
//    "url": "https://api.github.com/orgs/github",
//    "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//    "name": "github",
//    "company": "GitHub",
//    "blog": "https://github.com/blog",
//    "location": "San Francisco",
//    "email": "octocat@github.com",
//    "public_repos": 2,
//    "public_gists": 1,
//    "followers": 20,
//    "following": 0,
//    "html_url": "https://github.com/octocat",
//    "created_at": "2008-01-14T04:33:35Z",
//    "type": "Organization"
//}