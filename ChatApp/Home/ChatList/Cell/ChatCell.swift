

import UIKit
import ChatAppUIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = Colors.secondaryBackground.color
        setupFonts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupFonts() {
        senderNameLabel.font = Fonts.apply(.headline, .bold)
        messageLabel.font = Fonts.apply(.subheadline, .regular)
        dateLabel.font = Fonts.apply(.footnote, .regular)
    }
    
    func setupColors() {
        senderNameLabel.textColor = Colors.text.color
        messageLabel.textColor = Colors.text.color
        dateLabel.textColor = Colors.text.color
    }
}
