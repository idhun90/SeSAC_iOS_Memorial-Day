//
//  ViewController.swift
//  dateFormat
//
//  Created by 이도헌 on 2022/07/14.
//

// 수업 공부 내용
//        let format = DateFormatter()
//        format.dateFormat = "M월 d일, yy년"
//        //format.locale
//
//        let result = format.string(from: Date())
//        print(result, Date())
//
//        let word = "3월 2일, 19년"
//        let dateResult = format.date(from: word)
//        print(dateResult)
//
//
//        let now = Date()
//        print("현재 시간은 \(now)입니다.")

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var day100Label: UILabel!
    @IBOutlet weak var day200Label: UILabel!
    @IBOutlet weak var day300Label: UILabel!
    @IBOutlet weak var day400Label: UILabel!
    
    @IBOutlet weak var imageView100: UIImageView!
    @IBOutlet weak var imageView200: UIImageView!
    @IBOutlet weak var imageView300: UIImageView!
    @IBOutlet weak var imageView400: UIImageView!
    
    @IBOutlet var titleLabelList: [UILabel]!
    @IBOutlet var resultLableList: [UILabel]!
    @IBOutlet var imageViewList: [UIImageView]!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        selectpreferredDatePickerSyle()
        
    }
    
    func updateUI() {
        
        // D+100/200/300/400 레이블 디자인
        for i in 0...titleLabelList.count-1 {
            let labelTitle = ["D+100", "D+200", "D+300", "D+400"]
            titleLabelList[i].text = labelTitle[i]
            titleLabelList[i].textColor = .white
            titleLabelList[i].font = .boldSystemFont(ofSize: 22)
        }
        
        // 디데이 결과 레이블 디자인
        for j in resultLableList {
            j.textColor = .white
            j.textAlignment = .center
        }
        
        // 이미지뷰 디자인
        for i in imageViewList {
            i.backgroundColor = .systemBlue
            i.layer.masksToBounds = true
            i.layer.cornerRadius = 10
            i.layer.opacity = 0.7
        }
        
        
        
    }
    
    func selectpreferredDatePickerSyle() {
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }

    @IBAction func datePicker(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .long // 연도, 월&일 두 개의 레이블로 나눠야 하는지 고민했지만 작업 편의를 위해 일단 보류.
//        dateFormatter.timeStyle = .none
        
        dateFormatter.dateFormat = "YYYY년\nMM월 dd일"
        
        let date = sender.date // DatePicker sender date를 받아옴
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        print(dateFormatter.string(from: date))
        
        let result = dateFormatter.string(from: date)
        
        for i in resultLableList {
            i.text = result
        }
        
    }
    
}

