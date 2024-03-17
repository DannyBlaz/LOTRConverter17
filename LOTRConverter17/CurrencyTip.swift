//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by Daniel Ezekiel on 3/14/24.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap on the left or right currency to bring up the Select Currency Screen.")
    
}
