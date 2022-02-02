import SwiftUI

struct Home: View {
    @State var items = [
        Item(title: "Bulbasaur", power: "Grass", type: "grass",description: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.", image: "p1"),
        Item(title: "Pikachu", power: "Electric", type: "electric",description: "Pikachu that can generate powerful electricity have cheek sacs that are extra soft and super stretchy. ", image: "p2"),
        Item(title: "Vaporeon", power: "Water", type: "water",description: "When Vaporeon’s fins begin to vibrate, it is a sign that rain will come within a few hours. ", image: "p3"),
        Item(title: "Slowbro", power: "Water", type: "water",description: "Slowpoke became Slowbro when a Shellder bit on to its tail. Sweet flavors seeping from the tail make the Shellder feel as if its life is a dream. ", image: "slowbro"),
    ]

    @ObservedObject var tabData : TabViewModel
    var animation: Namespace.ID
    
    var body: some View {
        VStack{
            ZStack{
                Text("Pokedex")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false)
            {
                VStack(spacing:20)
                {
                    ForEach(items)
                    {
                       item in CardView(item: item, tabData: tabData,animation: animation)
                    }
                }
                .padding()
            }
        }
    }
}
