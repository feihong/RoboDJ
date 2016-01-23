import MediaPlayer


struct Track {
    var item: MPMediaItem
    var title: String {
        return item.valueForProperty(MPMediaItemPropertyTitle) as! String
    }
    var artist: String {
        return item.valueForProperty(MPMediaItemPropertyArtist) as! String
    }
    var lastPlayedDate: NSDate {
        if let obj = item.valueForProperty(MPMediaItemPropertyLastPlayedDate) {
            return obj as! NSDate
        } else {
            return NSDate(timeIntervalSince1970: 0)
        }
    }
    
    init(item: MPMediaItem) {
        self.item = item
    }
}
