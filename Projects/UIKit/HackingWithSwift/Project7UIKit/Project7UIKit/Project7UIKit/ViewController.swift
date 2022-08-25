//
//  ViewController.swift
//  Project7UIKit
//
//  Created by Ramadugu, Akshith on 8/21/22.
//

import UIKit
import Combine

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    let viewModel = PetitionViewModel()
    var anyCancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        viewModel.getPetitions(navigationControllerTag: navigationController?.tabBarItem.tag)
        
        viewModel.$allPetitions
            .receive(on: DispatchQueue.main)
            .sink { [weak self] allPetitions in
                self?.petitions = allPetitions
                self?.tableView.reloadData()
            }
            .store(in: &anyCancellables)
        
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(askFilter))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "Petitions from WE the PEOPLE at petitions.whitehouse.gov", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func askFilter() {

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = viewModel.allPetitions[indexPath.row]
        
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = viewModel.allPetitions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

