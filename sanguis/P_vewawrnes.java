package com.example.sanguis;

import java.util.ArrayList;
import java.util.HashMap;

import org.ksoap2.serialization.SoapObject;

import android.os.Bundle;
import android.os.StrictMode;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.view.Menu;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

@SuppressLint("NewApi") public class P_vewawrnes extends Activity {
	ListView l;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_p_vewawrnes);
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
		
		SoapObject sob=new SoapObject(soapclass.NAMESPACE,"view_awareness");
		soapclass sc=new soapclass();
		String ou=sc.Callsoap(sob, "http://tempuri.org/view_awareness");
	//	Toast.makeText(getApplicationContext(), ou, 5).show();
		if(!ou.equals("error"))
		{
			ArrayList< HashMap<String, String>> al=new ArrayList<HashMap<String,String>>();
			String []s1=ou.split("@");
			for(int i=0;i<s1.length;i++)
			{
				HashMap<String, String> hmap=new HashMap<String, String>();
				String []s2=s1[i].split("#");
				hmap.put("a",s2[2]);
				hmap.put("b", s2[1]);
				
				al.add(hmap);
			}
			ListAdapter lis=new SimpleAdapter(P_vewawrnes.this, al, R.layout.viewawarness, new String[] {"a","b"}, new int[] {R.id.textView4,R.id.textView2});
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
		getMenuInflater().inflate(R.menu.p_vewawrnes, menu);
		return true;
	}

}
