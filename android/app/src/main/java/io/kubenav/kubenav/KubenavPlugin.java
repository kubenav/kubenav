package io.kubenav.kubenav;

import android.os.AsyncTask;

import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;

@NativePlugin()
public class KubenavPlugin extends Plugin {

  @PluginMethod()
  public void startServer(PluginCall call) {
    AsyncTask<Void, Void, String> runningServer = new BackgroundServer();
    runningServer.execute();

    call.success();
  }
}
