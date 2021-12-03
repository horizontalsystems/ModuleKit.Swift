import UIKit
import LanguageKit

class ModuleKit {

    static var bundle: Bundle? {
        Bundle.module
    }

    static func image(named: String) -> UIImage? {
        UIImage(named: named, in: Bundle.module, compatibleWith: nil)
    }

}

extension String {

    var localized: String {
        LanguageManager.shared.localize(string: self, bundle: ModuleKit.bundle)
    }

    func localized(_ arguments: CVarArg...) -> String {
        LanguageManager.shared.localize(string: self, bundle: ModuleKit.bundle, arguments: arguments)
    }

}
