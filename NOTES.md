# Notes

[General Media Item Property Keys](https://developer.apple.com/library/prerelease/ios/documentation/MediaPlayer/Reference/MPMediaItem_ClassReference/index.html#//apple_ref/doc/constant_group/General_Media_Item_Property_Keys)

Regarding the persistence of MPMediaItemPropertyPersistentID:

> The value of the MPMediaItemPropertyPersistentID identifier persists across application launches and across syncs that do not change the sync status of the media item. The value is not guaranteed to persist across a sync/unsync/sync cycle.

---

[Retrieving songs and sorting them by last played date](http://stackoverflow.com/questions/14651641/retreive-list-of-songs-ordered-by-last-play-time-in-ios)

[Detect if app is being built for device or simulator](http://stackoverflow.com/questions/24869481/detect-if-app-is-being-built-for-device-or-simulator-in-swift)

---

This is a very useful function, but I don't think I'll end up using it in this project:

```swift
func setTableViewBelowStatusBar(tableView: UITableView) {
    // Get the height of the status bar
    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height

    let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
    tableView.contentInset = insets
    tableView.scrollIndicatorInsets = insets
}
```

---

Next: Only load stubs when running app in simulator
