import AVFoundation


private let synthesizer = AVSpeechSynthesizer()


struct Talker {
    static func talk(text: String) {
        let utterance = AVSpeechUtterance(string: text)
//        utterance.voice = AVSpeechSynthesisVoice(language: )
//        utterance.pitchMultiplier = pitchMultiplier
//        utterance.rate = rate
//        utterance.volume = volume
        
        // Interrupt any phrase that's currently being spoken.
        if synthesizer.speaking {
            synthesizer.stopSpeakingAtBoundary(.Immediate)
        }
        
        synthesizer.speakUtterance(utterance)
    }
}