// Irlan Abushakhmanov, 2023

import SwiftUI

struct TrainingViewController: View {
    
    let application = UIApplication.shared
    
    var body: some View {
        VStack(spacing: 14) {
            VStack(spacing: 24) {
                HStack {
                    Text.trainingTextLine(contentText: "Cards", dataText: "0%")
                }
                
            }.padding()
            .frame(width: 340, height: 60)
            .overlay(RoundedRectangle(cornerRadius: 22).stroke(application.leadingColor, lineWidth: 1))
                
            VStack(spacing: 24) {
                HStack {
                    Text.trainingTextLine(contentText: "Тренировка", dataText: "0%")
                }
            }.padding()
            .frame(width: 340, height: 60)
            .overlay(RoundedRectangle(cornerRadius: 22).stroke(application.leadingColor, lineWidth: 1))
//
//            HStack {
//                Text.halfTextLine(contentText: "Cheat sheet")
//            }.padding()
//            .frame(width: 340, height: 60)
//            .overlay(RoundedRectangle(cornerRadius: 22).stroke(application.leadingColor, lineWidth: 1))
            
            HStack {
                Text.halfTextLine(contentText: "Abbreviations")
            }.padding()
            .frame(width: 340, height: 60)
            .overlay(RoundedRectangle(cornerRadius: 22).stroke(application.leadingColor, lineWidth: 1))
        
            Button(action: {}) {
                Text.halfTextLine(contentText: "Cheat sheet")
            }.padding()
                .frame(width: 340, height: 60)
                .overlay(RoundedRectangle(cornerRadius: 22).stroke(application.leadingColor, lineWidth: 1))
            Spacer()
        }
    }
}

struct TrainingViewController_Previews: PreviewProvider {
    static var previews: some View {
        TrainingViewController()
    }
}
