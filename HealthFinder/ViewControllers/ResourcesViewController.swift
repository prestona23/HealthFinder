//
//  ResourcesViewController.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/6/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var resourcesTableView: UITableView!
    
    private let resourceListProvider = ResourceListProvider()
    private let CellIdentifier = "ResourceListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupSearchFields()
    }
    
    private func setupSearchFields() {
        searchButton.layer.cornerRadius = 5.0
    }
    
    private func searchForResources() {
        let age = ageTextField.text ?? ""
        let sex = (sexSegmentedControl.selectedSegmentIndex == 0) ? "Male" : "Female"
        
        NetworkManager().getHealthFinderResultsFor(age: age, sex: sex) { (result) in
            switch result {
            case .success(let healthFinderResults):
                print(healthFinderResults)
                if let error = healthFinderResults.result?.error, error == "True" {
                    print("Server Error")
                }
                else if let results = healthFinderResults.result {
                    self.updateTableWith(results)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateTableWith(_ results: MyHealthFinderResult) {
        var resources = [Resource]()
        if let interest = results.resources?.interest, let interestResources = interest.resource {
            resources.append(contentsOf: interestResources)
        }
        if let all = results.resources?.all, let allResources = all.resource {
            resources.append(contentsOf: allResources)
        }
        if let some = results.resources?.some, let someResources = some.resource {
            resources.append(contentsOf: someResources)
        }
        if let pregnant = results.resources?.pregnant, let pregnantResources = pregnant.resource {
            resources.append(contentsOf: pregnantResources)
        }
        resourceListProvider.refreshResources(resources: resources)
        resourcesTableView.reloadData()
    }

    @IBAction func didClickSearch(_ sender: Any) {
        ageTextField.resignFirstResponder()
        
        searchForResources()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ResourcesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resourceListProvider.resourceCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)

        let resource = resourceListProvider.resourceAt(index: indexPath.row)
        cell.textLabel?.text = resource?.title ?? ""

        return cell
    }
    
    
}
