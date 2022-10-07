import UIKit
import SectionsTableView
import ThemeKit
import ComponentKit
import ModuleKit

class ViewController: ThemeViewController {

    private let tableView = SectionsTableView(style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ModuleKit Example"
        navigationItem.largeTitleDisplayMode = .never

        tableView.sectionDataSource = self

        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none

        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }

        tableView.buildSections()
    }

    private func show(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ViewController: SectionsDataSource {

    func buildSections() -> [SectionProtocol] {
        let languageRow = CellBuilder.selectableRow(
                elements: [.text, .image24],
                tableView: tableView,
                id: "language_settings",
                bind: { cell in
                    cell.set(backgroundStyle: .lawrence, isFirst: true, isLast: true)
                    cell.bind(index: 0) { (textComponent: TextComponent) in
                        textComponent.text = "Language Settings"
                    }
                    cell.bind(index: 1) { (imageComponent: ImageComponent) in
                        imageComponent.imageView.image = UIImage(systemName: "arrow.right")
                        imageComponent.imageView.tintColor = .gray
                    }
                },
                action: { [weak self] in
                    self?.show(viewController: LanguageSettingsRouter.module { () -> UIViewController in ThemeNavigationController(rootViewController: ViewController()) })
                }
        )

        return [
            Section(
                id: "settings",
                headerState: .margin(height: .margin3x),
                footerState: .margin(height: .margin8x),
                rows: [languageRow]
            )
        ]
    }

}
