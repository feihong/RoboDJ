import UIKit
import MediaPlayer


class PlayerController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var prevButton: UIButton!
    @IBOutlet var nextButton: UIButton!

    var tracks: [Track] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tracks = Settings.selectedPlaylist.getTracks()
        
//        for track in tracks {
//            print("\(track.title) | \(track.lastPlayedDate)")
//        }
        
        if tracks.count > 0 {
            let track = tracks[0]
            titleLabel.text = track.title
            artistLabel.text = track.artist
        }
    }
}
