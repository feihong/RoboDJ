import MediaPlayer


protocol Playlist {
    var id: UInt64 {get}
    var name: String {get}
    var count: Int {get}
    var lastPlayedDate: NSDate {get}
}

struct PlaylistStub : Playlist {
    var id: UInt64 = 0
    var name: String = ""
    var count: Int = 0
    var lastPlayedDate = NSDate()
    
    init(id: UInt64, name: String, count: Int) {
        self.id = id
        self.name = name
        self.count = count
    }
}

struct MediaPlaylist : Playlist {
    var item: MPMediaItemCollection
    var id: UInt64 {
        let number = item.valueForProperty(MPMediaItemPropertyPersistentID) as! NSNumber
        return number.unsignedLongLongValue
    }
    var name: String {
        return item.valueForProperty(MPMediaPlaylistPropertyName) as! String
    }
    var count: Int { return item.count }
    var lastPlayedDate: NSDate {
        return item.valueForProperty(MPMediaItemPropertyLastPlayedDate) as! NSDate
    }
    
    init(item: MPMediaItemCollection) {
        self.item = item
    }
    
    func getTracks() {
        
    }
    
    static func getPlaylists() -> [Playlist] {
        let query = MPMediaQuery.playlistsQuery()
        guard let collections = query.collections else { return [] }
        return collections.map { MediaPlaylist(item: $0) }
    }
    
    static func getPlaylist(id: NSNumber) -> Playlist? {
        let query = MPMediaQuery.playlistsQuery()
        let pred = MPMediaPropertyPredicate(
            value: id,
            forProperty: MPMediaItemPropertyPersistentID,
            comparisonType: .EqualTo)
        query.addFilterPredicate(pred)
        guard let collections = query.collections else {return nil}
        return MediaPlaylist(item: collections[0])
    }
}
