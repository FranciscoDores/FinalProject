import SwiftUI

let backgroundGradient = LinearGradient(
    gradient: Gradient(colors: [Color.blue, Color.yellow]),
    startPoint: .top, endPoint: .bottom)

struct ContentView: View {
    @StateObject var tabData = TabViewModel()
    @Namespace var animation
 
    
    @State private var FirstPages: Bool = false
    var body: some View {
        
            
        
        NavigationView{
            ZStack{
            backgroundGradient
            .ignoresSafeArea()
                VStack {
                                //Texto do Início
                                Text("Pokémon Battle")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .foregroundColor(.yellow)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom,20)
                                    .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
                                    .shadow(color: .blue, radius: 2, x: 0, y: 10)
                                //Fim do texto do início
                                
                                //Tudo em relação à imagem
                                Image("Logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150)
                                    .clipped()
                                    .cornerRadius(150)
                                    .padding(.bottom, 75)
                                //Fim da imagem
                    NavigationLink(destination: TabBarView()
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true), isActive: $FirstPages) {
                Text("Start a Game")
                        
                    }  //Fim NavigationLink
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
            
                }// Fim VStack
        } //Fim ZStack
    }//Fim NavigationView
    } // Fim Some View

}

