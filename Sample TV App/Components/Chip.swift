//
//  Chip.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import SwiftUI

struct Chip: View {
    let title: String
    var body: some View {
        HStack {
            Text(title).font(.system(size: 14, weight: .regular)).lineLimit(1)
        }.padding(.vertical, 10)
        .padding(.horizontal, 20)
        .foregroundColor(Colors.Primary)
        .background(Color.clear)
        .cornerRadius(40)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Colors.Primary, lineWidth: 1.5)
        )
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(title: "Testing")
            .previewLayout(.sizeThatFits)
    }
}
