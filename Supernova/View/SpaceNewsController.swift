import UIKit

class SpaceNewsController: UIViewController {
    
    var spaceNewsView: SpaceNewsScreen?
    var viewModel: SpaceNewsViewModel?
    
    override func loadView() {
        self.spaceNewsView = SpaceNewsScreen()
        self.view = spaceNewsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.spaceNewsView?.setUpNewsTableViewProtocols(delegate: self, dataSource: self)
        self.viewModel = SpaceNewsViewModel(delegate: self)
        self.setUpNavigationController()
        self.setUpNews()
    }
    
    private func setUpNavigationController() {
        self.title = "Supernova 💫"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setUpNews() {
        self.viewModel?.getData()
    }
}

extension SpaceNewsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let largeCell: LargeSpaceNewsCell? = tableView.dequeueReusableCell(withIdentifier: LargeSpaceNewsCell.identifier, for: indexPath) as? LargeSpaceNewsCell
            largeCell?.prepareLargeSpaceCell(model: (self.viewModel?.getDataIndex(indexPath: indexPath))!)
            return largeCell ?? UITableViewCell()
        }
        let cell: SpaceNewsCell? = tableView.dequeueReusableCell(withIdentifier: SpaceNewsCell.identifier, for: indexPath) as? SpaceNewsCell
        cell?.prepareSpaceCell(model: (self.viewModel?.getDataIndex(indexPath: indexPath))!)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        }
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SpaceNewsController: SpaceNewsViewModelProtocols {
    
    func success() {
        DispatchQueue.main.async {
            self.spaceNewsView?.newsTableView.reloadData()
        }
    }
    
    func failure() {
        print("Erro camada mais alta")
    }
}
