//
//  CameraView.swift
//  TestModule
//
//  Created by Phuoc tam on 10/15/21.
//

import Foundation
import UIKit
import AVFoundation

class CameraView: UIView {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private lazy var videoDataOutput: AVCaptureVideoDataOutput = {
          let v = AVCaptureVideoDataOutput()
          v.alwaysDiscardsLateVideoFrames = true
          // v.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
          v.connection(with: .video)?.isEnabled = true
          return v
      }()

      private let videoDataOutputQueue: DispatchQueue = DispatchQueue(label: "JKVideoDataOutputQueue")
      private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
          let l = AVCaptureVideoPreviewLayer(session: session)
          l.videoGravity = .resizeAspect
          return l
      }()

      private let captureDevice: AVCaptureDevice? = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
      private lazy var session: AVCaptureSession = {
          let s = AVCaptureSession()
          s.sessionPreset = .vga640x480
          return s
      }()

      private func commonInit() {
          contentMode = .scaleAspectFit
          beginSession()
      }

      private func beginSession() {
          do {
              guard let captureDevice = captureDevice else {
                  fatalError("Camera doesn't work on the simulator! You have to test this on an actual device!")
              }
              let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
              if session.canAddInput(deviceInput) {
                  session.addInput(deviceInput)
              }

              if session.canAddOutput(videoDataOutput) {
                  session.addOutput(videoDataOutput)
              }
              layer.masksToBounds = true
              layer.addSublayer(previewLayer)
              previewLayer.frame = bounds
              session.startRunning()
          } catch let error {
              debugPrint("\(self.self): \(#function) line: \(#line).  \(error.localizedDescription)")
          }
      }

      override func layoutSubviews() {
          super.layoutSubviews()
          previewLayer.frame = bounds
      }
}
