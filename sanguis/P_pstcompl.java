package com.example.sanguis;

import java.util.ArrayList;
import java.util.HashMap;

import org.ksoap2.serialization.SoapObject;

import android.R.string;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.annotation.TargetApi;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

public class P_pstcompl extends Activity {
	EditText e3;
	Button b1,b2;
	ListView l;
//public string Login;
	@TargetApi(Build.VERSION_CODES.GINGERBREAD) @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_p_pstcompl);
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
		
		e3=(EditText)findViewById(R.id.editText3);
		b1=(Button)findViewById(R.id.button1);
		b2=(Button)findViewById(R.id.button2);
		l=(ListView)findViewById(R.id.listView1);
		
		b1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				if(!e3.getText().toString().equals(""))
				{
				SoapObject so= new SoapObject(soapclass.NAMESPACE,"post_complaint");
				so.addProperty("complnt",e3.getText().toString());
				so.addProperty("pid",LOGIN.uid);
				
				soapclass sc=new soapclass();
				String f= sc.Callsoap(so,"http://tempuri.org/post_complaint") ;
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
		b2.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				
				
				

				SoapObject sob=new SoapObject(soapclass.NAMESPACE,"vw_comreply");
				sob.addProperty("uid",LOGIN.uid);
				soapclass sc=new soapclass();
				String ou=sc.Callsoap(sob, "http://tempuri.org/vw_comreply");
				if(!ou.equals("error"))
				{
					ArrayList< HashMap<String, String>> al=new ArrayList<HashMap<String,String>>();
					String []s1=ou.split("@");
					for(int i=0;i<s1.length;i++)
					{
						HashMap<String, String> hmap=new HashMap<String, String>();
						String []s2=s1[i].split("#");
						hmap.put("a",s2[0]);//d
						hmap.put("b", s2[1]);//cm
						hmap.put("c",s2[2]);//re
						al.add(hmap);
					}
					ListAdapter lis=new SimpleAdapter(P_pstcompl.this, al, R.layout.vweply, new String[] {"a","b","c"}, new int[] {R.id.textView4,R.id.textView6,R.id.textView8});
					l.setAdapter(lis);
				}
				else
					
				{
					l.setAdapter(null);
				}		
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.p_pstcompl, menu);
		return true;
	}

}
