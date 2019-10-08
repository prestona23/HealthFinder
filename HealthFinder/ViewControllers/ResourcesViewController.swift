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
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var searchContainerView: UIView!
    
    private let resourceListProvider = ResourceListProvider()
    private let CellIdentifier = "ResourceListCell"
    private let ResourceDetailSegueIdentifier = "showDetail"
    private let cornerRadius: CGFloat = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupProgressView()
        setupTableView()
        setupSearchFields()
    }
    
    /// Sets up the progress view and hides it.
    private func setupProgressView() {
        progressView.layer.cornerRadius = cornerRadius
        hideProgressView(true)
    }
    
    /// Sets up some initial table view values.
    private func setupTableView() {
        resourcesTableView.rowHeight = UITableView.automaticDimension
        resourcesTableView.estimatedRowHeight = 80.0
    }
    
    /// Sets up the search fields by adding the corner radius for the button and adds a done button to the age textfield.
    private func setupSearchFields() {
        // Make the search button round.
        searchButton.layer.cornerRadius = cornerRadius
        
        // Add a done button to the age text field.
        let toolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 40.0))
        let flexibleButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didPressDone(_ :)))
        toolbar.items = [flexibleButton, doneButton]

        ageTextField.inputAccessoryView = toolbar
        
        // Add some borders to the search container view so it isn't so bland.
        searchContainerView.layer.borderWidth = 0.5
        searchContainerView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    /// Retrieves the resources for the server.
    private func searchForResources() {
        // Age and sex have been validated at the point so we can just grab them.
        let age = ageTextField.text ?? ""
        let sex = (sexSegmentedControl.selectedSegmentIndex == 0) ? "Male" : "Female"
        
        // Disable the search controls so that you can't double click and show the progress view.
        enableSearchControls(false)
        hideProgressView(false)
        
        NetworkManager().getHealthFinderResultsFor(age: age, sex: sex) { (result) in
            // Re-enable the search controls and hide the progress view.
            self.hideProgressView(true)
            self.enableSearchControls(true)
            
            switch result {
            case .success(let healthFinderResults):
                
                if let error = healthFinderResults.result?.error, error == "True" {
                    self.showError(with: "Networking Error", message: "There was an error contacting the server. Please try again later.")
                }
                else if let results = healthFinderResults.result {
                    self.updateTableWith(results)
                }
            case .failure(let error):
                self.showError(with: "Networking Error", message: error.localizedDescription)
            }
        }
    }
    
    /// Updates the table with the new resources.
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
    
    /// Disables or enables the search button.
    private func enableSearchControls(_ enable: Bool) {
        searchButton.isEnabled = enable
    }
    
    /// Hides or shows the progress view.
    private func hideProgressView(_ hide: Bool) {
        progressView.isHidden = hide
    }
    
    /// Validates the search fields.
    private func validateFields() -> Bool {
        do {
            try ageTextField.validateTextField(type: .requiredField(field: "Age"))
            try ageTextField.validateTextField(type: .validAgeRange(field: "Age"))
        } catch let error as ValidationError {
            showError(with: "Validation Error", message: error.message)
            return false
        } catch let error {
            showError(with: "Validation Error", message: error.localizedDescription)
            return false
        }
        
        
        return true
    }

    @IBAction func didClickSearch(_ sender: Any) {
        ageTextField.resignFirstResponder()
        
        if validateFields() {
            searchForResources()
        }
    }
    
    @objc func didPressDone(_ sender: UIBarButtonItem) {
        ageTextField.resignFirstResponder()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ResourceDetailSegueIdentifier {
            if let navigationController = segue.destination as? UINavigationController,
            let detailController = navigationController.topViewController as? ResourceDetailViewController,
            let indexPath = resourcesTableView.indexPathForSelectedRow {
                resourcesTableView.deselectRow(at: indexPath, animated: true)
                detailController.resource = resourceListProvider.resourceAt(index: indexPath.row)
            }
            
        }
    }
    

}

// MARK: - UITableView Datasource

extension ResourcesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resourceListProvider.resourceCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //There are a few ways to go about this. Apple routinely just force unwraps ("!") the cell causing a crash if it's not
        //the proper cell type. This isn't necessarily bad because you "should" have a table cell at this point and if you don't
        //there is probably something catastrophically wrong. The other option is to not crash and return a cell
        //which may confuse the end user. Chose the more defensive approach here.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as? ResourceTableViewCell else {
            return UITableViewCell()
        }

        let resource = resourceListProvider.resourceAt(index: indexPath.row)
        cell.configureCell(forResource: resource)

        return cell
    }
    
    
}
