//
//  NoteToolbarView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import SwiftUI

struct NoteToolbarViewItems: View {
    @Binding var isDrawing: Bool
    
    var body: some View {
        
        Button(action: {
            isDrawing.toggle()
        }, label: {
            Image(systemName: "pencil.tip.crop.circle")})
   
        Spacer()
        
        Button(action: {
        }, label: {
            Image(systemName: "square.and.pencil")})
    }
}

#Preview {
    NoteToolbarViewItems(isDrawing: .constant(true))
}
