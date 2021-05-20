//
//  TVShowCell.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import SwiftUI
import URLImage

struct TVShowCell: View {
    let imageUrl: URL
    let title: String
    let year: Int
    
    var body: some View {
        VStack {
            URLImage(imageUrl, content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 255)
            })
            .frame(width: 150, height: 255)
            Text("\(title) (\(String(year)))")
                .font(.system(size: 14))
                .foregroundColor(Colors.TextPrimary)
        }
    }
}

struct TVShowCell_Previews: PreviewProvider {
    static var previews: some View {
        TVShowCell(imageUrl: URL(string: "")!, title: "Test", year: 2000)
    }
}
