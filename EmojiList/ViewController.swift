//
//  ViewController.swift
//  EmojiList
//
//  Created by Jon Sakas on 1/13/19.
//  Copyright © 2019 Doubledrop. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var emojis : [Emoji] = []
    
    let EMOJI_URL : String = "https://raw.githubusercontent.com/iamcal/emoji-data/master/emoji.json"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.fetchEmojis()
        
    }
    
    func fetchEmojis () {
        let url = URL(string: EMOJI_URL)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil,
                let data = data else {
                    print(error)
                    return
            }
            
            do {
                self.emojis = try JSONDecoder().decode([Emoji].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let e {
                print(e)
            }
            
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let emoji = emojis[indexPath.row]
        
        let arr = emoji.emoji?.components(separatedBy: "-")

        let text = String(
            String.UnicodeScalarView(
                arr!.flatMap{ Unicode.Scalar(UInt32($0, radix: 16)!) }
            )
        )
        
        var description : String
        if (emoji.description == nil) {
            description = ""
        } else {
            description = emoji.description!
        }
        
        cell.textLabel?.text = "\(text) :: \(description)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let emoji = emojis[indexPath.row]
        performSegue(withIdentifier: "moveSegue", sender: emoji)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let emojiDetailVC = segue.destination as! EmojiDetailViewController
        emojiDetailVC.emoji = sender as! Emoji
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

