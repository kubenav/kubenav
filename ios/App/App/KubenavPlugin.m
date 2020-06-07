//
//  KubenavPlugin.m
//  App
//
//  Created by Rico Berger on 07.06.20.
//

#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(KubenavPlugin, "KubenavPlugin",
           CAP_PLUGIN_METHOD(startServer, CAPPluginReturnPromise);
)
