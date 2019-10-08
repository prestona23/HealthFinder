//
//  ResourceDetailViewController.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/6/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import UIKit

class ResourceDetailViewController: UIViewController {
    
    var resource: Resource?
    @IBOutlet weak var sectionTableView: UITableView!
    
    private let resourceDetailListProvider = ResourceDetailListProvider()
    private let SectionCellIdentifier = "SectionCellIdentifer"
    private let ContentSegueIdentifier = "ContentSegueIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let resource = resource {
            title = resource.title ?? ""
        }
        setupTableView()
        setupProvider()
        sectionTableView.reloadData()
    }
    
    /// Setup the provider based on the injected resource.
    private func setupProvider() {
        guard let resource = resource, let sections = resource.sections?.section else {
            return
        }
    
        resourceDetailListProvider.refreshSections(sections: sections)
    }
    
    /// Setup the table view defaults.
    private func setupTableView() {
        sectionTableView.rowHeight = UITableView.automaticDimension
        sectionTableView.estimatedRowHeight = 60.0
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == ContentSegueIdentifier {
            if let contentController = segue.destination as? ContentViewController,
                let indexPath = sectionTableView.indexPathForSelectedRow{
                sectionTableView.deselectRow(at: indexPath, animated: true)
                contentController.content = resourceDetailListProvider.sectionAt(index: indexPath.row)?.content
            }
        }
    }
    

}

// MARK: - UITableView Datasource

extension ResourceDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resourceDetailListProvider.sectionCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //There are a few ways to go about this. Apple routinely just force unwraps ("!") the cell causing a crash if it's not
        //the proper cell type. This isn't necessarily bad because you "should" have a table cell at this point and if you don't
        //there is probably something catastrophically wrong. The other option is to not crash and return a cell
        //which may confuse the end user. Chose the more defensive approach here.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionCellIdentifier, for: indexPath) as? ResourceDetailTableViewCell else {
            return UITableViewCell()
        }
        
        let section = resourceDetailListProvider.sectionAt(index: indexPath.row)
        
        cell.configureCell(forSection: section)
        
        return cell
    }
    
    
}
