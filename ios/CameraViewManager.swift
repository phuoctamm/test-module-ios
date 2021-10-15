//
//  CameraViewManager.swift
//  TestModule
//
//  Created by Phuoc tam on 10/15/21.
//

import Foundation

@objc(CameraViewManager)
class CameraViewManager: RCTViewManager {
  override func view() -> UIView! {
    return CameraView()
  }

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}


