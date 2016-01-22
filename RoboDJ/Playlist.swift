import MediaPlayer


protocol Playlist {
    var id: UInt64 {get}
    var name: String {get}
    var count: Int {get}
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
    
    static func getPlaylists() -> [Playlist] {
        let query = MPMediaQuery.playlistsQuery()
        guard let result = query.collections else { return [] }        
        return result.map { MediaPlaylist(item: $0) }
    }
}