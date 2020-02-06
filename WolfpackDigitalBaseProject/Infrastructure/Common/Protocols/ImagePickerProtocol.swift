//
//  ImagePickerProtocol.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 05/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit
import MobileCoreServices
import Photos
import AVFoundation

protocol ImagePicker: UIImagePickerControllerDelegate & UINavigationControllerDelegate {}

protocol ImagePickerPresenterProtocol where Self: UIViewController {
    func openImagePicker(source: UIImagePickerController.SourceType,
                         mediaTypes: [String],
                         cameraDevice: UIImagePickerController.CameraDevice,
                         delegate: ImagePicker?)
}

extension ImagePickerPresenterProtocol {
    
    func openImagePicker(source: UIImagePickerController.SourceType,
                         mediaTypes: [String] = [kUTTypeImage as String],
                         cameraDevice: UIImagePickerController.CameraDevice,
                         delegate: ImagePicker?) {
        // Camera Authorization
        if source == .camera {
            let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch cameraAuthorizationStatus {
            case .authorized:
                self.presentImagePicker(source: source, mediaTypes: mediaTypes,
                                        cameraDevice: cameraDevice, delegate: delegate)
            case .denied, .restricted:
                self.presentPermissionsDeniedAlert()
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: AVMediaType.video) { granted in
                    DispatchQueue.main.async {
                        if granted {
                            self.presentImagePicker(source: source, mediaTypes: mediaTypes,
                                                    cameraDevice: cameraDevice, delegate: delegate)
                        } else {
                            self.presentPermissionsDeniedAlert()
                        }
                    }
                }
            @unknown default: break
            }
        } else {
            // Photo Library Authorization
            let libraryAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
            switch libraryAuthorizationStatus {
            case .authorized:
                self.presentImagePicker(source: source, mediaTypes: mediaTypes, delegate: delegate)
            case .denied, .restricted:
                self.presentPermissionsDeniedAlert()
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization({status in
                    DispatchQueue.main.async {
                        if status == .authorized{
                            self.presentImagePicker(source: source, mediaTypes: mediaTypes, delegate: delegate)
                        } else {
                            self.presentPermissionsDeniedAlert()
                        }
                    }
                })
            @unknown default: break
            }
        }
    }
    
    // MARK - Private functions
    
    private func presentImagePicker(source: UIImagePickerController.SourceType,
                                    mediaTypes: [String] = [kUTTypeImage as String],
                                    cameraDevice: UIImagePickerController.CameraDevice = .rear,
                                    delegate: ImagePicker?) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = source
        imagePickerController.mediaTypes = mediaTypes
        imagePickerController.allowsEditing = false
        imagePickerController.delegate = delegate
        if source == .camera {
            imagePickerController.cameraDevice = cameraDevice
        }
        DispatchQueue.main.async {
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    private func presentPermissionsDeniedAlert() {
        let alert = UIAlertController(title: Strings.Alerts.permissionsTitle,
                                      message: Strings.Alerts.permissionsMessage,
                                      preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: Strings.General.cancel, style: .default, handler: nil)
        let settingsAction = UIAlertAction(title: Strings.Alerts.settingsButtonTitle, style: .default) { _ in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { _ in })
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(settingsAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
