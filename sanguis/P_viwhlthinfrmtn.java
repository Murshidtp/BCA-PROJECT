package com.example.sanguis;

import java.util.ArrayList;
import java.util.HashMap;

import org.ksoap2.serialization.SoapObject;

import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.annotation.TargetApi;
import android.app.Activity;
import android.view.Menu;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;

public class P_viwhlthinfrmtn extends Activity {
	ListView l;

	@TargetApi(Build.VERSION_CODES.GINGERBREAD) @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_p_viwhlthinfrmtn);
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
		
		SoapObject sob=new SoapObject(soapclass.NAMESPACE,"healthinformation");
		soapclass sc=new soapclass();
		String ou=sc.Callsoap(sob, "http://tempuri.org/healthinformation");
		if(!ou.equals("error"))
		{
			ArrayList< HashMap<String, String>> al=new ArrayList<HashMap<String,String>>();
			String []s1=ou.split("@");
			for(int i=0;i<s1.length;i++)
			{
				HashMap<String, String> hmap=new HashMap<String, String>();
				String []s2=s1[i].split("#");
				//hmap.put("a",s2[0]);
				hmap.put("b", s2[1]);
				hmap.put("c", s2[2]);
				
				al.add(hmap);
			}
			ListAdapter lis=new SimpleAdapter(P_viwhlthinfrmtn.this, al, R.layout.view_healthinformation, new String[] {"b","c"}, new int[] {R.id.textView2,R.id.textView4});
			l.setAdapter(lis);
		}
		else
			
		{
			l.setAdapter(null);
		}	
		
		
		
		
		
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.p_viwhlthinfrmtn, menu);
		return true;
	}

}
