
import UIKit

class OptionsController: UITableViewController {
    @IBOutlet var playlistLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        playlistLabel.text = (Settings.selectedPlaylist == nil) ?
            "All Music" : Settings.selectedPlaylist!.name
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
