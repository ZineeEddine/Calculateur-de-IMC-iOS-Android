//
//  ViewInfo.swift
//  CalculateurIMC
//
//  Created by Hadj Rabah on 29/11/2022.
//

import SwiftUI

struct ViewInfo: View {
    
  
    var body: some View {
        
        NavigationView{
            ScrollView{
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.white).shadow(radius: 20)
                    VStack{
                        Text("Quest ce que l'IMC  ?").foregroundColor(.black).font(.headline).bold()
                        Text("Inventé au millieu du XIXe siècle par Adolphe Quetelet, mathématicien belge.").foregroundColor(.black)
                        Text("Cet indice est appelé aussi l'indice de Quetelet.").foregroundColor(.black)
                        Text("C'est une unité de mesure qui établit un rapport entre la taille et le poids d'une personne.").foregroundColor(.black)
                        Text("Plus l'indice est élevé, plus la personne à un poids important par rapport à sa taille.").foregroundColor(.black)
                        
                    }
                    .padding(5)
                    .multilineTextAlignment(.center)
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
                Spacer(minLength:40)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.white).shadow(radius: 20)
                    VStack{
                        Text("Comment calculer l'IMC d'une personne ?").foregroundColor(.black).font(.headline).bold()
                        Text("Pour calculer l'IMC, il faut diviser, le poids d'une").foregroundColor(.black)
                        Text("personne en kilogrammes par le carré de").foregroundColor(.black)
                        Text("sa taille en mètres.").foregroundColor(.black)
                        Image("screen_formule").resizable().scaledToFit()
                        Text("Pour une personne mesurant 1,75 mètres et pesant 70 kilos, son IMC sera égale à 70 ÷ 1,75² = 22,86 kg/m².").foregroundColor(.black)
                        
                    }
                    .padding(5)
                    .multilineTextAlignment(.center)
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
                Spacer(minLength:40)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.white).shadow(radius: 20)
                    VStack{
                        Text("Comment interpréter l'IMC d'une personne ?").foregroundColor(.black).font(.headline).bold()
                        Image("screen_result").resizable().scaledToFit()
                    }
                    .padding(5)
                    .multilineTextAlignment(.center)
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
                Spacer(minLength:40)
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.white).shadow(radius: 20)
                    VStack{
                        Text("Les limites de l'IMC").foregroundColor(.black).font(.headline).bold()
                        
                        Text("L’Indice de Masse Corporelle possède plusieurs limites qui le rendent non pertinent dans l’évaluation du poids.").foregroundColor(.black)
                        Text("- L’IMC ne prend pas en compte la répartition de la constitution corporelle, à savoir la répartition masse musculaire, masse grasse et masse osseuse.\n"
                        ).foregroundColor(.black).padding(5)
                        Text("- L’indice de masse corporelle ne peut également pas être utilisé chez les enfants, les adolescents (seules les courbes de poids sont pertinentes dans ces cas là) ou encore chez les femmes enceintes dont les variations de poids sont physiologiques, et non prises en comptes par l’IMC."
                        ).foregroundColor(.black)
                    }
                    .padding(5)
                    .multilineTextAlignment(.center)
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
                Spacer(minLength:40)
            }.navigationTitle("Informations")
            
        }
        
    }
}

struct ViewInfo_Previews: PreviewProvider {
    static var previews: some View {
        ViewInfo()
    }
}
