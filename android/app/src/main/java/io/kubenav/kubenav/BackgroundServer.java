package io.kubenav.kubenav;

import android.os.AsyncTask;

import server.Server;

public class BackgroundServer extends AsyncTask<Void, Void, String> {
  @Override
  protected String doInBackground(Void... params) {
    Server.startServer();
    return "Server died";
  }
}
