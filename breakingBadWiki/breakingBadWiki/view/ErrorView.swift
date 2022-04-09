//
//  ErrorView.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 08.04.22.
//

import SwiftUI

// MARK: - ErrorView
/// A view intended for displaying error messages with a title and an image of Walter White
struct ErrorView: View {
    
    /// The title of the error message
    var title: String
    /// The error message itself
    var message: String
    
    var body: some View {
        VStack {
            VStack (alignment: .center) {
                Image("ErrorImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .padding(.bottom)
                Text(title.uppercased())
                    .font(Font.custom(FontNames.DefaultBold.rawValue, size: 17))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                Text(message)
                    .font(Font.custom(FontNames.Default.rawValue, size: 16))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
        .background(Color("GreenBackgroundColor"))
        .cornerRadius(10)
        .frame(maxWidth: 300)
    }
}

// MARK: - ErrorView Previews
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(title: "Error title", message: "An error occurred. See what you can do about it")
    }
}
