//
//  FloatingButton.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 23/11/23.
//

import SwiftUI

struct ExpandableButtonItem: Identifiable {
    let id = UUID()
    let label: Image
    let action: () -> Void
}

struct FloatingButton: View {
    var secondaryButtons: [ExpandableButtonItem]? = nil
    let primaryAction: () -> Void

    var body: some View {
        ExpandableButtonPanel(
            primaryButton: ExpandableButtonItem(
                label: Image(systemName: "plus"),
                action: { self.primaryAction() }
            ),
            secondaryButtons: secondaryButtons
        )
    }
}

struct ExpandableButtonPanel: View {
    let primaryButton: ExpandableButtonItem
    let secondaryButtons: [ExpandableButtonItem]?
    
    private let size: CGFloat = 64
    private var cornerRadius: CGFloat { get{size/2} }
    private var iconSize: CGFloat { get{size/4} }
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            if secondaryButtons != nil && isExpanded {
                ForEach(secondaryButtons!) { button in
                    Button(action: {button.action()}, label: {
                        button.label
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .foregroundColor(Color.white)
                        
                    })
                        .frame(width: self.size, height: self.size)
                }
            }
            
            Button(
                action: {
                    self.primaryButton.action()
                    if secondaryButtons != nil { isExpanded.toggle() }
                },
                label: {
                    primaryButton.label
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                        .foregroundColor(Color.white)
                }
            )
            .frame(width: self.size, height: self.size)
        }
        .background(PRIMARY_COLOR)
        .foregroundColor(.white)
        .cornerRadius(self.cornerRadius)
        .shadow(radius: 2, x: -1, y: 2)
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FloatingButton(
                secondaryButtons: [
                    ExpandableButtonItem(
                        label: Image(systemName: "plus"),
                        action: { print("I am clicked 2") }
                    )
                ],
                primaryAction: { print("I am clicked")}
            )
            FloatingButton(primaryAction: { print("I am clicked")})
        }
    }
}
