//
//  OrganizationDetails.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class OrganizationDetailsViewController: GitHubBrowserTableViewController,
    GitHubOrganizationDelegate {

    let organizationName = "hacktoolkit"

    var locationLabel: UILabel!
    var nameLabel: UILabel!
    var organization: GitHubOrganization!
    var organizationImageView: UIImageView!
    var activityIndicatorView: UIActivityIndicatorView!

    override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let screen = screenRect()
        let tableHeaderView = UIView(frame: 
            CGRect(x: 0, y: 0, width: CGRectGetWidth(screen), height: 100)
        )
        tableHeaderView.backgroundColor = UIColor(
            white: 0, alpha: 0.1
        )
        self.mainTableView.tableHeaderView = tableHeaderView

        let imageViewWidth = CGRectGetHeight(tableHeaderView.frame) - 20
        organizationImageView = UIImageView(frame:
            CGRect(x: 10, y: 10, width: imageViewWidth, height: imageViewWidth)
        )
        organizationImageView.backgroundColor = UIColor(
            white: 0, alpha: 0.7
        )
        activityIndicatorView = UIActivityIndicatorView(
            activityIndicatorStyle: UIActivityIndicatorViewStyle.White
        )
        organizationImageView.addSubview(
            activityIndicatorView
        )
        activityIndicatorView.frame = CGRect(
            x: (CGRectGetWidth(organizationImageView.frame) - 
                CGRectGetWidth(activityIndicatorView.frame)) * 0.5,
            y: (CGRectGetHeight(organizationImageView.frame) -
                CGRectGetHeight(activityIndicatorView.frame)) * 0.5,
            width: CGRectGetWidth(activityIndicatorView.frame),
            height: CGRectGetHeight(activityIndicatorView.frame)
        )
        activityIndicatorView.startAnimating()
        tableHeaderView.addSubview(organizationImageView)

        nameLabel = UILabel(frame:
            CGRect(
                x: CGRectGetMinX(organizationImageView.frame) +
                    CGRectGetWidth(organizationImageView.frame) + 10,
                y: CGRectGetMinY(organizationImageView.frame),
                width: CGRectGetWidth(screen),
                height: imageViewWidth * 0.5
            )
        )
        nameLabel.font = UIFont.boldSystemFontOfSize(22)
        tableHeaderView.addSubview(nameLabel)

        locationLabel = UILabel(frame:
            CGRect(
                x: CGRectGetMinX(nameLabel.frame),
                y: CGRectGetMaxY(nameLabel.frame),
                width: CGRectGetWidth(nameLabel.frame),
                height: CGRectGetHeight(nameLabel.frame)
            )
        )
        locationLabel.font = UIFont.systemFontOfSize(15)
        locationLabel.textColor = UIColor(white: 0, alpha: 0.5)
        tableHeaderView.addSubview(locationLabel)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var org = GitHubOrganization(name: organizationName, onInflated: {
            (org: GitHubResource) -> () in

            if let org = org as? GitHubOrganization {
                self.organization          = org
                self.organization.delegate = self
                self.locationLabel.text = self.organization.location
                self.nameLabel.text     = self.organization.name
                if self.title == nil {
                    self.title = self.organization.name
                }

                dispatch_async(dispatch_get_main_queue(), {
                    if self.organization.avatarUrl != nil {
                        var test =  UIImage(data: NSData(contentsOfURL: 
                                NSURL(string: self.organization.avatarUrl)
                            )
                        )
                        self.organizationImageView.image = test
                        self.activityIndicatorView.stopAnimating()
                    }
                });
            }
        })
        org.getRepositories {
            (repositories: [GitHubRepository]) -> () in
        }
        self.mainTableView.reloadData()
    }

    let repo1 = GitHubRepository(repositoryDict: [
        "description": "Description",
        "name": "Repo 1"
    ])

    // Methods
    func objects() -> [GitHubRepository] {
        if self.organization != nil {
            return self.organization.repositories
        }
        // return [repo1]
        return [GitHubRepository]()
    }
    func objectAtIndexPath(indexPath: NSIndexPath) -> GitHubRepository {
        return objects()[indexPath.row]
    }

    // Protocols
    // Protocols - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, 
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseIdentifier = "ReuseIdentifier"
        let tableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1,
          reuseIdentifier: reuseIdentifier
        )
        let repository = objectAtIndexPath(indexPath)
        let nameLabel = UILabel(frame: 
            CGRect(
                x: 15,
                y: 22,
                width: 300,
                height: 27
            )
        ) 
        nameLabel.font = UIFont.boldSystemFontOfSize(18)
        nameLabel.text = repository.name
        tableViewCell.contentView.addSubview(nameLabel)
        let descLabel = UILabel(frame:
            CGRect(
                x: 15,
                y: 22 + 27,
                width: 300,
                height: 22
            )
        )
        descLabel.text = repository.description
        descLabel.textColor = self.locationLabel.textColor
        tableViewCell.contentView.addSubview(descLabel)
        return tableViewCell
    }
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return objects().count
    }

    // Protocols - UITableViewDelegate
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let repository = objectAtIndexPath(indexPath)
        let vc = RepositoryDetailsViewController(
            repository: repository
        )
        println(repository.name)
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    func tableView(tableView: UITableView, 
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }

    // Protocols - GitHubOrganizationDelegate
    func didFinishFetching() {
        self.mainTableView.reloadData()
    }
}
