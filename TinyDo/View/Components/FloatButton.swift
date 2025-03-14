//
//  FloatButton.swift
//  TinyDo
//
//  Created by EveSquare on 2023/06/28.
//

import SwiftUI

struct FloatingButton: View {
    var tappedHanlder: (() -> Void)? = nil
    var body: some View {
        VStack {  // --- 1
            Spacer()
            HStack { // --- 2
                Spacer()
                Button(action: {
                    self.tappedHanlder?()
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 64))
                        .foregroundColor(.blue)
                })
                .background(Color.white)
                .cornerRadius(30.0)
                .padding()

            }
        }
    }
}
