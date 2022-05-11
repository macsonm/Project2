import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var tryNumber = 0
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += +1
            tryNumber += 1
        } else {
            title = "Wrong is the \(correctAnswer+1) flag"
            if score == 0 {
                score = 0
            } else {
                score += -1
                tryNumber += 1
            }
        }
        
        let ac = UIAlertController(title: title, message: "Your core is \(score)", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        //TODO: - update score
        addLabelToNB()
    }
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        customButtonFlag()
        askQuestion()
        addLabelToNB()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    func customButtonFlag() {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 1, alpha: 0.7).cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    //TODO: score in firstLabel and attempt in secondLabel
    func addLabelToNB() {
        if let navigationBar = self.navigationController?.navigationBar {
            let firstFrame = CGRect(x: 20, y: 0, width: navigationBar.frame.width/3, height: navigationBar.frame.height)
            let secondFrame = CGRect(x: navigationBar.frame.width-20-navigationBar.frame.width/3,
                                     y: 0,
                                     width: navigationBar.frame.width/3,
                                     height: navigationBar.frame.height)
            
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.bounds = firstFrame
            //firstLabel.backgroundColor = .red
            firstLabel.textAlignment = .center
            firstLabel.text = "Score: \(score)"
            
            let secondLabel = UILabel(frame: secondFrame)
            secondLabel.bounds = secondFrame
            secondLabel.text = "Second"
            secondLabel.textAlignment = .center
            //secondLabel.backgroundColor = .green
            
            navigationBar.addSubview(firstLabel)
            navigationBar.addSubview(secondLabel)
        }
    }
    
    func updateScore() {
        
    }
    
}
