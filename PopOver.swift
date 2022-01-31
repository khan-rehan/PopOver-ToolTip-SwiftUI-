//
//  PopOver.swift
//  random
//
//  Created by App Dev Team on 30/01/22.
//

import SwiftUI

extension View{
    
    func toolBarPopover<Content: View>(show: Binding<Bool>, placement: Placement = .leading,@ViewBuilder content: @escaping()->Content)->some View{
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack{
                    if show.wrappedValue{
                        content()
                        // Use frame modifier  to give custom height and width
//                            .frame(width: <#T##CGFloat?#>, height: <#T##CGFloat?#>, alignment: <#T##Alignment#>)
                            .padding()
                            .background(
                                Color.white
                                    .clipShape(PopOverArrowShape(placement: placement))
                            )
                        //Shadows..
                            .shadow(color: Color.primary.opacity(0.05), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.primary.opacity(0.05), radius: 5, x: -5, y: -5)
                        //padding from edge
                            .padding(.horizontal, 30)
                        //Moving from top..
                            .offset(y: 55)
                            .offset(x: placement == .leading ? -20 : 20)
                    }
                },
                
                alignment: placement == .leading ? .topLeading : .topTrailing
            )
    }
}


//Placement..
enum Placement{
    case leading
    case trailing
}



struct PopOver_Previews: PreviewProvider {
    static var previews: some View {
        popOverPage()
    }
}

///Custom Arrow Shape


struct PopOverArrowShape: Shape{
    
    var placement: Placement
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
            let pt1 = CGPoint(x:0, y:0)
            let pt2 = CGPoint(x:rect.width, y:0)
            let pt3 = CGPoint(x:rect.width, y:rect.height)
            let pt4 = CGPoint(x:0, y:rect.height)
            
            //Drawing Arcs with radius
            path.move(to: pt4)
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 7)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 7)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 7)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 7)
            
            //Arrow..
            path.move(to: pt1)
            path.addLine(to: CGPoint(x: placement == .leading ? 10 : rect.width - 10, y: 0))
            path.addLine(to: CGPoint(x: placement == .leading ? 15 : rect.width - 15, y: 0))
            path.addLine(to: CGPoint(x: placement == .leading ? 25 : rect.width - 25, y: -15))
            path.addLine(to: CGPoint(x: placement == .leading ? 40 : rect.width - 40, y: 0))
        }
    }
}
