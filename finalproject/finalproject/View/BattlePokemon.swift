import SwiftUI

struct BattlePokemon: View {
   
    @State var myPokemon: Pokemon
    @State var opponentPokemon: Pokemon
    @State private var attackDisabled = false
    
    init(myPokemon: Pokemon, opponentPokemon: Pokemon) {
        
        self.myPokemon = myPokemon
        self.opponentPokemon = opponentPokemon
    }
    @State private var FirstPages: Bool = false
    var body: some View {
       
        
        GeometryReader { geo in
            ZStack {
                
                Image ("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
            
        
        
        VStack() {
            OpponentPokemonView(pokemon: opponentPokemon)
            MyPokemonView(pokemon: myPokemon)
            HStack(spacing: 50) {
                Button("Attack") {
                    opponentPokemon.attacked()
                    attackDisabled = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        if opponentPokemon.hpStatus.pokemonIsDefeated() {
                            return
                        }
                        myPokemon.attacked()
                        if myPokemon.hpStatus.pokemonIsDefeated() {
                            return
                        }
                        attackDisabled = false
                    }
                }
                .padding(.vertical)
                .padding(.horizontal,25)
                .background(Color.green)
                .cornerRadius(15)
                .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white,lineWidth: 1))
                .font(Font.headline.weight(.bold))
                .foregroundColor(.red)
                .disabled(attackDisabled)
                Button(action: {})
                {
                    
                    NavigationLink(destination: TabBarView().navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true) ){
                Text("New game")
                    }.padding(.vertical)
                        .padding(.horizontal, 25)
                        .background(Color.green)
                        .cornerRadius(15)
                        .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white,lineWidth: 1))
                       
                        
                
                                    .font(.headline)
                        .foregroundColor(.white)
                }
               
            }
        }
        .frame(width: 300, height: 400)
                    .foregroundColor(.white)
                    .font(.system(size: 19.0))
                    
    }
    }
}
}
