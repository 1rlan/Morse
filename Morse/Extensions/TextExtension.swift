// Irlan Abushakhmanov, 2023

import SwiftUI

extension Text {
    public func settingsTitle() -> some View {
        self.font(.system(.title3).weight(.semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public func tabTitle() -> some View {
        self.font(.system(.title3).weight(.semibold))
            .frame(height: 50, alignment: .center)
    }
    
    @ViewBuilder
    public static func textLine(contentText: String, dataText: String? = nil) -> some View {
        HStack {
            Text(contentText).padding(.leading, 20)
            Spacer()
            if let dataText {
                Text(dataText).padding(.trailing, 20)
                    .foregroundColor(UIApplication.shared.darkGrayColor)
            }
        }
    }
    
    public static func trainingTextLine(contentText: String, dataText: String) -> some View {
        HStack {
            Text(contentText).padding(.leading, 8)
            Spacer()
            Text(dataText).padding(.trailing, 8)
                .foregroundColor(UIApplication.shared.darkGrayColor)
        }
    }
    
    @ViewBuilder
    public static func halfTextLine(contentText: String) -> some View {
        Text(contentText).padding(.leading, 8).foregroundColor(Color.black)
        Spacer()
    }
    
    @ViewBuilder
    public static func textWithToggle(contentText: String) -> some View {
        HStack {
            Text(contentText).padding(.leading, 20)
            Spacer()
            Toggle(isOn: .constant(true), label: { }).padding(.trailing, 20)
        }
    }
}

