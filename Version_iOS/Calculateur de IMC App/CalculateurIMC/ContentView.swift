//
//  ContentView.swift
//  CalculateurIMC
//
//  Created by Hadj Rabah on 29/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ViewImc().tabItem(){
                Image(systemName: "person.crop.circle.fill")
                Text("IMC").foregroundColor(Color.red)
            }
            ViewInfo().tabItem(){
                Image(systemName: "info.circle.fill")
                Text("Info").foregroundColor(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
