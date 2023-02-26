//
//  LoteriaView.swift
//  Loteria
//
//  Created by Roberto Filho on 24/02/23.
//

import SwiftUI

struct LoteriaView: View {
    @ObservedObject var viewModel: LoteriaViewModel
    var body: some View {
        ScrollView(showsIndicators: false){
            Group {
                VStack(alignment: .leading, spacing: 0, content: {
                    ZStack {
                        Image("top")
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(contentMode: .fill)
                        Text("Mega-Sena")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .font(.title.bold())
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                    }
                    gameType
                    if viewModel.action == 1 {
                        HStack{
                            ZStack(alignment: .center){
                                Circle()
                                .stroke(Color.blue)
                                    .foregroundColor(.white)
                                    .background()
                                Text(String(viewModel.megaSena[0]))
                            }
                            ZStack(alignment: .center){
                                Circle()
                                .stroke(Color.blue)
                                    .foregroundColor(.white)
                                    .background()
                                Text(String(viewModel.megaSena[1]))
                            }
                            ZStack(alignment: .center){
                                Circle()
                                .stroke(Color.blue)
                                    .foregroundColor(.white)
                                    .background()
                                Text(String(viewModel.megaSena[2]))
                            }
                        }
                        .frame(width: .infinity, height: 50,alignment: .center)
                        Spacer()
                        
                        HStack{
                            ZStack(alignment: .center){
                                Circle()
                                .stroke(Color.blue)
                                    .background()
                                Text(String(viewModel.megaSena[3]))
                            }
                            ZStack(alignment: .center){
                                Circle()
                                .stroke(Color.blue)
                                    .foregroundColor(.white)
                                    .background()
                                Text(String(viewModel.megaSena[4]))
                            }
                            if viewModel.gametype.rawValue == "Mega-Sena"{
                                ZStack(alignment: .center){
                                    Circle()
                                    .stroke(Color.blue)
                                        .foregroundColor(.white)
                                        .background()
                                    Text(String(viewModel.megaSena[5]))
                                }
                            }
                            
                        }
                        .frame(width: .infinity, height: 50,alignment: .center)
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    HStack {
                        Button("Gerar Jogo") {
                            viewModel.generateGame()
                        }
                        .foregroundColor(.white)
                        .font(.title.bold())
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                    }
                    .frame(alignment: .bottom)
                    
                })
            }
        }
        
    }
}

extension LoteriaView {
    var gameType: some View {
        Picker("GameType", selection: $viewModel.gametype) {
            ForEach(GameType.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
                
            }
        }.pickerStyle(SegmentedPickerStyle())
            .padding(.top, 16)
            .padding(.bottom, 32)
    }
}

struct LoteriaView_Previews: PreviewProvider {
    static var previews: some View {
        LoteriaView(viewModel: LoteriaViewModel())
    }
}
