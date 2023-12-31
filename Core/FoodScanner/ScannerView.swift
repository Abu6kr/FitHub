//
//  ScannerView.swift
//  FitHub
//
//  Created by Abobakr Al Zain  on 29.12.2023.
//

import SwiftUI
import Vision
import VisionKit

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedImage: UIImage?
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = context.coordinator
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannedImage: $scannedImage)
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        @Binding var scannedImage: UIImage?
        
        init(scannedImage: Binding<UIImage?>) {
            _scannedImage = scannedImage
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            guard scan.pageCount >= 1 else {
                controller.dismiss(animated: true, completion: nil)
                return
            }
            
            let image = scan.imageOfPage(at: 0)
            scannedImage = image
            
            controller.dismiss(animated: true, completion: nil)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            controller.dismiss(animated: true, completion: nil)
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print(error.localizedDescription)
            controller.dismiss(animated: true, completion: nil)
        }
    }
}
