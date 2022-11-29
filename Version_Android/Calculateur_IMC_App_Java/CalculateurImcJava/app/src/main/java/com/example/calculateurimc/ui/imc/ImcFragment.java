package com.example.calculateurimc.ui.imc;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;

import com.example.calculateurimc.R;
import com.example.calculateurimc.ResultatImcActivity;
import com.example.calculateurimc.databinding.FragmentImcBinding;

public class ImcFragment extends Fragment {

    private FragmentImcBinding binding;
    Activity context;
    public float taille_user;
    public float poid_user,imc_user;
    public String result_txt;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        context = getActivity();

        ImcViewModel homeViewModel =
                new ViewModelProvider(this).get(ImcViewModel.class);

        binding = FragmentImcBinding.inflate(inflater, container, false);
        View root = binding.getRoot();

        return root;
    }

    public void onStart(){
        super.onStart();
        Button button_calculer = (Button) context.findViewById(R.id.button_calculer);
        EditText editTextNumberDecimalTaille_ = (EditText) context.findViewById(R.id.editTextNumberTaille);
        EditText editTextNumberDecimalPoids_ = (EditText) context.findViewById(R.id.editTextNumberDecimalPoids);
        button_calculer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

               // System.out.println("test");
                taille_user = Float.parseFloat(editTextNumberDecimalTaille_.getText().toString());
              //  System.out.println(taille_user);
                poid_user = Float.parseFloat(editTextNumberDecimalPoids_.getText().toString());
             //   System.out.println(poid_user);
           //     System.out.println(Calcu_Imc(poid_user,taille_user));
                imc_user =Calcu_Imc(poid_user,taille_user) ;
                Result_Imc_Interp(imc_user);
              //  System.out.println("test "+result_txt);

                Intent intent = new Intent(context, ResultatImcActivity.class);
                intent.putExtra("key_send_imc",result_txt);
                startActivity(intent);
                /*
                pour transferer les données dans une autre page il faut utiliser les Intent cf Doc
                et pour la donnée en elles mêmes on lui associe une clef qu'on récupérera dans l'autre
                page
                 */

            }
        });
    }

    public static float Calcu_Imc(float p,float t){
        float res_imc; //resultat imc
        res_imc = t / 100;
        res_imc = t * t; //la taille au carrée
        res_imc = p / res_imc; // le poids diviser par la taille au carré
        return (float)Math.round(res_imc * 100000)/10 ; // puis on arrondit le resultat

    }

    public  void Result_Imc_Interp(float imc){
        if(imc<16.5){
            //System.out.println("dénutrition");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\ndénutrition";
        }
        else if(imc > 16.5 && imc < 18.5){
            // System.out.println("maigreur");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nmaigreur";
        }
        else if(imc > 18.5 && imc < 25){
            //System.out.println("poids normal");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\npoids normal";
        }
        else if(imc > 25 && imc < 30){
            // System.out.println("surpoids");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nsurpoids";
        }
        else if(imc > 30 && imc < 35){
            // System.out.println("obésité modéré");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nobésité modéré";
        }
        else if(imc > 35 && imc < 40){
            // System.out.println("obésité sévère");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nobésité sévère";
        }
        else if(imc > 40){
            // System.out.println("obésité morbide");
            result_txt = "Votre IMC est  "+ imc +"\nSelon votre taille et votre poids, vous êtes en :\n\nobésité morbide";
        }
    }
}