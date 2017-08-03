//
//  ViewController.swift
//  ShareApplication
//
//  Created by Xcode on 2017/5/5.
//  Copyright © 2017年 wtfcompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var functionArray = ["開啟網頁", "電子信箱","傳送簡訊","撥打電話"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(UIView(frame: CGRect.zero))
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 20))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return functionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellD")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellD")
        }
        cell?.textLabel?.text = self.functionArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if let url = URL(string: "http://www.pcschool.com.tw") {
                UIApplication.shared.open(url, options: [ : ], completionHandler: nil)
            }
        case 1:
            if let url = URL(string: "mailto://myFriend@xxx.net.tw") {
                UIApplication.shared.open(url, completionHandler: nil)
            }
        case 2:
            if let url = URL(string: "smsto://0911111111") {
                UIApplication.shared.open(url, completionHandler: nil)
            }
        case 3:
            if let url = URL(string: "tel://0911111111") {
                UIApplication.shared.open(url, completionHandler: nil)
            }
        default:
            break
        }
    }
}
