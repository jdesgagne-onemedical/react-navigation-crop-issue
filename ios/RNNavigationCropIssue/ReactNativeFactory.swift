import Foundation
import React
import React_RCTAppDelegate
import SwiftUI
import UIKit

@objc public final class ReactNativeFactory: RCTDefaultReactNativeFactoryDelegate {
    private static let reactNativeFactoryDelegate = ReactNativeDelegate()
    private static var reactNativeFactory: RCTReactNativeFactory = .init(
        delegate: reactNativeFactoryDelegate
    )

    @MainActor
    @objc public static func buildView(
        for moduleName: String,
        initialProps: [String: Any]?
    ) -> UIView {
        return reactNativeFactory.rootViewFactory.view(
            withModuleName: moduleName,
            initialProperties: initialProps
        )
    }
}