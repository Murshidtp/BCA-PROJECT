package com.example.sanguis;

import org.ksoap2.serialization.SoapObject;

import android.os.Bundle;
import android.os.StrictMode;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

public class P_regstatn extends Activity {
	EditText e1,e2,e3,e4,e5,e6,e7;
	Button b1;
	RadioButton r1,r2,r3;

	@SuppressLint("NewApi") @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_p_regstatn);
		 try
	    	{
	    		if (android.os.Build.VERSION.SDK_INT > 9) 
	    		{
	    			StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
	    			StrictMode.setThreadPolicy(policy);
	    		}
	    	}
	    	catch(Exception e)
	    	{
	    		
	    	}
		e1=(EditText)findViewById(R.id.editText1);
		e2=(EditText)findViewById(R.id.editText2);
		r1=(RadioButton)findViewById(R.id.radio0);
		r2=(RadioButton)findViewById(R.id.radio1);
		r3=(RadioButton)findViewById(R.id.radio2);
		e3=(EditText)findViewById(R.id.editText3);
		e4=(EditText)findViewById(R.id.editText4);
		e5=(EditText)findViewById(R.id.editText5);
		e6=(EditText)findViewById(R.id.editText6);
		e7=(EditText)findViewById(R.id.editText7);
		b1=(Button)findViewById(R.id.button1);
		b1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
			String gen="";
				if(r1.isChecked()==true)
				{
					gen="male";
				}
			
			    if(r2.isChecked()==true)
			    {
			    gen="female";
			    }
			    
				if(r3.isChecked()==true)
				{
					gen="others";
				}
				if(!e7.getText().toString().matches("[a-zA-Z0-9._-]+@gmail+\\.+com+"))
				{
					e7.setError("Invalid Email");
					e7.setText("");
				}
				if(e6.getText().toString().length()!=10)
				{
					e6.setError("Invalid Phone No");
					e6.setText("");
				}
				if(!e1.getText().toString().equals("")&&!e2.getText().toString().equals("")&&!e3.getText().toString().equals("")&&!e4.getText().toString().equals("")&&!e5.getText().toString().equals("")&&!e6.getText().toString().equals("")&&!e7.getText().toString().equals(""))
				{
				SoapObject obj=new SoapObject(soapclass.NAMESPACE,"registration");
				obj.addProperty("pname",e1.getText().toString());
				obj.addProperty("age",e2.getText().toString());
				obj.addProperty("gen",gen);
				obj.addProperty("plce",e3.getText().toString());
				obj.addProperty("phn",e6.getText().toString());
				obj.addProperty("email",e7.getText().toString());
				obj.addProperty("bloodgrp",e5.getText().toString());
				obj.addProperty("district",e4.getText().toString());
				soapclass sc=new soapclass();
				String ou=sc.Callsoap(obj, "http://tempuri.org/registration");
				if(!ou.equals("")&&!ou.equals("error"))
				{
					Toast.makeText(getApplicationContext(), "Success", 3).show();
				}
				else
				{
					Toast.makeText(getApplicationContext(), "Registration failed", 3).show();
				}
				}
				else
				{
					Toast.makeText(getApplicationContext(), "Fill", Toast.LENGTH_LONG).show();
				}
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.p_regstatn, menu);
		return true;
	}

}
