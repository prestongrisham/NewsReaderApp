//
//  NewsHeadlinesTableViewController.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/21/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation
import UIKit



class NewsHeadlinesTableViewController: UITableViewController {
    
    private var categoryListVM: CategoryListViewModel!
    
    enum newsCategories: String, CaseIterable {
        case business = "business"
        case entertainment = "entertainment"
        case general = "general"
        case health = "health"
        case science = "science"
        case sports = "sports"
        case technology = "technology"
        
    }
    
    var categoryToShow: newsCategories = .sports
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Works on NewsDetailViewController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .white
        
        setupUI()
        populateHeadlinesAndArticles()
        
        self.navigationItem.title = "TODAYS NEWS"
        //populateHeadlinesAndArticlesSelect()
        
        let refreshControl = UIRefreshControl()
        //refreshControl.addTarget(self, action:  #selector(refreshPage), for: .valueChanged)
        self.refreshControl = refreshControl
        
    }
    
    @objc func refreshPage() {
        print("In Here")
        if categoryToShow == .sports {
            categoryToShow = .business
            self.navigationItem.title = categoryToShow.rawValue
            self.navigationController?.navigationBar.tintColor = .systemPink
            //setup(color: .systemIndigo)
        } else if categoryToShow == .business {
            categoryToShow = .general
            self.navigationItem.title = categoryToShow.rawValue
            setup(color: .systemPink)
        } else if categoryToShow == .general {
            categoryToShow = . technology
            self.navigationItem.title = categoryToShow.rawValue
            setup(color: .systemTeal)
        } else if categoryToShow == .technology {
            categoryToShow = .sports
            self.navigationItem.title = categoryToShow.rawValue
            setup(color: .systemRed)
        }
        
        populateHeadlinesAndArticlesSelect()
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.categoryListVM.heightForHeaderInSection(section)
    }
    
    private func populateHeadlinesAndArticles() {
        
        CategoryService().getAllHeadlinesForAllCategories { (categories) in
            self.categoryListVM = CategoryListViewModel(categories: categories)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let name = self.categoryListVM.categoryAtIndex(index: section).name
        return UIView.viewForSectionHeader(title: name)
        
    }
    
    private func populateHeadlinesAndArticlesSelect() {
        
        CategoryService().getAllHeadlinesForSelectCategories(list: ["\(categoryToShow.rawValue)"]) { (categories) in
            self.categoryListVM = CategoryListViewModel(categories: categories)
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoryListVM == nil ? 0 : self.categoryListVM.numberofSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsHeadlineTableViewCell", for: indexPath) as? NewsHeadlineTableViewCell else { return UITableViewCell() }
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(index: indexPath.row)
        cell.configure(vm: articleVM)
        return cell
        
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.tableHeaderView = UIView.viewForTableViewHeader(title: Date.dateAsStringForTableViewHeader())
    }
    
    func setup(color: UIColor) {
                
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = color
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
               
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewsDetailViewController" {
            prepareSegueForNewsDetails(segue)
        }
    }
    
    private func prepareSegueForNewsDetails(_ segue: UIStoryboardSegue) {
        let dvc = segue.destination as! NewsDetailViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { fatalError("Unable to get the selected row")}
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(index: indexPath.row)
        dvc.article = articleVM.article
    }
    
}
