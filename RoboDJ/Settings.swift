import Foundation


let defaults = NSUserDefaults.standardUserDefaults()

let SelectedPlaylist = "SelectedPlaylist"
let SelectedVoice = "SelectedVoice"


class Settings {
    static var loadStubData = true
    
    static var selectedPlaylist: Playlist? = nil {
        didSet {
            let value: AnyObject
            if let p = selectedPlaylist {
                value = NSNumber.init(unsignedLongLong: p.id)
            } else {
                value = "allmusic"
            }
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
                selectedPlaylist = nil
            } else {
                let number = val as! NSNumber
                if loadStubData {
                    selectedPlaylist = Stubs.playlists[number.integerValue]
                } else {
                    selectedPlaylist = MediaPlaylist.getPlaylist(number)
                }
            }
        }
        if let val = defaults.objectForKey(SelectedVoice) {
            selectedVoice = Voice(id: val as! String)
        }
    }
    
    static func registerDefaults() {
        defaults.registerDefaults([
            SelectedPlaylist: "allmusic",
            SelectedVoice: "en-US",
        ])
    }
}