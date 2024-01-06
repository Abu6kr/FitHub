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





//import SwiftUI
//import VisionKit
//
//struct DataScannerRepresentable: UIViewControllerRepresentable {
//    @Binding var shouldStartScanning: Bool
//    @Binding var scannedText: String
//    var dataToScanFor: Set<DataScannerViewController.RecognizedDataType>
//    
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//       var parent: DataScannerRepresentable
//       
//       init(_ parent: DataScannerRepresentable) {
//           self.parent = parent
//       }
//               
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            switch item {
//            case .text(let text):
//                parent.scannedText = text.transcript
//            case .barcode(let barcode):
//                parent.scannedText = barcode.payloadStringValue ?? "Unable to decode the scanned code"
//            default:
//                print("unexpected item")
//            }
//        }
//    }
//    
//    func makeUIViewController(context: Context) -> DataScannerViewController {
//        let dataScannerVC = DataScannerViewController(
//            recognizedDataTypes: dataToScanFor,
//            qualityLevel: .accurate,
//            recognizesMultipleItems: true,
//            isHighFrameRateTrackingEnabled: true,
//            isPinchToZoomEnabled: true,
//            isGuidanceEnabled: true,
//            isHighlightingEnabled: true
//        )
//        
//        dataScannerVC.delegate = context.coordinator
//       
//       return dataScannerVC
//    }
//
//    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
//       if shouldStartScanning {
//           try? uiViewController.startScanning()
//       } else {
//           uiViewController.stopScanning()
//       }
//    }
//
//    func makeCoordinator() -> Coordinator {
//       Coordinator(self)
//    }
//}
