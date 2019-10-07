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
    
    private func setupProvider() {
        guard let resource = resource, let sections = resource.sections?.section else {
            return
        }
    
        print(sections)
        resourceDetailListProvider.refreshSections(sections: sections)
    }
    
    private func setupTableView() {
        sectionTableView.rowHeight = UITableView.automaticDimension
        sectionTableView.estimatedRowHeight = 44.0
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == ContentSegueIdentifier {
            if let contentController = segue.destination as? ContentViewController,
                let index = sectionTableView.indexPathForSelectedRow?.row {
                contentController.content = resourceDetailListProvider.sectionAt(index: index)?.content
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
        let cell = tableView.dequeueReusableCell(withIdentifier: SectionCellIdentifier, for: indexPath)
        
        let section = resourceDetailListProvider.sectionAt(index: indexPath.row)
        cell.textLabel?.text = section?.title ?? ""
        cell.detailTextLabel?.text = section?.description ?? ""
        
        return cell
    }
    
    
}
