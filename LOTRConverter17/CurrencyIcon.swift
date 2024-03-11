//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Daniel Ezekiel on 3/9/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currecyText: String
    let currencyImage: ImageResource
    
    var body: some View {
        ZStack(alignment: .bottom){
            // Currency Image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // Currency Name
            Text(currecyText)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currecyText: "Copper Penny", currencyImage: .copperpenny)
}
