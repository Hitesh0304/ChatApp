//
//  MessageCell.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-11-04.
//

import UIKit
import ChatAppUIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFonts()
        setupColors()
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupColors() {
        messageLabel.textColor = Colors.text.color
        messageBubble.backgroundColor = Colors.secondaryBackground.color
    }
    
    func setupFonts() {
        messageLabel.font = Fonts.apply(.headline, .regular)
    }
    
}
