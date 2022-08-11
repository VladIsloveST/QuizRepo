//
//  RatingViewController.swift
//  Quiz Quiz
//
//  Created by Mac on 01.08.2022.
//

import UIKit

class RatingViewController: UIViewController {
    
    var filtreRating : [Base.Person] = []
    var searchPersonRating: [Base.Person]!
    
    @IBOutlet weak var personSearchBar: UISearchBar!
    
    @IBOutlet weak var ratingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingTableView.delegate = self
        ratingTableView.dataSource = self
        personSearchBar.delegate = self
        
        filtreRating = Base.shared.persons.sorted(by: {$0.score > $1.score})
        
        searchPersonRating = filtreRating
    }
}

extension RatingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchPersonRating.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! RatingTableViewCell
        let person = searchPersonRating[indexPath.row]
        cell.nameSurnameLable.text =  person.nameSurname
        let scoreString = String(person.score)
        cell.ratingLabel.text = scoreString
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            Base.shared.persons.removeAll { person in
                person.nameSurname == searchPersonRating[indexPath.row].nameSurname
            }
            searchPersonRating.remove(at: indexPath.row)
            ratingTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension RatingViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchPersonRating = []

        if searchText == "" {
            searchPersonRating = filtreRating
        }

        for person in filtreRating {
            if  person.nameSurname.uppercased().contains(searchText.uppercased()) {
                searchPersonRating.append(person)
            }
        }
        self.ratingTableView.reloadData()
    }
}
