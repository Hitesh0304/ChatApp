

import UIKit
import ChatAppUIKit
import ChatAppStrings

class ContactsViewController: UIViewController {

    @IBOutlet weak var contactsLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var receiver: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        tableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "ContactCell")
        setupColors()
        setupStrings()
        setupFonts()
        fetchReceiverDetails()
    }
}

extension ContactsViewController {
    
    func setupColors() {
        view.backgroundColor = Colors.background.color
        contactsLabel.textColor = Colors.text.color
        tableView.backgroundColor = UIColor.clear
        searchBar.backgroundColor = Colors.secondaryBackground.color
    }
    
    func setupStrings() {
        contactsLabel.text = Strings.contacts
    }
    
    func setupFonts() {
        contactsLabel.font = Fonts.apply(.title, .bold)
        
    }
    
    func fetchReceiverDetails() {
        ChatHandler.shared.loadMessages { [weak self] messages in
            self?.receiver = messages.first(where: {
                return $0.sender != ChatHandler.shared.messageSender
            })?.sender
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        cell.nameLabel.text = receiver
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
