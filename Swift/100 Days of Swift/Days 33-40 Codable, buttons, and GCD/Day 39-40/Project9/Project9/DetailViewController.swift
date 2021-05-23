//
//  DetailViewController.swift
//  Project9
//
//  Created by Bhargav Maniar on 21/05/2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    var petitionTitle: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else { return }
        
        // Place data into custom html code to view
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body {font-size: 150%; } </style>
        </head>
        <body>
        <h3 style = "font-family:-apple-system">\(detailItem.title)</h3>
        <p style = "font-family:-apple-system">\(detailItem.body)</p>
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }

}
