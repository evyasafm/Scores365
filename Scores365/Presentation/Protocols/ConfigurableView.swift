import Foundation

protocol IdentifiableView {
    static var identifier: String { get }
}

extension IdentifiableView {
    static var identifier: String {
        String(describing: Self.self)
    }
}

protocol ConfigurableView: IdentifiableView {
    associatedtype ViewModel
    func configure(with viewModel: ViewModel)
} 