package com.example.jesse.a_test;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //显示当前时间
        Button btn = (Button)findViewById(R.id.date_btn);
        btn.setOnClickListener(new Button.OnClickListener(){
            @Override
            public void onClick(View v) {

                TextView text = (TextView) findViewById(R.id.date_text);
                text.setText(  new SimpleDateFormat("yyyy年MM月dd日 hh:mm:ss").format(new Date()));


            }
        });

    }
}
