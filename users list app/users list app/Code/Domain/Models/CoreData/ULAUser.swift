import Foundation

@objc(ULAUser)
open class ULAUser: _ULAUser {
    
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
