import SwiftUI

struct TabBarView: View {
    @StateObject var tabData = TabViewModel()
    @Namespace var animation
    
    var body: some View {
        ZStack{
        TabView{
            
            Home(tabData: tabData, animation: animation)
                .tabItem{
                    Image(systemName: "house")
                    
                }

            
        }
        .accentColor(.black)
        
            if tabData.isDetail
            {
                Detail(tabData: tabData, animation: animation)
            }
            }
        }
       
    
    }


