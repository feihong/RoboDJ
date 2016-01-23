import Foundation


private let defaults = NSUserDefaults.standardUserDefaults()

private let SelectedPlaylist = "SelectedPlaylist"
private let SelectedVoice = "SelectedVoice"


class Settings {
    // Set to true if you are running on the simulator and you want to load stub
    // playlists.
    static var loadStubData = true
    
    static var selectedPlaylist: Playlist = AllMusicPlaylist() {
        didSet {
            // Store string if no playlist is selected; otherwise store the id
            // of the selected playlist. We do this because NSNull cannot be
            // stored inside NSUserDefaults.
            let value: AnyObject = (selectedPlaylist is AllMusicPlaylist) ?
                "AllMusic" : NSNumber(unsignedLongLong: selectedPlaylist.id)
            defaults.setObject(value, forKey: SelectedPlaylist)
        }
    }
    static var selectedVoice: Voice = Voice(id: "en-US") {
        didSet {
            defaults.setObject(selectedVoice.id, forKey: SelectedVoice)
        }
    }
    
    static func initValues() {
        if let val = defaults.objectForKey(SelectedPlaylist) {
            if val is NSString {
                selectedPlaylist = AllMusicPlaylist()
            } else {
                let number = val as! NSNumber
                if loadStubData {
                    selectedPlaylist = Stubs.playlists[number.integerValue]
                } else {
                    selectedPlaylist = MediaPlaylist.getPlaylist(number)!
                }
            }
        }
        if let val = defaults.objectForKey(SelectedVoice) {
            selectedVoice = Voice(id: val as! String)
        }
    }
    
    static func registerDefaults() {
        defaults.registerDefaults([
            SelectedPlaylist: "AllMusic",
            SelectedVoice: "en-US",
        ])
    }
}
