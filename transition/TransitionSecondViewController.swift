//
//  TransitionSecondViewController.swift
//  dateFormat
//
//  Created by 이도헌 on 2022/07/15.
//

import UIKit

enum UserDefaultsKey: String {
    case happyEmotion
}

class TransitionSecondViewController: UIViewController {
    
    @IBOutlet weak var mottoTextView: UITextView!
    /*
     1. 앱을 켜면 데이터를 가지고 와서 텍스트 뷰에 보여줘야 함.
     2. 바뀐 데이터를 저장해주어야 한다.
     -> UserDefault (key-value 구조)
     
     */
    
    
    
    // 감정 갯수 영구적으로 저장하기
    @IBOutlet weak var countLabel: UILabel!
    
   
  
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        
        // 기존 데이터 값 가져오기
        // 열거형으로 키값을 미리 구성할 수 있다.
        let currentValue = UserDefaults.standard.integer(forKey: UserDefaultsKey.happyEmotion.rawValue)
        
        // 감정 + 1
        let updateValue = currentValue + 1
        
        // 새로운 값 저장
        UserDefaults.standard.set(updateValue, forKey: "happyEmotion")
        // \(currentValue)로 사용시 갱신된 값이 아니다.
        
        // 레이블에 새로운 내용 보여주기
        countLabel.text = "\(UserDefaults.standard.integer(forKey: "happyEmotion"))"
        
        // 특정키 지우기, UserDefaults.standard.removeObject(forKey: <#T##String#>)
        // 등록된 모든 UserDefaults 데이터 삭제
    
        
        
    }
    
    // 뷰컨트롤러 생명 주기 중 하나
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "\(UserDefaults.standard.integer(forKey: "happyEmotion"))"
        print("두번째 뷰", #function)
        
        if UserDefaults.standard.string(forKey: "nickname") != nil {
            // 데이터 가져오기
            // 가져오려는 데이터 스타일
            mottoTextView.text = UserDefaults.standard.string(forKey: "nickname")

        } else {
            //데이터가 없는 경우 사용할 구문
            mottoTextView.text = "고래밥"
        }
        
        // 타입에 따라 반환값 조건이 다르다.
        print(UserDefaults.standard.string(forKey: "phoneNumber"))
        print(UserDefaults.standard.integer(forKey: "age"))
        print(UserDefaults.standard.bool(forKey: "inap"))
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("두번째 뷰", #function)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("두번째 뷰", #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("두번째 뷰", #function)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("두번째 뷰", #function)
        
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
     
        
    //저장 코드
        UserDefaults.standard.set(mottoTextView.text, forKey: "nickname")
        print("저장되었습니다!")
    }
    
}
