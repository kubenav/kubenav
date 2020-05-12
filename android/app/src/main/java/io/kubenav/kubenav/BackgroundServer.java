package io.kubenav.kubenav;

import android.os.AsyncTask;

import mobile.Mobile;

public class BackgroundServer extends AsyncTask<Void, Void, String> {
  @Override
  protected String doInBackground(Void... params) {
    Mobile.startServer();
    return "Server died";
  }
}
