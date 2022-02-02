import SwiftUI

class TabViewModel: ObservableObject {
    @Published var selectedItem : Item!
    @Published var isDetail = false
}
