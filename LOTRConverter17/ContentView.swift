//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Daniel Ezekiel on 3/4/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var showKeyboard :Bool

    
    var body: some View {
        ZStack {
            //Backgound Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                // Prancing pony Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //Currency conversion section
                HStack{
                    //Left conversion section
                    
                    VStack{
                        // Currency
                        HStack{
                            //Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
           
                        //leftTextField
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                            .focused($leftTyping)
                            .focused($showKeyboard)
                    }
                    
                    //Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //Right Conversion section
                    
                    VStack{
                        // Currency
                        HStack{
                            //Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        
                        //rightTextField
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($rightTyping)
                            .focused($showKeyboard)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                // Hide Keyboard
                Button("Done") {
                                rightTyping = false    // set showKeyboard to false to hide the keyboard
                            }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
                Spacer()
                
                //Info button
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                }
                            }
//            .border(.blue)
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: rightAmount) {
            if rightTyping{
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftAmount) {
            if leftTyping{
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency, content: {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        })
    }
}

#Preview {
    ContentView()
}
