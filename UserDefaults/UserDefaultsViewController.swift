enum Keys: String {
    case Clicked
    case TextField
}
import UIKit

class UserDefaultsViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewUI()
        
        // 저장된 클릭 횟수 값 불러오기
        countLabel.text = "\(UserDefaults.standard.integer(forKey: Keys.Clicked.rawValue))"
        
        // 저장된 텍스트 값 불러오기
        textView.text = UserDefaults.standard.string(forKey: Keys.TextField.rawValue) ?? "텍스트를 입력해주세요."
    }

    // 텍스트 저장 버튼
    @IBAction func saveText(_ sender: UIButton) {
        // 입력한 텍스트 저장
        UserDefaults.standard.set(textView.text, forKey: Keys.TextField.rawValue)
        
        let alert = UIAlertController(title: "완료", message: "저장이 완료되었습니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
    //클릭 횟수 증가 버튼
    @IBAction func countCicked(_ sender: UIButton) {
        
        // 클릭 횟수 데이터 가져오기. 디폴트 값 0
        let countDate = UserDefaults.standard.integer(forKey: Keys.Clicked.rawValue)
        
        // 클릭시 카운트 갱신
        let updateCount = countDate + 1
        
        // 새로운 값 저장
        UserDefaults.standard.set(updateCount, forKey: Keys.Clicked.rawValue)
        
        // Label에 표시해주기
        countLabel.text = "\(updateCount)"
    }
    
    // 횟수 초기화 버튼
    @IBAction func clearCount(_ sender: UIButton) {
        let alret = UIAlertController(title: "횟수 초기화", message: "클릭 횟수가 초기화됩니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .destructive) { _ in
            UserDefaults.standard.removeObject(forKey: Keys.Clicked.rawValue)
            self.countLabel.text = "\(UserDefaults.standard.integer(forKey: Keys.Clicked.rawValue))"
            print("초기화 후 클릭 수: \(UserDefaults.standard.integer(forKey: Keys.Clicked.rawValue))")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alret.addAction(ok)
        alret.addAction(cancel)
        present(alret, animated: true, completion: nil)
        
        print("클릭 수: \(UserDefaults.standard.integer(forKey: Keys.Clicked.rawValue))")
        
    }
    
    func textViewUI() {
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 18)
        
    }
}
