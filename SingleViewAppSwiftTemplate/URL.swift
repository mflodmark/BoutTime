 //
//  URL.swift
//  BoutTime
//
//  Created by Markus Flodmark on 2017-01-22.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit

class URLview: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    
    var url = "https://www.nhl.com/player/sidney-crosby-8471675"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(url: requestURL! as URL)
        webView.loadRequest(request as URLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    enum Player: String {
        case crosby = "Sidney Crosby"
        case pacioretty = "Max Pacioretty"
        case benn = "Jamie Benn"
        case toews = "Jonathan Toews"
        case mcdavid = "Connor McDavid"
        case malkin = "Evgeni Malkin"
        case karlsson = "Erik Karlsson"
        case burns = "Brent Burns"
        case kane = "Patrick Kane"
        case tarasenko = "Vladimir Tarasenko"
        case scheifele = "Mark Scheifele"
        case panarin = "Artemi Panarin"
        case kucherov = "Nikita Kucherov"
        case pavelski = "Joe Pavelski"
    }


    func showUrl(player: String) {
        // Check enum with players from statement.swift
        
    }
    

    
     // MARK: - Navigation

    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
 

