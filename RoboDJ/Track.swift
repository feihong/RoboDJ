import MediaPlayer


struct Track {
    var item: MPMediaItem
    var title: String {
        return item.title!
    }
    var artist: String {
        guard let result = item.artist else {return ""}
        return result
    }
    var lastPlayedDate: NSDate {
        guard let date = item.lastPlayedDate else { return NSDate(timeIntervalSince1970: 0) }
        return date
    }
    
    init(item: MPMediaItem) {
        self.item = item
    }
}
