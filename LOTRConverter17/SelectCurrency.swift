//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Daniel Ezekiel on 3/9/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack{
            //Parchment Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                //Select Currency Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency Icon
                IconGrid(currency: $topCurrency)

                //Select Currency Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                // Currency Icon
                IconGrid(currency: $bottomCurrency)
                
                //Done Button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece))
}
