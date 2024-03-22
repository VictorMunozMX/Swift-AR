//
//  ContentView.swift
//  AR
//
//  Created by Camosun on 2024-03-14.
//

import SwiftUI
import RealityKit
var worldAnchor: Experience.World?

struct ContentView : View {
    
    var body: some View {
        VStack{
            //return ARViewContainer().edgesIgnoringSafeArea(.all)
            ARViewContainer().edgesIgnoringSafeArea(.all)
            
            Button(action: {
                worldAnchor?.notifications.redChair.post()}, label: {
                    Text("Button")
                })
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        worldAnchor = try! Experience.loadWorld()
        
        worldAnchor!.actions.planeWasHit.onAction = { entity in print("Plane was Hit") }
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(worldAnchor!)
        
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
