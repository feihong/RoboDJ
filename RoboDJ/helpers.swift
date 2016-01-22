import UIKit

func setTableViewBelowStatusBar(tableView: UITableView) {
    // Get the height of the status bar
    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
    
    let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
    tableView.contentInset = insets
    tableView.scrollIndicatorInsets = insets
}