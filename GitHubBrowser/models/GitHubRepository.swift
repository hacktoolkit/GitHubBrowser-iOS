//
//  GitHubRepository.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import Foundation

class GitHubRepository: GitHubResource {

    // Repository attributes
    var name: String!
    var fullName: String!
    var description: String!
    var url: String!
    var htmlUrl: String!
    var cloneUrl: String!
    var gitUrl: String!
    var sshUrl: String!
    var mirrorUrl: String!
    var homepage: String!
    var forksCount: Int!
    var stargazersCount: Int!
    var watchersCount: Int!
    var size: Int!
    //    "size": 108,
    //    "default_branch": "master",
    //    "open_issues_count": 0,
    //    "has_issues": true,
    //    "has_wiki": true,
    //    "has_pages": false,
    //    "has_downloads": true,
    //    "pushed_at": "2011-01-26T19:06:43Z",
    //    "created_at": "2011-01-26T19:01:12Z",
    //    "updated_at": "2011-01-26T19:14:43Z",

    init(repositoryDict: repositoryDict) {
        self.name = repositoryDict["name"] as? String
    }
}

//{
//    "id": 1296269,
//    "owner": {
//        "login": "octocat",
//        "id": 1,
//        "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//        "gravatar_id": "somehexcode",
//        "url": "https://api.github.com/users/octocat",
//        "html_url": "https://github.com/octocat",
//        "followers_url": "https://api.github.com/users/octocat/followers",
//        "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//        "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//        "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//        "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//        "organizations_url": "https://api.github.com/users/octocat/orgs",
//        "repos_url": "https://api.github.com/users/octocat/repos",
//        "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//        "received_events_url": "https://api.github.com/users/octocat/received_events",
//        "type": "User",
//        "site_admin": false
//    },
//    "name": "Hello-World",
//    "full_name": "octocat/Hello-World",
//    "description": "This your first repo!",
//    "private": false,
//    "fork": true,
//    "url": "https://api.github.com/repos/octocat/Hello-World",
//    "html_url": "https://github.com/octocat/Hello-World",
//    "clone_url": "https://github.com/octocat/Hello-World.git",
//    "git_url": "git://github.com/octocat/Hello-World.git",
//    "ssh_url": "git@github.com:octocat/Hello-World.git",
//    "svn_url": "https://svn.github.com/octocat/Hello-World",
//    "mirror_url": "git://git.example.com/octocat/Hello-World",
//    "homepage": "https://github.com",
//    "language": null,
//    "forks_count": 9,
//    "stargazers_count": 80,
//    "watchers_count": 80,
//    "size": 108,
//    "default_branch": "master",
//    "open_issues_count": 0,
//    "has_issues": true,
//    "has_wiki": true,
//    "has_pages": false,
//    "has_downloads": true,
//    "pushed_at": "2011-01-26T19:06:43Z",
//    "created_at": "2011-01-26T19:01:12Z",
//    "updated_at": "2011-01-26T19:14:43Z",
//    "permissions": {
//        "admin": false,
//        "push": false,
//        "pull": true
//    }
//}
