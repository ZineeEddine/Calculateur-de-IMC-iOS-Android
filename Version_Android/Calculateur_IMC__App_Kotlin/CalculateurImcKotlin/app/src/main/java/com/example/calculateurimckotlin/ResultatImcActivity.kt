package com.example.calculateurimckotlin

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import android.widget.TextView

class ResultatImcActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_resultat_imc)

        val Intent = intent
        val s_recup_imc_txt : String? = Intent.getStringExtra("key_send_imc")
        val txtView :TextView = findViewById(R.id.textView_res)
        txtView.setText(s_recup_imc_txt)

    }
}