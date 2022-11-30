//
//  ResultatImcView.swift
//  CalculateurIMC
//
//  Created by Hadj Rabah on 29/11/2022.
//

import SwiftUI

struct ResultatImcView: View {


    @Binding var result_txt_imc :String
    var body: some View {
        VStack{
            Image("medecin_result").resizable().scaledToFit()
            Text("\(result_txt_imc)")
        }.navigationTitle("Résultat de votre IMC")
    }
}

struct ResultatImcView_Previews: PreviewProvider {
    static var previews: some View {
        ResultatImcView(result_txt_imc: .constant("test"))
    }
}

