//
//  ContentView.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-24.
//

import SwiftUI
import ThemeKit
import TimerKit
import AVFoundation

struct MeetingView: View {
    @Binding var scrum : DailyScrum
    @State var timer = ScrumTimer()
    private let player = AVPlayer.dingPlayer()
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(
                    secondsElapsed: timer.secondsElapsed,
                    secondsRemaining: timer.secondsRemaining,
                    theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                
                MeetingFooterView(
                    speakers: timer.speakers,
                    skipSpeaker: timer.skipSpeaker
                )
            }
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .onAppear{
            timer.reset(lengthInMinutes: scrum.lengthInMinutes,
                        attendeeNames: scrum.attendees.map{$0.nombre})
            timer.speakerChangedAction = {
                // seek a un tiempo especifico, en ese se pone el rep.
                player.seek(to: .zero)
                player.play()
            }
            timer.startScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    @Previewable @State var scrum = DailyScrum.ScrumSampleData[0]
    MeetingView(scrum: $scrum)
}
