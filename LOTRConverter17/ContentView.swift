//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Daniel Ezekiel on 3/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    
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
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //Currency Text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        //Text field
                        Text("TextField")
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
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //Currency Image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        
                        //Text field
                        Text("TextField")
                    }
                }
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
    }
}

#Preview {
    ContentView()
}
