import UIKit
import AVFoundation



class VoicesController: UITableViewController {
    var voices: [Voice] = []
    // The index of the selected voice
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        voices = Voice.getVoices()
        
        // Set selectedIndex.
        for i in 0..<voices.count {
            if voices[i].id == Settings.selectedVoice.id {
                selectedIndex = i
                break
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voices.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VoiceCell", forIndexPath: indexPath)
        let v = voices[indexPath.row]
        cell.textLabel?.text = v.langName
        cell.detailTextLabel?.text = v.countryName
        return cell
    }
}

