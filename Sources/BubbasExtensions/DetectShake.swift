//
//  File.swift
//  
//
//  Created by Bubba hall on 9/21/22.
//

import Foundation
import SwiftUI

extension NSNotification.Name {
    public static let deviceDidShakeNotification =   NSNotification.Name("MyDeviceDidShakeNotification")
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
    }
}

@available(iOS 13.0, *)
extension View {
    public func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(ShakeDetector(onShake: action))
    }
}

@available(iOS 13.0, *)
struct ShakeDetector: ViewModifier {
    let onShake: () -> Void
    public func body(content: Content) -> some View {
        content
            .onAppear() // this has to be here because of a SwiftUI bug
            .onReceive(NotificationCenter.default.publisher(for:
                    .deviceDidShakeNotification)) { _ in
                        onShake()
                    }
    }
}
