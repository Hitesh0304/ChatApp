//
//  ContactCell.swift
//  ChatApp
//
//  Created by Hitesh Moudgil on 2023-12-02.
//

import UIKit
import ChatAppUIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFonts()
        setupColors()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupColors() {
        nameLabel.textColor = Colors.text.color
        backgroundColor = Colors.secondaryBackground.color
    }
    
    func setupFonts() {
        nameLabel.font = Fonts.apply(.headline, .bold)
    }
    
}
