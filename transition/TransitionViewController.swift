//
//  TransitionViewController.swift
//  dateFormat
//
//  Created by 이도헌 on 2022/07/15.
//

import UIKit

class TransitionViewController: UIViewController {

    @IBOutlet weak var randonNumber: UILabel!
    
    // 뷰컨트롤러 생명 주기 중 하나
    override func viewDidLoad() {
        super.viewDidLoad()
        print("첫번째 뷰", #function)

    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("첫번째 뷰", #function)
        randonNumber.text = "\(Int.random(in: 1...100))"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("첫번째 뷰", #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("첫번째 뷰", #function)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("첫번째 뷰", #function)
        
    }
    
    @IBAction func unwindTransitionFirstVC(segue: UIStoryboardSegue){
        
    }
}
