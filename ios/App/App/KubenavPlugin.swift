//
//  KubenavPlugin.swift
//  App
//
//  Created by Rico Berger on 07.06.20.
//

import Foundation
import Capacitor
import Mobile

@objc(KubenavPlugin)
public class KubenavPlugin: CAPPlugin {
    @objc func startServer(_ call: CAPPluginCall) {
        DispatchQueue.background {
            MobileStartServer()
        }

        call.success()
    }
}
