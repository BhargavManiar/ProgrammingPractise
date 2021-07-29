//
//  DetailViewController.swift
//  Challenge-Day59
//
//  Created by Bhargav Maniar on 29/07/2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Country?
    
    override func loadView() {
            webView = WKWebView()
            view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else { return }
        let html = """
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style> body {font-size: 150%; } </style>
            </head>
        
            <body>
            </body>
        </html>
        """
        // Do any additional setup after loading the view.
    }

}
