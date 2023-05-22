//
//  DeleteTextButton.swift
//  course work
//
//  Created by Ирлан Абушахманов on 12.03.2023.
//

import SwiftUI

struct DeleteTextButton: View {
    
    let tapAction: () -> Void
    
    var body: some View {
        Image(systemName: "multiply")
          .foregroundColor(.gray)
          .font(.system(size: 20))
          .padding(.trailing, 15)
          .frame(height: 30)
          .padding(.top, 4)
          .onTapGesture {
              tapAction()
        }
    }
}
