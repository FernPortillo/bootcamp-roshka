//
//  MeetingFooterView.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-25.
//

import SwiftUI
import TimerKit

struct MeetingFooterView: View {
    let speakers : [ScrumTimer.Speaker]
    var skipSpeaker: ()->Void
    
    private var speakerIndex: Int? {
        /// Devolveme el valor del indice del primer item que no este completado, en este caso, el speaker actual
        guard let index = speakers.firstIndex(where: {!$0.isCompleted}) else {return nil}
        /// Si ninguno es valido devolve nil, sino devolve el siguiente
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy({$0.isCompleted})
    }
    
    private var speakerTest: String {
        guard let speakerIndex = speakerIndex else {return "No more speakers"}
        return ("\(speakerIndex) of \(speakers.count)")
    }
    
    
    var body: some View {
        VStack {
            HStack{
                if (isLastSpeaker)
                {
                    Text("Last Speaker")
                }
                else
                {
                    Text(speakerTest)
                    Spacer()
                    Button(action: skipSpeaker)
                    {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityValue("next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable var speakers = DailyScrum.ScrumSampleData[2].attendees
        .map {$0.nombre}
        .map{ ScrumTimer.Speaker(name: $0, isCompleted: false)}
    MeetingFooterView(speakers: speakers, skipSpeaker: {})
}
