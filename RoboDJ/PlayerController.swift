import UIKit
import MediaPlayer




class PlayerController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var playPauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func updateUI() {
        if let item = Player.nowPlayingItem {
            titleLabel.text = item.title!
            artistLabel.text = item.artist ?? ""
        }
        let buttonTitle = (Player.playbackState == .Playing) ? "Pause" : "Play"
        playPauseButton.setTitle(buttonTitle, forState: .Normal)
    }
    
    @IBAction func previousTrack(sender: UIButton) {
        Player.previous()
        updateUI()
    }
    
    @IBAction func nextTrack(sender: UIButton) {
        Player.next()
        updateUI()
    }
    
    @IBAction func playOrPause(sender: UIButton) {
        print(Player.playbackState.rawValue)
        print(Player.nowPlayingItem?.title)
        if Player.playbackState == .Playing {
            Player.pause()
        } else {
            Player.play()
        }
        updateUI()        
    }
}
