GitHubBrowser-iOS
=================

This is a graphical browser for GitHub.

Browse and discover GitHub in a visual way, with rich content at each level

## GIF Screen Cap

Here's an animated GIF (made with [LiceCAP](http://www.cockos.com/licecap/)) of what it looks like:

![](https://raw.githubusercontent.com/hacktoolkit/GitHubBrowser-iOS/master/github_browser_screencap.gif)

## Download and Build Instructions

* Clone the repository
* Install [CocoaPods](http://cocoapods.org/)
  * `sudo gem install cocoapods`
* Install Pods
  * `pod install`
* Set up API keys
  * Create a `secrets.xcconfig` config file based on `secrets.xcconfig.template`
  * Obtain API keys from the ....  and add the keys to `secrets.xcconfig`
* Run it!

## Features

* Drill-down navigation of GitHub repositories and popping in/out of Navigation Controller
* [x] Organization Details
* [x] Browse repositories in Organization
* [x] Display `README` in webview
* [-] Repository Details
* [-] File Details

## Credits

* Jonathan Tsai [@jontsai](https://github.com/jontsai)
* Tommy Dang [QuantumVenturess](https://github.com/QuantumVenturess)
* Tad Park [@tadp](https://github.com/tadp)
* Damon Wadsworth [@daymun](https://github.com/daymun)
