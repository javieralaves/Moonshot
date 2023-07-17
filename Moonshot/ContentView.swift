//
//  ContentView.swift
//  Moonshot
//
//  Created by Javier Alaves on 14/7/23.
//

import SwiftUI

struct ContentView: View {
    
    // Need to specify type here because of use of <T> in bundle extension function
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // For the view segmented control
    @State private var viewPicker = "Grid"
    var viewStates = ["Grid", "List"]
    
    // Grid layout
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                // View picker
                Picker("", selection: $viewPicker) {
                    ForEach(viewStates, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                // Grid view
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            MissionCard(mission: mission)
                        }
                    }
                }
                
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
