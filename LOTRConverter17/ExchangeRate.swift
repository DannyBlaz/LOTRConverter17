//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Daniel Ezekiel on 3/9/24.
//

import SwiftUI

struct ExtractedView: View {
    var body: some View {
        HStack{
            //Left Currency Image
            Image(.goldpiece)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange Rate Text
            Text("1 Gold Piece = 4 Gold Pennies")
            
            // Right currency image
            Image(.goldpenny)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExtractedView()
}
