import MediaPlayer


struct Media {

    // Sort the given media item array by last played date and return the 
    // results.
    static func getSortedItems(items: [MPMediaItem]) -> [MPMediaItem] {
        let result = items.sort { a, b in
            if a.lastPlayedDate == nil && b.lastPlayedDate == nil {
                return false
            } else if a.lastPlayedDate != nil && b.lastPlayedDate == nil {
                return false
            } else if a.lastPlayedDate == nil && b.lastPlayedDate != nil {
                return true
            } else {
                return a.lastPlayedDate!.compare(b.lastPlayedDate!) == NSComparisonResult.OrderedAscending
            }
        }
        // Only return the first 50 items.
        return (result.count > 50) ? Array(result[0..<50]) : result
    }
}