//
//  ViewController.swift
//  Demo
//
//  Created by Edmond on 2019/4/21.
//  Copyright © 2019 Edmond. All rights reserved.
//

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func push(_ sender: Any) {
        navigationController?.pushViewController(TestVC(), animated: true)
    }
}





///
/// 让我们随便来写点什么.
///
/// - Parameter bar: 让我们随便来写点什么.
/// - Returns: 让我们随便来写点什么.
//func foo(bar: String) -> AnyObject { ... }


