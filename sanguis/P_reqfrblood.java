package com.example.sanguis;

import java.util.ArrayList;
import java.util.HashMap;

import org.ksoap2.serialization.SoapObject;

import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Spinner;
import android.widget.Toast;

public class P_reqfrblood extends Activity {
	EditText e1,e3;
	Button b1,b2;
	Spinner s1;
	String [] clid;
	String [] clnm;
	String fclid;
	ListView l1;


	@TargetApi(Build.VERSION_CODES.GINGERBREAD) @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_p_reqfrblood);
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
		e3=(EditText)findViewById(R.id.editText3);
		b1=(Button)findViewById(R.id.button1);
		b2=(Button)findViewById(R.id.button2);
		s1=(Spinner)findViewById(R.id.spinner1);
		l1=(ListView)findViewById(R.id.listView1);
	
		
		
		b2.setVisibility(View.INVISIBLE);
		SoapObject sob=new SoapObject(soapclass.NAMESPACE,"view_clinicnm");
		soapclass sc=new soapclass();
		String ou=sc.Callsoap(sob, "http://tempuri.org/view_clinicnm");
		if(!ou.equals("error"))
		{
		String [] arr=ou.split("@");	
		clid=new String[arr.length];
		clnm=new String[arr.length];
			for(int i=0;i<arr.length;i++)
			{
				String []arr1=arr[i].split("#");
				clid[i]=arr1[0];
				clnm[i]=arr1[1];
			}
			ArrayAdapter<String>ad=new ArrayAdapter<String>(P_reqfrblood.this, android.R.layout.simple_spinner_item,clnm);
			s1.setAdapter(ad);
		}
		else
			
		{
			s1.setAdapter(null);
		}
		s1.setOnItemSelectedListener(new OnItemSelectedListener() {

			@Override
			public void onItemSelected(AdapterView<?> arg0, View arg1,
					int arg2, long arg3) {
				// TODO Auto-generated method stub
				
				fclid=clid[arg2];
			}

			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		b1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				
				if(!e1.getText().toString().equals("")&&!e3.getText().toString().equals("")&&!s1.getSelectedItem().toString().equals("CLINIC"))
				{
				
				SoapObject so= new SoapObject(soapclass.NAMESPACE,"reqstblod");
				so.addProperty("blodgrp",e1.getText().toString());
				//so.addProperty("cmplt",e2.getText().toString());
				so.addProperty("untrq",e3.getText().toString());
				so.addProperty("pid",LOGIN.uid);
				so.addProperty("cid",fclid);
				//so.addProperty("uid",Login.uid);
				
				soapclass sc=new soapclass();
				String f= sc.Callsoap(so,"http://tempuri.org/reqstblod") ;
				if(!f.equals("")&& !f.equals("error"))
				{
					Toast.makeText(getApplicationContext(), "success", 3).show();
					Intent i=new Intent(getApplicationContext(),P_reqfrblood.class);
					startActivity(i);
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
				
				SoapObject sob=new SoapObject(soapclass.NAMESPACE,"view_bloodreq");
				soapclass sc=new soapclass();
				String ou=sc.Callsoap(sob, "http://tempuri.org/view_bloodreq");
				if(!ou.equals("error"))
				{
					ArrayList< HashMap<String, String>> al=new ArrayList<HashMap<String,String>>();
					String []s1=ou.split("@");
					for(int i=0;i<s1.length;i++)
					{
						HashMap<String, String> hmap=new HashMap<String, String>();
						String []s2=s1[i].split("#");
						hmap.put("a",s2[0]);
						hmap.put("b", s2[1]);
						hmap.put("c", s2[2]);
						hmap.put("d", s2[3]);
						al.add(hmap);
					}
					ListAdapter lis=new SimpleAdapter(P_reqfrblood.this, al, R.layout.vw_bldsts, new String[] {"a","b","c","d"}, new int[] {R.id.textView5,R.id.textView6,R.id.textView7,R.id.textView8});
					l1.setAdapter(lis);				}
				else
					
				{
					l1.setAdapter(null);
				}		
				
				
				
				
				
				
				
				
				
				
				
				
				
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.p_reqfrblood, menu);
		return true;
	}

}
