//
//  ViewController.swift
//  shans app
//
//  Created by Abolfazl Rafati on 12/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberLbl: UILabel!
    
    @IBOutlet var wheelBtn: UIButton!
    
    @IBOutlet var luckLbl: UILabel!
    
    
    let randomColor = [UIColor.red , UIColor.blue , UIColor.yellow, UIColor.purple]
    
    let randomLuckyTexts = ["emrox rox soltan nadoood" , "ya ali begoo va boland shoo" , " ba ye music khosh halam kon" , "people loves you"]
    
    
    func setupview(){
        self.wheelBtn.layer.shadowColor = UIColor.red.cgColor
        self.wheelBtn.layer.cornerRadius = 4.0
        self.wheelBtn.layer.masksToBounds = false
        self.wheelBtn.layer.shadowOpacity = 1.0
        self.wheelBtn.layer.shadowOffset = CGSize(width: 0.4, height: 0.4)
        
        self.numberLbl.text = "0"
        self.luckLbl.text = " "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupview()
    }
    
    @IBAction func wheelBtnPressed(_ sender: Any) {
        self.roundWheel()
    }
}
    extension ViewController {
        func getRandomNumber(index: Int) -> UInt32 {
            let lower : UInt32 = 0
            let upper : UInt32 = 8
            
            
            
            let randomNumber = arc4random_uniform(upper - lower) + lower
            
            self.wheelBtn.setBtnTitle(title:"\(self.getPersianNumber(number: randomNumber))")
            return randomNumber
        }
        
        func getPersianNumber(number: UInt32) -> String {
            switch number {
            case 0:
                return "۰"
                break
            case 1:
                return "۱"
                break
            case 2:
                return "۲"
                break
            case 3:
                return "۳"
                break
            case 4:
                return "۴"
                break
            case 5:
                return "۵"
                break
            case 6:
                return "۶"
                break
            case 7:
                return "۷"
                break
            default:
                return "۰"
            }
        }
        
        func roundWheel() {
            var randomLuckyNumber: UInt32!
            
            DispatchQueue.global(qos: .background).async {
                for i in 0...4 {
                
                DispatchQueue.main.async {
                    randomLuckyNumber = self.getRandomNumber(index: i)
                        self.wheelBtn.backgroundColor = self.randomColor[i]
                        print(i)
                        if (i == 4) {
                            self.wheelBtn.isEnabled = true
                            self.numberLbl.text = self.getPersianNumber(number: randomLuckyNumber!)
                            self.luckLbl.text = self.randomLuckyTexts[Int(randomLuckyNumber!)]
                            self.wheelBtn.setBtnTitle(title: "شانستو امتحان کن")
                        } else{
                            self.wheelBtn.isEnabled = false
                            self.luckLbl.text = "abolfazl"
                        }
                        
                    }
                    usleep(useconds_t(200000))
                }
            }
            
                
        }
    }

extension UIButton {
    func makeRadius(radius: CGFloat) {
        assert(radius > 0, "Invalid radius number")

        self.layer.cornerRadius = radius
    }
    func setBtnTitle(title: String) {
        self.setTitle(title, for: .normal)
    }
}

