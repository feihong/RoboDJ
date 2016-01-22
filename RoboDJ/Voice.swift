import Foundation
import AVFoundation


let locale = NSLocale.currentLocale()

struct Voice {
    let id: String
    let langName: String
    let countryName: String
    
    static func getVoices() -> [Voice] {
        return AVSpeechSynthesisVoice.speechVoices().map { Voice(id: $0.language) }
    }
    
    init(id: String) {
        self.id = id
        let parts = id.componentsSeparatedByString("-")
        let langCode = parts[0]
        let countryCode = parts[1]
        
        self.countryName = locale.displayNameForKey(NSLocaleIdentifier,  value: "_" + countryCode)!
        
        self.langName = locale.displayNameForKey(NSLocaleIdentifier,  value: langCode)!
    }
}

