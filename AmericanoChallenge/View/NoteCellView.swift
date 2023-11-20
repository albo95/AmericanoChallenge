//
//  NoteCellView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 20/11/23.
//

import Foundation
import SwiftUI

struct NoteCellView: View {
    var previewImage: Data
    var title: String
    var date: String
    
    var body: some View {
        VStack
        {
            if let image = Image.createFromData(previewImage){
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:100, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
            }
            Text(title)
                .foregroundStyle(.mainText)
                .font(.headline)
                .lineLimit(1)
            Text(date)
                .foregroundStyle(.secondaryText)
                .font(.subheadline)
                .lineLimit(1)
        }.frame(width: 100)
    }
}

#Preview {
    if let imgData = Image.getImageDataFromAsset("imgProva") {
        return AnyView(NoteCellView(previewImage: imgData, title: "Note Name", date: "Yesterday"))
    } else {
        return AnyView(Text("Preview not available"))
    }
}


