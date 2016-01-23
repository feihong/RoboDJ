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
        return item.valueForProperty(MPMediaItemPropertyLastPlayedDate) as! NSDate
    }
    
    init(item: MPMediaItem) {
        self.item = item
    }
}
