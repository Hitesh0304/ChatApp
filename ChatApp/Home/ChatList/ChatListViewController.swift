

import UIKit
import ChatAppUIKit
import ChatAppStrings

class ChatListViewController: UIViewController {

    @IBOutlet weak var chatsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var lastMessage: Message?
    private lazy var dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, yyyy"
        return formatter
    }()
    
    private var receiver: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        
        setupColors()
        setupStrings()
        setupFonts()
        loadLastMessage()
    }
}

extension ChatListViewController {
    
    func setupColors() {
        view.backgroundColor = Colors.background.color
        chatsLabel.textColor = Colors.text.color
        tableView.backgroundColor = UIColor.clear
        
    }
    
    func setupStrings() {
        chatsLabel.text = Strings.chats
    }
    
    func setupFonts() {
        chatsLabel.font = Fonts.apply(.title, .bold)
    }
    
    func loadLastMessage() {
        ChatHandler.shared.loadMessages { [weak self] messages in
            self?.lastMessage = messages.last
            self?.receiver = messages.first(where: {
                return $0.sender != ChatHandler.shared.messageSender
            })?.sender
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let lastMessage = lastMessage else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        cell.senderNameLabel.text = receiver
        cell.messageLabel.text = lastMessage.body
        cell.dateLabel.text = dateFormatter.string(from: Date(timeIntervalSince1970: lastMessage.date))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let chatVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "ChatVC") as? ChatViewController else {
            return
        }
        
        self.tabBarController?.navigationController?.pushViewController(chatVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
