package com.example.calculateurimc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

public class ResultatImcActivity extends AppCompatActivity {
    TextView txt_result_imc;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_resultat_imc);
/*

getSupportActionBar().setDisplayHomeAsUpEnabled(true);
va servir à créer la touche de retour sur la barre et il faut aussi
rajouter   ---> android:parentActivityName=".MainActivity"/>
dans le fichier AndroidManifest.xml

 */
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        Intent intent = getIntent();
        String s_recup_imc_txt= intent.getStringExtra("key_send_imc");

        txt_result_imc =(TextView) findViewById(R.id.textView_res);
        txt_result_imc.setText(s_recup_imc_txt);
    }
}