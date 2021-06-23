//
//  CenterModifier.swift
//  Africca
//
//  Created by BJIT on 2021/06/02.
//

import SwiftUI

struct CenterModifier:ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            Spacer()
            content 
            Spacer()
        }
    }
    
}
