//
//  File.swift
//  
//
//  Created by Bubba hall on 9/21/22.
//

import Foundation
import SwiftUI

/// Extends NSNotification.name to add a notification for shaking your device
extension NSNotification.Name {
    public static let deviceDidShakeNotification =   NSNotification.Name("MyDeviceDidShakeNotification")
}

//// Extends UIWindow so you know know the shaking stopped and you can run code
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
    }
}

/// Extends View so you can  call code when the UIWindow realizes the shaking has stopped
@available(iOS 13.0, *)
extension View {
    public func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(ShakeDetector(onShake: action))
    }
}

@available(iOS 13.0, *)

/// ShakeDetector is a modifier on View so you can call this on any View with an action at the end
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
