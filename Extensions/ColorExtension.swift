// Irlan Abushakhmanov, 2023

import SwiftUI

extension Color {
    public static func RGBColor(red: Int, green: Int, blue: Int) -> Color {
         Color(
            UIColor(
                red: CGFloat(red) / 255,
                green: CGFloat(green) / 255,
                blue: CGFloat(blue) / 255,
                alpha: 1.0
            )
        )
    }
    
    public static func colorForNumber(_ number: Int) -> Color {
        let progress = 0.0 

        let green = Color(red: 0, green: 1, blue: 0)
        let red = Color(red: 1, green: 0, blue: 0)

        let greenRatio = 1 - progress / 10
        let redRatio = progress / 10

        let color = Color(
            red: greenRatio * UIColor(green).cgColor.components![0] + redRatio * UIColor(red).cgColor.components![0],
            green: greenRatio * UIColor(green).cgColor.components![1] + redRatio * UIColor(red).cgColor.components![1],
            blue: greenRatio * UIColor(green).cgColor.components![2] + redRatio * UIColor(red).cgColor.components![2]
        )
        return color
    }
}
