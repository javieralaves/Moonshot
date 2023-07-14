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
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
