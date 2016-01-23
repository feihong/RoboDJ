import MediaPlayer


protocol Playlist {
    var id: UInt64 {get}
    var name: String {get}
    var count: Int {get}
    func getTracks() -> [Track]
}

struct PlaylistStub : Playlist {
    var id: UInt64 = 0
    var name: String = ""
    var count: Int = 0
    
    init(id: UInt64, name: String, count: Int) {
        self.id = id
        self.name = name
        self.count = count
    }
    
    func getTracks() -> [Track] { return [] }
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

    
    init(item: MPMediaItemCollection) {
        self.item = item
    }
    
    func getTracks() -> [Track] {
        return Media.getSortedTracks(item.items)
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

// Pseudo-playlist that can play any music on the device
struct AllMusicPlaylist : Playlist {
    var id: UInt64 = 0
    var name = "All Music"
    var count = 0
    
    func getTracks() -> [Track] {
        let query = MPMediaQuery.songsQuery()
        guard let items = query.items else {return []}
        return Media.getSortedTracks(items)
    }
}
