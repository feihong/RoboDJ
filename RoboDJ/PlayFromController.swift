import UIKit
import MediaPlayer


class PlayFromController: UITableViewController {
    var playlists: [Playlist] = []
    // The index of the selected playlist, or -1 if no playlist is selected.
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Settings.loadStubData {
            playlists = getStubPlaylists()
        } else {
            playlists = MediaPlaylist.getPlaylists()
        }
        
        // Set selectedIndex.
        if Settings.selectedPlaylist == nil {
            selectedIndex = -1
        } else {
            for i in 0..<playlists.count {
                if playlists[i].id == Settings.selectedPlaylist!.id {
                    selectedIndex = i
                    break
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 1) ? "Playlists" : nil
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if (section == 1 && playlists.count == 0) {
            return  "You don't have any playlists on this device"
        } else {
            return nil
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? 1 : playlists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("AllMusicCell", forIndexPath: indexPath)
            if selectedIndex == -1 {
                cell.accessoryType = .Checkmark
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("PlaylistCell", forIndexPath: indexPath)
            let p = playlists[indexPath.row]
            cell.textLabel?.text = p.name
            cell.detailTextLabel?.text = "\(p.count) songs"
            if selectedIndex == indexPath.row {
                cell.accessoryType = .Checkmark
            }
            return cell
        }
    }
    
    override func tableView(tv: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            selectedIndex = -1
            Settings.selectedPlaylist = nil
        } else {
            selectedIndex = indexPath.row
            Settings.selectedPlaylist = playlists[selectedIndex]
        }
        navigationController?.popViewControllerAnimated(true)
    }
}

func getStubPlaylists() -> [Playlist] {
    return [
        PlaylistStub(name: "Jazz", count: 192),
        PlaylistStub(name: "Rock", count: 180),
        PlaylistStub(name: "Disco", count: 34),
        PlaylistStub(name: "Electro", count: 5),
    ]
}
