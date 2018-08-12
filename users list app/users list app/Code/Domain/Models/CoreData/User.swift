import Foundation

@objc(User)
open class User: _User {
    
    var fullName: String {
        guard let title = self.name.title, let firstName = self.name.first, let lastName = self.name.last else {
            return ""
        }
        
        if lastName.isEmpty {
            return firstName
        }
        
        return title + " " + firstName.capitalizingFirstLetter() + " " + lastName.capitalizingFirstLetter()
    }
}
