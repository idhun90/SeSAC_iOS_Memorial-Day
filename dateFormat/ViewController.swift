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

enum Day: String {
    case day100
    case day200
    case day300
    case day400
}

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
    
    // 타이머 생성
    // var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // 현재(오늘) 날짜 표시
        calculateDay(sender: datePicker)
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
            j.text = "날짜를 선택해주세요."
        }
        
        // 이미지뷰 디자인
        for i in imageViewList {
            i.backgroundColor = .systemBlue
            i.layer.masksToBounds = true
            i.layer.cornerRadius = 10
            i.layer.opacity = 0.7
        }
        
        // 데이터피커 버전에 따른 디자인
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
    }
    
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        //선택한 날짜 표시
        calculateDay(sender: sender)
        
        // 타이머 작동시 오류 발생
        // timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(calculatorFunction(date:)), userInfo: nil, repeats: false)
    }
    
    // 현재 또는 선택한 날짜의 D-Day 값 계산 및 100, 200, 300, 400일 레이블에 할당
    func calculateDay(sender: UIDatePicker) {
        let currentDate = DateFormatter()
        currentDate.dateFormat = "YYYY년\nMM월 dd일"
        let date = sender.date
        currentDate.locale = Locale(identifier: "ko_KR")
        let currentDay = currentDate.string(from: date)
        print(currentDay) // 현재 선택된 날짜
        
        let calculatorDay = Calculator()
        
        resultLableList[0].text = calculatorDay.ddayCalculator(date: currentDay, day: 100)
        resultLableList[1].text = calculatorDay.ddayCalculator(date: currentDay, day: 200)
        resultLableList[2].text = calculatorDay.ddayCalculator(date: currentDay, day: 300)
        resultLableList[3].text = calculatorDay.ddayCalculator(date: currentDay, day: 400)
    }
    
    // D-Day 계산 구조체 생성
    struct Calculator {
        func ddayCalculator(date: String, day: Double) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY년\nMM월 dd일"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            let result = dateFormatter.date(from: date)!
            let add = result.addingTimeInterval(day*24*60*60)
            
            return dateFormatter.string(from: add)
        }
    }
}
