//
//  EmojiDetailViewController.swift
//  EmojiList
//
//  Created by Jon Sakas on 1/13/19.
//  Copyright © 2019 Doubledrop. All rights reserved.
//

import UIKit

class EmojiDetailViewController: UIViewController {
    
    var emoji : Emoji?

    @IBOutlet weak var emojiLarge: UILabel!
    @IBOutlet weak var emojiDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let arr = emoji?.emoji?.components(separatedBy: "-")
        let text = String(
            String.UnicodeScalarView(
                arr!.flatMap{ Unicode.Scalar(UInt32($0, radix: 16)!) }
            )
        )

        emojiLarge.text = text
        emojiDescription.text = emoji?.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
