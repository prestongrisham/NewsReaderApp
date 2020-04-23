//
//  NewsDetailViewController.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/23/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {
    
    var article: Article!
    private var newsDetailsVM: NewsDetailsViewModel!
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    private func setupUI() {
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        self.newsDetailsVM = NewsDetailsViewModel(article)
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = self.newsDetailsVM.sourceName
        
        guard let url = self.newsDetailsVM.url,
            let newsDetailURL = URL(string: url) else { return }
        
        let request = URLRequest(url: newsDetailURL)
        self.webView.load(request)

        
    }

}
