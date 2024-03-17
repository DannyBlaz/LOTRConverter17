//
//  ConvertCurrency.swift
//  LOTRConverter17
//
//  Created by Daniel Ezekiel on 3/16/24.
//

import SwiftUI

struct ConvertCurrency: View {
    
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var showKeyboard :Bool
    
    var body: some View {
        ZStack{
            //Backgound Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    //Currency Image
                    Image(leftCurrency.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)
                    //
                    //            //Currency Text
                    Text(leftCurrency.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                //        .padding(.bottom, -5)
                //        .onTapGesture {
                //            showSelectCurrency.toggle()
                //        }
                //        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                
                //leftTextField
                TextField("Amount", text: $leftAmount)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .focused($leftTyping)
                    .focused($showKeyboard)
            }
        }
    }
}

#Preview {
    ConvertCurrency()
}
