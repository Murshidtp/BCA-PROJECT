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
import android.widget.Toast;

public class P_postfedbck extends Activity {
	EditText e3;
	Button b1;

	@SuppressLint("NewApi") @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_p_postfedbck);
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
		//e1=(EditText)findViewById(R.id.editText1);
		//e2=(EditText)findViewById(R.id.editText2);
		e3=(EditText)findViewById(R.id.editText3);
		b1=(Button)findViewById(R.id.button1);
		b1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				
				if(!e3.getText().toString().equals(""))
				{
				
				SoapObject so= new SoapObject(soapclass.NAMESPACE,"feedbck");
				//so.addProperty("pid",e1.getText().toString());
				//so.addProperty("date",e2.getText().toString());
				so.addProperty("feedback",e3.getText().toString());
				
				//so.addProperty("uid",Login.uid);
				
				soapclass sc=new soapclass();
				String f= sc.Callsoap(so,"http://tempuri.org/feedbck") ;
				if(!f.equals("")&& !f.equals("error"))
				{
					Toast.makeText(getApplicationContext(), "success", 3).show();
				}
				else
				{
					Toast.makeText(getApplicationContext(), "Error", 3).show();
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
		getMenuInflater().inflate(R.menu.p_postfedbck, menu);
		return true;
	}

}
