//
//  ContentView.swift
//  UI-651
//
//  Created by nyannyan0328 on 2022/08/23.
//

import SwiftUI


struct ContentView: View {
    @State var offset : CGFloat = 0
    let screenWidht = UIScreen.main.bounds.width
    
    @State var outPut : CGFloat = 0
    var body: some View {
        VStack{
            
            
            Text("""


Interpolation.shared.interpolate(inputStartRange: 0, inputStartRange: screenWidht,
inputStartRange: -200,
inputStartRange: -100,
value: newValue)

Input Value : \(String(format: "%.1f", offset))
OutPut Value : \(String(format: "%.1f", outPut))

""")
            
            
            Rectangle()
                .fill(.mint)
                .overlay {
                    Text("Drage Gesture")
                        .font(.largeTitle)
                }
                .gesture(
                
                
                    DragGesture()
                        .onChanged({ value in
                            
                            offset = value.location.x
                        })
                
                )
                .onChange(of: offset) { newValue in
                    
                    outPut = Interpolation.shared.interpolate(inputStartRange: 0, inputStartRange: screenWidht, inputStartRange: -200, inputStartRange: -100, value: newValue)
                    
                }
                
            
        }
        .preferredColorScheme(.dark)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Interpolation{
    
    static let shared = Interpolation()
    
    func interpolate(
        
        inputStartRange x1 : CGFloat,
        inputStartRange x2 : CGFloat,
        inputStartRange y1 : CGFloat,
        inputStartRange y2 : CGFloat,
        
        value x : CGFloat
        
    )->CGFloat{
        
        let y = y1 + ((y2 - y1) / (x2 - x1) * (x - x1))
        
        return y
        
    }
    
    
}
