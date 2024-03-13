//
//  IconGrid.swift
//  LOTRConverter17
//
//  Created by Daniel Ezekiel on 3/12/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(),GridItem()]){
            ForEach(Currency.allCases){ currency in
                if self.currency == currency{
                    CurrencyIcon(currecyText: currency.name, currencyImage: currency.image)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }else{
                    CurrencyIcon(currecyText: currency.name, currencyImage: currency.image)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPiece))
}
