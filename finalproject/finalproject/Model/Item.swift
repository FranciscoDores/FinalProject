import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var title: String
    var power: String
    var type: String
    var description: String
    var image: String
}
