package io.kubenav.kubenav;

import android.os.AsyncTask;
import android.os.Bundle;

import com.getcapacitor.BridgeActivity;
import com.getcapacitor.Plugin;

import java.util.ArrayList;

public class MainActivity extends BridgeActivity {
  AsyncTask<Void, Void, String> runningServer;

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    runningServer = new BackgroundServer();
    runningServer.execute();

    registerPlugin(KubenavPlugin.class);
  }
}
