package com.example.calculateurimckotlin.ui.imc

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import com.example.calculateurimckotlin.ResultatImcActivity
import com.example.calculateurimckotlin.databinding.FragmentImcBinding


class ImcFragment : Fragment() {


    private var _binding: FragmentImcBinding? = null

    private val binding get() = _binding!!

    var poids_user:Float = 0.0f
    var taille_user:Float = 0.0f
    var imc_user :Float = 0.0f
    var result_txt :String = "a"


    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val homeViewModel =
            ViewModelProvider(this).get(ImcViewModel::class.java)

        _binding = FragmentImcBinding.inflate(inflater, container, false)
        val root: View = binding.root

        val editText_taille: EditText = binding.editTextNumberTaille
        val editText_poids: EditText = binding.editTextNumberDecimalPoids

        binding.buttonCalculer.setOnClickListener {
            taille_user = editText_taille.getText().toString().toFloat();
            poids_user = editText_poids.getText().toString().toFloat();
            System.out.println(taille_user)
            System.out.println(poids_user)
            System.out.println(Calcu_Imc(poids_user,taille_user))
            imc_user = Calcu_Imc(poids_user,taille_user)
            System.out.println(Result_Imc_Interp(imc_user))

            val intent = Intent(this@ImcFragment.requireContext(), ResultatImcActivity::class.java)
            intent.putExtra("key_send_imc",result_txt);
            startActivity(intent)
        }

        return root

    }

    fun Calcu_Imc(p: Float, t:Float): Float {
        var res_imc:Float = 0F
        res_imc = t/100
        res_imc = t*t
        res_imc = p /res_imc
        return Math.round(res_imc * 100000).toFloat() / 10
    }

    fun Result_Imc_Interp(imc:Float){
        if(imc<16.5){
            System.out.println("dénutrition");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\ndénutrition";
        }
        else if(imc > 16.5 && imc < 18.5){
            System.out.println("maigreur");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nmaigreur";
        }
        else if(imc > 18.5 && imc < 25){
            System.out.println("poids normal");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\npoids normal";
        }
        else if(imc > 25 && imc < 30){
             System.out.println("surpoids");
             result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nsurpoids";
        }
        else if(imc > 30 && imc < 35){
             System.out.println("obésité modéré");
             result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nobésité modéré";
        }
        else if(imc > 35 && imc < 40){
             System.out.println("obésité sévère");
             result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nobésité sévère";
        }
        else if(imc > 40){
             System.out.println("obésité morbide");
             result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nobésité morbide";
        }
    }
}


