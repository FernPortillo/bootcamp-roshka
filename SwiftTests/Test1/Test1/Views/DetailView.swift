import SwiftUI
import ThemeKit


struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var isEditingViewShowing = false
    @State private var editingScrum = DailyScrum.emptyScrum
    var body: some View {
        List{
            Section(header: Text("Meeting Info"))
            {
                NavigationLink(destination: MeetingView(scrum: $scrum)){
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(.tint)
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .background(scrum.theme.mainColor)
                        .foregroundStyle(scrum.theme.accentColor)
                        .cornerRadius(4)

                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees"))
            {
                ForEach(scrum.attendees){ attendee in
                    Label(attendee.nombre, systemImage: "person")
                    
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit")
            {
                isEditingViewShowing = true
                // Aca recibe la copia del scrum
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isEditingViewShowing)
        {
            NavigationStack{
                // recibe la copia, osea, modifica el scrum editable
                DetailEditView(scrum: $editingScrum,
                               // Cuando apriete save, guarda editing scrum en la var scrum real
                               saveEdits: {_ in scrum = editingScrum})
                    .navigationTitle(scrum.title)
            }
        }
    }
}
#Preview {
    @Previewable @State var scrum = DailyScrum.ScrumSampleData[0]
    NavigationStack{
        DetailView(scrum: $scrum)
    }
}
