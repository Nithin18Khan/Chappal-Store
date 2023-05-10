//
//  DetailsScreen.swift
//  Chappal Store
//
//  Created by Nithin Khan on 09/05/23.
//

import SwiftUI

    struct DetailsScreen: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        var body: some View {
            ZStack{
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    Image("chappal_2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    DiscriptionView()
                        .offset(y: -40)
                }

                .edgesIgnoringSafeArea(.top)

                HStack{
                    Text("₹ 1299")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Add To Cart")
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .foregroundColor(Color("Primary"))
                            .cornerRadius(10.0)
                    })
                }
                .padding()
                .padding(.horizontal)
                .background(Color("Primary"))
                //                .cornerRadius(10.0)
                .cornerRadius(50, corners: .topLeft)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot")
                                )
        }
    }


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}



struct DiscriptionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Luxury shoes \nWoolen Shoes")
                .font(.title)
                .fontWeight(.bold)
            HStack(spacing: 4){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Text("4.9")
                    .opacity(0.5)
                    .padding(.leading)
                Spacer()
            }
            Text("Discription")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Luxury sweden  shoes based on the virtuis of modern craft if carries on the simplicity and architect craft shoes")
                .lineSpacing(8.0)
                .opacity(0.6)
            HStack(alignment: .top){
                VStack{
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("leather, canvas, \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            HStack(alignment: .bottom){
                VStack{
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: .green)
                        ColorDotView(color: Color("Primary"))
                        
                 }
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack{
                        Button(action: {}){
                            Image(systemName: "minus")
                                .padding(.all)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {}){
                            Image(systemName: "plus")
                                .padding(.all)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
                
            }
          
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
            color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}



struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}

struct CustomBackButtonView: View {
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
                .foregroundColor(.black)
        })
    }
}
