//
//  DrawingCanvasView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import SwiftUI
import PencilKit

struct DrawingCanvasView: UIViewControllerRepresentable {
    @Environment(\.managedObjectContext)
    private var viewContext
    var drawingCanvasViewController: DrawingCanvasViewController = DrawingCanvasViewController()
    
    @Binding var isDrawing: Bool
    
    typealias UIViewControllerType = DrawingCanvasViewController
    
    func makeUIViewController(context: Context) -> DrawingCanvasViewController {
        drawingCanvasViewController.drawingChanged = {
            data in
            //salva di dati del disegno
        }
        return drawingCanvasViewController
    }
    
    func updateUIViewController(_ uiViewController: DrawingCanvasViewController,context: Context) {
        drawingCanvasViewController.isDrawing = isDrawing
    }
}

#Preview {
    DrawingCanvasView(isDrawing: .constant(true))
}
