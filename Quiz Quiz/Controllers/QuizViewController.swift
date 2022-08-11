//
//  ViewController.swift
//  Quiz Quiz
//
//  Created by Mac on 30.07.2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var myTestTableView: UITableView!
    
    var nameAndSurname: String?
    var quiz = [Quiz]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTestTableView.delegate = self
        myTestTableView.dataSource = self
        
        quiz.append(contentsOf: [
            Quiz(question: "God of the sun, light, music, and healing:", trueAnswer: "Apollo",
                 answers: ["Athena","Dionysus","Apollo","Ares"]),
            Quiz(question: "God of fire; blacksmith to the gods:", trueAnswer: "Hephaestus",
                 answers: ["Hermes","Hera","Hephaestus","Zeus"]),
            Quiz(question: "Goddess of love and beauty:", trueAnswer: "Aphrodite",
                 answers: ["Aphrodite","Athena","Hera","Artemis"]),
            Quiz(question: "God of the underworld:", trueAnswer: "Hades",
                 answers: ["Hera","Hades","Zeus","Ares"]),
            Quiz(question: "King of the gods:", trueAnswer: "Zeus",
                 answers: ["Hera","Hades","Zeus","Hermes"]),
            Quiz(question: "Goddess of war:", trueAnswer: "Eris",
                 answers: ["Eris","Dionysus","Artemis","Athena"])
        ])
        
        checkButton.layer.cornerRadius = 10
        myTestTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    @IBAction func checkScore(_ sender: Any) {
        
        guard let nameSurname = nameAndSurname else {return}
        Base.shared.savePerson(nameSurname: nameSurname, score: score)
    }
}

extension QuizViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell",
                                                 for: indexPath) as! CustomTableViewCell
        cell.questionLabel.text = quiz[indexPath.row].question
        cell.trueAnswerLAbel.text = quiz[indexPath.row].trueAnswer
        
        let answerArray = Array(quiz[indexPath.row].answers)
        var index = 0
        for answer in cell.answersCollection {
            answer.setTitle(answerArray[index], for: .normal)
            index += 1
        }
        return cell
    }
}

