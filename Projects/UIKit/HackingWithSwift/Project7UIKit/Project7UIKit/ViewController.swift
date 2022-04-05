//
//  ViewController.swift
//  Project7UIKit
//
//  Created by Ramadugu, Akshith on 4/4/22.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        
        let filter = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterPetitions))
        
        let reset = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetFilter))
        reset.isEnabled = false
        
        navigationItem.rightBarButtonItems = [reset, filter]
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        
        showError()
    }
    
    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "Data comes from the We The People API of the White House", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func filterPetitions() {
        let ac = UIAlertController(title: "Filter Petitions", message: "Enter a keyword", preferredStyle: .alert)
        ac.addTextField()
        
        let filterAction = UIAlertAction(title: "Submit", style: .default) { [weak ac, self] _ in
            
            guard let filterString = ac?.textFields?[0].text else { return }
            
            self.filter(filterString)
        }
        
        ac.addAction(filterAction)
        present(ac, animated: true)
    }
    
    func filter(_ filterString: String) {
        for petition in petitions {
            if petition.title.lowercased().contains(filterString.lowercased()) {
                filteredPetitions.append(petition)
            }
        }
        
        if filteredPetitions.isEmpty {
            let ac = UIAlertController(title: "Error", message: "No match found!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true)
        }
        
        tableView.reloadData()
        self.navigationItem.rightBarButtonItems?.first?.isEnabled = true
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    @objc func resetFilter() {
        filteredPetitions.removeAll()
        tableView.reloadData()
        self.navigationItem.rightBarButtonItems?.first?.isEnabled = false
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading Error", message: "There was a problem loading the feed; please check your connection and try again", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.isEmpty ? petitions.count : filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition : Petition
        
        if filteredPetitions.isEmpty {
            petition = petitions[indexPath.row]
        } else {
            petition = filteredPetitions[indexPath.row]
        }
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

