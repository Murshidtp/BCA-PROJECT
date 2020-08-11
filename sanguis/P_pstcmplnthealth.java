package com.example.sanguis;

import java.util.ArrayList;
import java.util.HashMap;

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
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

public class P_pstcmplnthealth extends Activity {
	EditText e1,e2,e3;
	Button b1,b2;
	ListView l;

	@SuppressLint("NewApi") @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_p_pstcmplnthealth);
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
				SoapObject so= new SoapObject(soapclass.NAMESPACE,"post_question");
				
				so.addProperty("ques",e3.getText().toString());
				//so.addProperty("uid",Login.uid);
				
				soapclass sc=new soapclass();
				String f= sc.Callsoap(so,"http://tempuri.org/post_question") ;
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
			
				
				
				SoapObject sob=new SoapObject(soapclass.NAMESPACE,"vw_comp_health");
				soapclass sc=new soapclass();
				String ou=sc.Callsoap(sob, "http://tempuri.org/vw_comp_health");
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
					ListAdapter lis=new SimpleAdapter(P_pstcmplnthealth.this, al, R.layout.vw_ans, new String[] {"a","b","c","d"}, new int[] {R.id.textView5,R.id.textView6,R.id.textView7,R.id.textView8});
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
		getMenuInflater().inflate(R.menu.p_pstcmplnthealth, menu);
		return true;
	}

}
