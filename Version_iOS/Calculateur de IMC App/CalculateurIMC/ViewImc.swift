//
//  ViewImc.swift
//  CalculateurIMC
//
//  Created by Hadj Rabah on 29/11/2022.
//

import SwiftUI

struct ViewImc: View {
    @State private var action: Int? = 0


    @State public var user_taille : String = "0"
    @State public var user_poids : String = "0"
    @State public var user_taille_nb : Float = 0.0
    @State public var user_poids_nb : Float = 0.0
    @State public var user_imc : Float = 0.0
    @State public var result_txt_imc : String = "0"
    
    var body: some View {
        
            NavigationView {
                VStack{
                    Image("medecin").resizable().scaledToFit().frame( alignment: .center)
                    HStack {
                        Text("Indiquer votre taille en cm :").font(.system(size: 18))
                        TextField("0",text:$user_taille)
                        Image("taille").resizable().scaledToFit()
                    }.padding()
                    Spacer(minLength: 2)
                    HStack{
                        Text("Indiquer votre poids en kg :").font(.system(size: 18))
                        TextField("0",text:$user_poids)
                        Image("balance").resizable().scaledToFit()
                    }.padding()
                    Spacer(minLength: 2)

                    
                    
                    /*Button(action: {
                        user_poids_nb = (user_poids as NSString).floatValue
                        user_taille_nb = (user_taille as NSString).floatValue
                        print(user_poids + " ", user_taille)
                        user_imc = Calcul_Imc(t:user_taille_nb,p: user_poids_nb)
                        print(user_imc)
                        result_txt_imc = Result_Imc_Interp(imc: user_imc,result_txt: result_txt_imc)
                        print(result_txt_imc)
                        
                            }, label: {
                                Text("Calculer")
                            })*/
                            // 2. Add a sheet modifier to present SecondView modally
                
                    NavigationLink(destination: ResultatImcView(result_txt_imc : self.$result_txt_imc), tag: 1, selection: $action) {
                        
                    }
                    Text("Calculer").padding()
                        .background(Color(red: 3.5, green: 0, blue: 0.0))
                        .clipShape(Capsule())
                        .foregroundColor(Color.white)
                        .onTapGesture {
                                            user_poids_nb = (user_poids as NSString).floatValue
                                            user_taille_nb = (user_taille as NSString).floatValue
                                            print(user_poids + " ", user_taille)
                                            user_imc = Calcul_Imc(t:user_taille_nb,p: user_poids_nb)
 
                                            print(user_imc)
                                            result_txt_imc = Result_Imc_Interp(imc: user_imc,result_txt: result_txt_imc)
                                            print(result_txt_imc)
                                            //perform some tasks if needed before opening Destination view
                                            self.action = 1
                    }
                    Spacer(minLength: 2)
                                    
                    
                    /*
                    Button(action: {
                        user_poids_nb = (user_poids as NSString).floatValue
                        user_taille_nb = (user_taille as NSString).floatValue
                        print(user_poids + " ", user_taille)
                        user_imc = Calcul_Imc(t:user_taille_nb,p: user_poids_nb)
                        print(user_imc)
                        result_txt_imc = Result_Imc_Interp(imc: user_imc,result_txt: result_txt_imc)
                        print(result_txt_imc)
                        
                    }, label: {
                                Text("Button")
                            })*/

                        
            }.navigationTitle("Calculateur IMC")
                    
            
        }
    }
}

struct ViewImc_Previews: PreviewProvider {
    static var previews: some View {
        ViewImc()
    }
}




func Calcul_Imc(t:Float , p:Float )->Float {
    var res_imc : Float = 0
    res_imc = t/100
    res_imc = t*t
    res_imc = p / res_imc
    return (res_imc * 100000) / 10
}

func Result_Imc_Interp(imc:Float, result_txt:String) -> String{
    var result_txt :String = "0"
        if(imc<16.5){
            print("dénutrition ");
            result_txt = "Votre IMC est " + String(imc) + " \nSelon votre taille et votre poids, vous êtes en :\n\ndénutrition"
        }
        else if(imc > 16.5 && imc < 18.5){
            print("maigreur")
            result_txt = "Votre IMC est " + String(imc) + " \nSelon votre taille et votre poids, vous êtes en :\n\nmaigreur"
        }
        else if(imc > 18.5 && imc < 25){
            print("poids normal")
            result_txt = "Votre IMC est " + String(imc) + " \nSelon votre taille et votre poids, vous êtes en :\n\npoids normal"
        }
        else if(imc > 25 && imc < 30){
             print("surpoids")
            result_txt = "Votre IMC est " + String(imc) + " \nSelon votre taille et votre poids, vous êtes en :\n\nsurpoids"
        }
        else if(imc > 30 && imc < 35){
             print("obésité modéré")
            result_txt = "Votre IMC est " + String(imc) + " \nSelon votre taille et votre poids, vous êtes en :\n\nobésité modéré"
        }
        else if(imc > 35 && imc < 40){
             print("obésité sévère")
            result_txt = "Votre IMC est " + String(imc) + " \nSelon votre taille et votre poids, vous êtes en :\n\nobésité sévère"
        }
        else if(imc > 40){
             print("obésité morbide")
            result_txt = "Votre IMC est " + String(imc) + " \nSelon votre taille et votre poids, vous êtes en :\n\nobésité morbide"
        }
    return result_txt
}
/*

fun Calcu_Imc(p: Float, t:Float): Float {
        var res_imc:Float = 0F
        res_imc = t/100
        res_imc = t*t
        res_imc = p /res_imc
        return Math.round(res_imc * 100000).toFloat() / 10
    }
*/
