import UIKit
import MediaPlayer


func getSortedTracks(items: [MPMediaItem]) -> [Track] {
    return items
        .map { Track(item: $0) }
        .sort { $0.lastPlayedDate.compare($1.lastPlayedDate) == NSComparisonResult.OrderedAscending }
}