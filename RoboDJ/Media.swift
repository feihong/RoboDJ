import MediaPlayer


struct Media {
    static func getSortedTracks(items: [MPMediaItem]) -> [Track] {
        let result = items
            .map { Track(item: $0) }
            .sort { $0.lastPlayedDate.compare($1.lastPlayedDate) == NSComparisonResult.OrderedAscending }
        // Only return the first 50 items.
        return (result.count > 50) ? Array(result[0..<50]) : result
    }
}