//
//  CustomTableViewCell.swift
//  Quiz Quiz
//
//  Created by Mac on 30.07.2022.
//

import UIKit

public var score = 0

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var answersCollection: [UIButton]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueAnswerLAbel: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for button in answersCollection {
            button.layer.cornerRadius = 8
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
            button.makeAnimation()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func chooseAnswer(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            checkAnswer(selected: answersCollection[0])
        case 2:
            checkAnswer(selected: answersCollection[1])
        case 3:
            checkAnswer(selected: answersCollection[2])
        case 4:
            checkAnswer(selected: answersCollection[3])
        default:
            break
        }
    }
    
    func checkAnswer(selected answer: UIButton) {
        let title = answer.titleLabel!.text
        if title == trueAnswerLAbel.text {
            score += 1
            let seconds = 0.7
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                answer.layer.borderColor =  UIColor.green.cgColor
                answer.layer.borderWidth = 1.5
            }
        } else {
            let seconds = 0.7
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                
                answer.layer.borderColor =  UIColor.red.cgColor
                answer.layer.borderWidth = 1.5
                
                self.label.textColor = .black
                self.trueAnswerLAbel.textColor = .black
            }
        }
        for button in self.answersCollection {
            button.isUserInteractionEnabled = false
        }
    }
}
