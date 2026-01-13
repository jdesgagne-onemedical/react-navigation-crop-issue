import Foundation
import UIKit

class ReactNativeViewController: UIViewController {
    private let featureName: String
    private var reactView: UIView?
    private let initialProps: [String: Any]?

    init(for featureName: String, initialProps: [String: Any]?) {
        self.featureName = featureName
        self.initialProps = initialProps

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func onMain(_ work: @escaping () -> Void) {
        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } }
    }

    private func createReactNativeView() {
        onMain { [self] in
            // Remove existing React Native view if it exists
            reactView?.removeFromSuperview()
            reactView = nil

            // Create new React Native view
            let builtView = ReactNativeFactory.buildView(for: featureName, initialProps: initialProps)
            builtView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(builtView)
            reactView = builtView

            NSLayoutConstraint.activate([
                builtView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                builtView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                builtView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                builtView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            ])
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createReactNativeView()
    }

    deinit {
        if !Thread.isMainThread {
            DispatchQueue.main.async { _ = self.view } // ensure view hierarchy is torn down on main
            return
        }
    }
}
