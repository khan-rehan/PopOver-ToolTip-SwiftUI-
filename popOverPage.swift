//
//  popOverPage.swift
//  random
//
//  Created by App Dev Team on 30/01/22.
//

import SwiftUI

struct popOverPage: View {
    @State var show: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
               Text("Hello World")
                if (show == true) {
                    withAnimation{
                        Color.black
                            .opacity(0.1)
                    }
                }
            
            }
            .navigationBarTitle("Pop Over", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        withAnimation {
                            show.toggle()
                        }
                    } label: {
                        Image(systemName: "info.circle")
                              .resizable()
                              .renderingMode(.template)
                              .foregroundColor(Color.black)
                              .frame(width: 30 , height: 30)
                    }
                }
            }
        }
        .toolBarPopover(show: $show, placement: .trailing){
            //Popover view (You can add any view of your own)
            DatePicker("", selection: .constant(Date()))
                .datePickerStyle(.wheel)
                .labelsHidden()
                
        }
    }
}

struct popOverPage_Previews: PreviewProvider {
    static var previews: some View {
        popOverPage()
    }
}

