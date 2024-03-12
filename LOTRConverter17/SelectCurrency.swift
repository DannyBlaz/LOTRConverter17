//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Daniel Ezekiel on 3/9/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var currency: Currency
    
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

                //Select Currency Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                // Currency Icon
                LazyVGrid(columns: [GridItem(), GridItem(),GridItem()]){
                    ForEach(Currency.allCases){ currency in
                        CurrencyIcon(currecyText: currency.name, currencyImage: currency.image)
                    }
                }
                
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
    SelectCurrency(currency: .silverPiece)
}
