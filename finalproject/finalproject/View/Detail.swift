import SwiftUI

struct Detail: View {
    @ObservedObject var tabData : TabViewModel
  
    var animation: Namespace.ID
    var body: some View {
        let names = ["bulbasaur", "vaporean", "pikachu"]
         let pokename = names.randomElement()!
        ScrollView{
        VStack
        {
            VStack
            {
                ZStack{
                    HStack{
                        Button(action: {
                            withAnimation(.spring()){
                                tabData.isDetail.toggle()
                            }
                        })
                        {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 24, weight: .heavy))
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()

                    }
                    Text("pokedex")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
                .padding()
                
                Image(tabData.selectedItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: tabData.selectedItem.image, in: animation)
                    .frame(height: UIScreen.main.bounds.height / 3)
                    .padding(.vertical,25)
            }
            .padding(.bottom)
            .background(Color(tabData.selectedItem.image).clipShape(CustomCorner()))
            HStack(spacing: 15){
        
                Button(action: {})
                {
                    
                    NavigationLink(destination: BattlePokemon (myPokemon: Pokemon(img: tabData.selectedItem.image , name: tabData.selectedItem.title) , opponentPokemon: Pokemon(img: pokename , name: pokename)) .navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true)) {
                Text("Select Pokemon")
                    }      .font(.headline)
                        .foregroundColor(.white)       
                }
          
            }
            .padding(.vertical)
            .padding(.horizontal, 25)
            .background(Color(tabData.selectedItem.image))
            .cornerRadius(15)
            .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white,lineWidth: 1))
           
            .offset(y: -35)
            .padding(.bottom,-35)
          
            VStack{
                HStack{
                    Text(tabData.selectedItem.title)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 10){
                        
                        Image(tabData.selectedItem.type)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .padding(.horizontal)
                            
                        
                    }
                }
                .padding()
                
                HStack{
                    Text(tabData.selectedItem.description)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black.opacity(0.7))
                    
                    Spacer(minLength: 0)
                }
                .padding(.horizontal)
                
                HStack{
                    Text("Weakness")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {})
                    {
                        Text("See More")
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                    }
                }
                .padding()
                
                HStack{
                    ForEach(1...4,id: \.self){
                        i in Image("\(tabData.selectedItem.title)_weakness_\(i)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .cornerRadius(10)
                        
                        Spacer(minLength: 10)
                    }
                    Button(action: {}){
                        Image(systemName: "plus")
                            .foregroundColor(.pink)
                            .frame(width: 55, height: 55)
                            .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.pink,style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round, dash:[10,10])))
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                HStack{
                    Text("Weak Against")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {})
                    {
                        Text("See More")
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                    }
                }
                .padding()
                HStack{
                    ForEach(1...5,id: \.self){
                        i in Image("\(tabData.selectedItem.title)_weak_\(i)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .cornerRadius(10)
                        
                        Spacer(minLength: 10)
                    }
                    Button(action: {}){
                        Image(systemName: "plus")
                            .foregroundColor(.pink)
                            .frame(width: 55, height: 55)
                            .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.pink,style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round, dash:[10,10])))
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            Spacer()
            }}
        .background(
            ZStack
            {
                Color(tabData.selectedItem.image)
                    .ignoresSafeArea(.all, edges: .top)
                Color.white
                    .ignoresSafeArea(.all, edges: .bottom)
            }
        )
    }
}
