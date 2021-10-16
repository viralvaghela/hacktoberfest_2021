package com.example.whatsappopener

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.core.text.isDigitsOnly

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var number = "0"
        if (intent.action === Intent.ACTION_PROCESS_TEXT) {
            number = intent.getCharSequenceExtra(Intent.EXTRA_PROCESS_TEXT).toString()
        }

        if (number === "0")
        {
            Toast.makeText(this, "You can Start Using Whatsapp Opener", Toast.LENGTH_SHORT).show()
        }

        if (number.isDigitsOnly())
        {
            startWhatsapp(number)
        }
        else
        {
            Toast.makeText(this, "Please Check the Number", Toast.LENGTH_SHORT).show()
        }

    }

        private fun startWhatsapp(number: String) {
        val i = Intent()
        i.action = Intent.ACTION_VIEW
        i.setPackage("com.whatsapp")
        val d = Intent()
        d.action = Intent.ACTION_VIEW

        val num = when {
            number[0] == '+' -> {
                number.substring(1)
            }
            number.length == 10 -> {
                "91$number"
            }
            else -> {
                number
            }
        }
        i.data = Uri.parse("http://wa.me/$num")
        d.data = Uri.parse("http://wa.me/$num")
        if(packageManager.resolveActivity(i, 0) != null)
        {
            startActivity(i)
        }
        else
        {
            Toast.makeText(this,"Please Install Whatsapp!", Toast.LENGTH_SHORT).show()
            startActivity(d)
        }
    }
}