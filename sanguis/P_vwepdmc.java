package com.example.sanguis;

import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.annotation.TargetApi;
import android.app.Activity;
import android.view.Menu;
import android.widget.ListView;

public class P_vwepdmc extends Activity {
	ListView l;

	@TargetApi(Build.VERSION_CODES.GINGERBREAD) @Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_p_vwepdmc);
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
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.p_vwepdmc, menu);
		return true;
	}

}
