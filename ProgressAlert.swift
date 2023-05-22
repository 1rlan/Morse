//
//  ProgressAlert.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import SwiftUI

struct ProgressAlert: View {
    @Binding var showAlert: Bool
    var resetAction: () -> Void
    
    var body: some View {
        Alert(
            title: Text("Are you sure?"),
            message: Text("All your progress will be deleted"),
            primaryButton: .destructive(Text("Yes")) {
                    resetAction()
        }, secondaryButton: .cancel(Text("Cancel")))
    }
}

struct ProgressAlert_Previews: PreviewProvider {
    static var previews: some View {
        ProgressAlert(showAlert: .constant(true), resetAction: {})
    }
}
