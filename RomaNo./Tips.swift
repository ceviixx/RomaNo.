//
//  Tips.swift
//  RomaNo.
//
//  Created by ceviixx on 30.05.24.
//

import Foundation
import TipKit

struct HowToTip: Tip {
    var title: Text {
        Text("Save as a Favorite")
    }
    var message: Text? {
        Text("Your favorite backyards always appear at the top of the list.")
    }
    var image: Image? {
        Image(systemName: "star")
    }
}

struct CautionTip: Tip {
    var title: Text {
        Text("Caution before use!")
    }
    var message: Text? {
        Text("Check the result before using it.\nNo liability is accepted for any errors")
    }
}
