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
        
        Player.changedCallback = updateUI
    }
    
    func updateLabels() {
        if let item = Player.nowPlayingItem {
            titleLabel.text = item.title!
            artistLabel.text = item.artist ?? ""
        }
    }
    
    func updateButton(buttonTitle: String = "") {
        let title: String
        if buttonTitle == "" {
            title = (Player.playbackState == .Playing) ? "Pause" : "Play"
        } else {
            title = buttonTitle
        }
        playPauseButton.setTitle(title, forState: .Normal)
    }
    
    func updateUI() {
        updateLabels()
        updateButton()
    }
    
    @IBAction func previousTrack(sender: UIButton) {
        Player.previous()
    }
    
    @IBAction func nextTrack(sender: UIButton) {
        Player.next()
    }
    
    @IBAction func playOrPause(sender: UIButton) {
        // You have to update the button title here because Player.changedCallback
        // is not invoked when you manually change the playback state.
        if Player.playbackState == .Playing {
            Player.pause()
            updateButton("Play")
        } else {
            Player.play()
            updateButton("Pause")
        }
    }
}
