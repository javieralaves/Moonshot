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
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationView {
            
            // Modifiers can't be attached to if statement, so we group
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
            }
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
