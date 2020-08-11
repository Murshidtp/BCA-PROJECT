package com.example.sanguis;

import java.util.ArrayList;
import java.util.HashMap;

import org.ksoap2.serialization.SoapObject;

import android.R.string;
import android.os.Bundle;
import android.os.StrictMode;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.text.TextUtils.SimpleStringSplitter;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Spinner;
import android.widget.Toast;

public class P_doctrbookng extends Activity {
ListView l;
Spinner s1,s2;
String [] clid;
String [] clnm;
String fclid;
Button b1;
public static String did;
	@SuppressLint("NewApi") @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_p_doctrbookng);
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
		l=(ListView)findViewById(R.id.listView1);
		s1=(Spinner)findViewById(R.id.spinner1);
		s2=(Spinner)findViewById(R.id.spinner2);
		b1=(Button)findViewById(R.id.button1);
		
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
			ArrayAdapter<String>ad=new ArrayAdapter<String>(P_doctrbookng.this, android.R.layout.simple_spinner_item,clnm);
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
				if(!s1.getSelectedItem().equals("CLINIC"))
				{
					SoapObject sob=new SoapObject(soapclass.NAMESPACE,"view_dept_cl");
					sob.addProperty("clid",clid[arg2]);
					soapclass sc=new soapclass();
					String ou=sc.Callsoap(sob, "http://tempuri.org/view_dept_cl");
					if(!ou.equals("error"))
					{
						String [] dept=ou.split("#");	
					
						ArrayAdapter<String>ad=new ArrayAdapter<String>(P_doctrbookng.this, android.R.layout.simple_spinner_item,dept);
						s2.setAdapter(ad);
					}
					else
						
					{
						s2.setAdapter(null);
					}	
				}
			}

			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		s2.setOnItemSelectedListener(new OnItemSelectedListener() {

			@Override
			public void onItemSelected(AdapterView<?> arg0, View arg1,
					int arg2, long arg3) {
				// TODO Auto-generated method stub
				
				if(!s2.getSelectedItem().equals("DEPARTMENT"))
				{
					SoapObject sob=new SoapObject(soapclass.NAMESPACE,"view_dept_doc");
					sob.addProperty("clid",fclid);
					sob.addProperty("dept",s2.getSelectedItem().toString());
					soapclass sc=new soapclass();
					String ou=sc.Callsoap(sob, "http://tempuri.org/view_dept_doc");
					if(!ou.equals("error"))
					{
						ArrayList< HashMap<String, String>> al=new ArrayList<HashMap<String,String>>();
						String []an=ou.split("@");
						for(int i=0;i<an.length;i++)
						{
							HashMap<String, String> hmap=new HashMap<String, String>();
							String []am=an[i].split("#");
							hmap.put("a",am[0]);
							hmap.put("b", am[1]);
							
							
							al.add(hmap);
						}
						ListAdapter lis=new SimpleAdapter(P_doctrbookng.this, al, R.layout.vw_docbk, new String[] {"a","b"}, new int[] {R.id.textView3,R.id.textView4});
						l.setAdapter(lis);
					}
					else
						
					{
						l.setAdapter(null);
					}	
				}
				
			}

			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		l.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
					long arg3) {
				// TODO Auto-generated method stub
				HashMap<String, String>hmap=(HashMap<String, String>)arg0.getItemAtPosition(arg2);
				did=hmap.get("a");
				Toast.makeText(getApplicationContext(), did, 3).show();
			}
		});
		b1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				
				SoapObject sob=new SoapObject(soapclass.NAMESPACE,"doctorboking");
				sob.addProperty("pid",LOGIN.uid);
				sob.addProperty("did",did);
				soapclass sc=new soapclass();
				String ou=sc.Callsoap(sob, "http://tempuri.org/doctorboking");
				if(!ou.equals("error"))
				{
					Toast.makeText(getApplicationContext(), "Success", 3).show();
					Intent i=new Intent(getApplicationContext(),P_doctrbookng.class);
					startActivity(i);
				}
				else
					
				{
					Toast.makeText(getApplicationContext(), "Error", 3).show();
				}
				
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.p_doctrbookng, menu);
		return true;
	}

}
