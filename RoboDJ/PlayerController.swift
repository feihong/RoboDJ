import UIKit
import MediaPlayer


private let player = MPMusicPlayerController.applicationMusicPlayer()


class PlayerController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var playPauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    func updateLabels() {
        if let item = player.nowPlayingItem {
            titleLabel.text = item.title!
            artistLabel.text = item.artist ?? ""
        }
    }
    
    @IBAction func previousTrack(sender: UIButton) {
        player.skipToPreviousItem()
        updateLabels()
    }
    
    @IBAction func nextTrack(sender: UIButton) {
        player.skipToNextItem()
        updateLabels()
    }
    
    @IBAction func playOrPause(sender: UIButton) {
        if let playlist = Settings.selectedPlaylist as? MediaItemCollectionSource {
            player.stop()
            player.setQueueWithItemCollection(playlist.getMediaItemCollection())
            player.shuffleMode = .Off
            player.play()
            updateLabels()
        }
    }
}
