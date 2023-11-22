//
//  DrawingCanvasViewController.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import SwiftUI
import PencilKit

class DrawingCanvasViewController: UIViewController {
    public var isDrawing: Bool = false {
        didSet {
            toolPicker.setVisible(isDrawing, forFirstResponder: canvas)
            canvas.becomeFirstResponder()
        }
    }
    
    lazy var canvas: PKCanvasView = {
        let view = PKCanvasView()
        view.drawingPolicy = .anyInput
        view.minimumZoomScale = 1
        view.maximumZoomScale = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var toolPicker: PKToolPicker = {
        let toolPicker = PKToolPicker()
        toolPicker.addObserver(self)
        return toolPicker
    }()
    
    var drawingData = Data()
    var drawingChanged: (Data) -> Void = {_ in}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        NSLayoutConstraint.activate([
            canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvas.topAnchor.constraint(equalTo: view.topAnchor),
            canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        toolPicker.setVisible(isDrawing, forFirstResponder: canvas)
        toolPicker.addObserver(canvas)
        canvas.delegate = self
        canvas.becomeFirstResponder()
        
        if let drawing = try? PKDrawing(data: drawingData){
            canvas.drawing = drawing
        }
    }
}


extension DrawingCanvasViewController:PKToolPickerObserver, PKCanvasViewDelegate{
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {  
        drawingChanged(canvasView.drawing.dataRepresentation())
    }
}
