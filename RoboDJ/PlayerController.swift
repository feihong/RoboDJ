import UIKit
import MediaPlayer


class PlayerController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var prevButton: UIButton!
    @IBOutlet var nextButton: UIButton!

    var tracks: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let playlist = Settings.selectedPlaylist {
            tracks = playlist.getTracks()
        } else {
            tracks = getAllTracks()
        }
        
        if tracks.count > 0 {
            let track = tracks[0]
            titleLabel.text = track.title
            artistLabel.text = track.artist
        }
    }
}

func getAllTracks() -> [Track] {
    let query = MPMediaQuery.songsQuery()
    guard let items = query.items else {return []}
    return getSortedTracks(items)
}