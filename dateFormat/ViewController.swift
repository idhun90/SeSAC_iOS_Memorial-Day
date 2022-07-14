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
    
    // 타이머 생성
    var timer = Timer()
    
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
            j.text = "날짜를 선택해주세요."
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
        
        let result = dateFormatter.string(from: date)
        print("선택한 날짜는 \(result)입니다.")
        
        for i in resultLableList {
            i.text = result
        }

        // 타이머 작동시 오류 발생,,,
//        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(calculatorFunction(date:)), userInfo: nil, repeats: false)
        calculatorFunction(date: result)
    
    }
    
    @objc func calculatorFunction(date: String) {
        let calculatorDay = Calculator()
        resultLableList[0].text = calculatorDay.day100(date: date)
        resultLableList[1].text = calculatorDay.day200(date: date)
        resultLableList[2].text = calculatorDay.day300(date: date)
        resultLableList[3].text = calculatorDay.day400(date: date)
        
        // 문제: 결과값 오차가 +,- 1 만큼 발생했다.
        // 애플 공식 문서에 addingTimeInterval() 메소드 사용시 일수가 다른 월 등 복잡성 때문에 문제가 생길 수 있으니
        // 시간, 일, 월 등 달력 연산은 주의하라는 내용이 있는데 아마 그 부분 때문에 오차가 발생한 것 같다.
    }
    

    //MARK: - D-Day 계산 구조체
    // D-Day 계산 구조체 생성
    struct Calculator {

        func day100(date: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY년\nMM월 dd일"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            let result = dateFormatter.date(from: date)!
            let add100 = result.addingTimeInterval(100*24*60*60)
            
            return dateFormatter.string(from: add100)
        }
        
        func day200(date: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY년\nMM월 dd일"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            let result = dateFormatter.date(from: date)!
            let add200 = result.addingTimeInterval(200*24*60*60)
            
            return dateFormatter.string(from: add200)
        }
        func day300(date: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY년\nMM월 dd일"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            let result = dateFormatter.date(from: date)!
            let add300 = result.addingTimeInterval(300*24*60*60)
            
            return dateFormatter.string(from: add300)
        }
        func day400(date: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY년\nMM월 dd일"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            let result = dateFormatter.date(from: date)!
            let add400 = result.addingTimeInterval(400*24*60*60)
            
            return dateFormatter.string(from: add400)
        }
    }
}
