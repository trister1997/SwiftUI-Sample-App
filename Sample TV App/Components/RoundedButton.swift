//
//  RoundedButton.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import SwiftUI

struct RoundedButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 18))
                .padding()
                .foregroundColor(Colors.Primary)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Colors.Primary, lineWidth: 2)
                )
        })
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Testing", action: {})
    }
}
