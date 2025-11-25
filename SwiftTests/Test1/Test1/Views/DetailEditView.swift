//
//  DetailEditView.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-24.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    let saveEdits: (DailyScrum) -> Void
    
    @State private var attendeeName = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1)
                    {
                        Text("Length")
                    }
                    
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
            ThemePicker(selection: $scrum.theme)
            Section(header: Text("Attendees"))
            {
                ForEach(scrum.attendees){ attendee in
                    Text(attendee.nombre)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)}
                
                HStack{
                    TextField("Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(nombre: attendeeName)
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    })
                    {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .cancellationAction)
            {
                Button("Cancel")
                {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction)
            {
                Button("Save")
                {
                    saveEdits(scrum)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.ScrumSampleData[0]
    DetailEditView(scrum: $scrum, saveEdits: {_ in})
}
