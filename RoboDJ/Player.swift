import MediaPlayer


private let player = MPMusicPlayerController.systemMusicPlayer()
private let notificationResponder = PlayerNotificationResponder()


struct Player {
    static func previous() {
        player.skipToPreviousItem()
    }
    
    static func next() {
        player.skipToNextItem()
    }
    
    static func play() {
        player.play()
    }
    
    static func pause() {
        player.stop()
    }
    
    static var nowPlayingItem: MPMediaItem? {
        return player.nowPlayingItem
    }
    
    static var playbackState: MPMusicPlaybackState {
        return player.playbackState
    }
    
    static func loadMediaItemCollection(collection: MPMediaItemCollection) {
        player.stop()
        player.setQueueWithItemCollection(collection)
        player.shuffleMode = .Off
        player.play()
    }
    
    static func beginNotifications() {
        player.beginGeneratingPlaybackNotifications()
        
        NSNotificationCenter.defaultCenter().addObserver(
            notificationResponder,
            selector: "playbackStateChanged:",
            name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification,
            object: player)
        
        NSNotificationCenter.defaultCenter().addObserver(
            notificationResponder,
            selector: "nowPlayingItemChanged:",
            name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification,
            object: player)
    }
    
    static func endNotifications() {
        player.endGeneratingPlaybackNotifications()
    }
}


class PlayerNotificationResponder : NSObject {
    func playbackStateChanged(notification: NSNotification) {
        print("\(NSDate()): Playback state changed to \(Player.playbackState.rawValue)")
    }
    
    func nowPlayingItemChanged(notification: NSNotification) {
        let title = Player.nowPlayingItem?.title ?? "NONE"
        print("\(NSDate()): Now playing item changed to \(title)")
    }
}
