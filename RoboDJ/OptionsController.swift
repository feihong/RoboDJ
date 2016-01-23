
import UIKit

class OptionsController: UITableViewController {
    @IBOutlet var playlistLabel: UILabel!
    @IBOutlet var voiceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        playlistLabel.text = Settings.selectedPlaylist.name
        
        let v = Settings.selectedVoice
        voiceLabel.text = "\(v.langName) (\(v.countryName))"
    }
    
    @IBAction func dismiss(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
