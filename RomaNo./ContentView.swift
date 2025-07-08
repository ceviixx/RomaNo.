//
//  ContentView.swift
//  RomaNo.
//
//  Created by ceviixx on 19.04.22.
//

import SwiftUI
import TipKit
import UniformTypeIdentifiers

struct ContentView: View {
    
    @State private var date = Date()

    let dateFormatterDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    
    let dateFormatterMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M"
        return formatter
    }()
    
    let dateFormatterYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    
    @State var displayHowWorksView: Bool = false
    
    @State private var isCopied: Bool = false
    
    let romanFont = "TimesNewRomanPS-BoldMT"
    
    let cautionTip = CautionTip()
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                LinearGradient(colors: [Color.secondary], startPoint: .topLeading, endPoint: .bottomTrailing)
                    // .cornerRadius(35)
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(bottomLeading: 35, bottomTrailing: 35)))
                    .ignoresSafeArea()
                    .opacity(0.6)
                
                // TimesNewRomanPSMT
                // TimesNewRomanPS-BoldMT
                ZStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .lastTextBaseline) {
                            Text("Day")
                                .frame(width: 60, alignment: .trailing)
                                .foregroundColor(.secondary)
                            Text(getRome(Int(dateFormatterDay.string(from: date))!))
                                .font(.custom(romanFont, fixedSize: 36))
                        }
                        HStack(alignment: .lastTextBaseline) {
                            Text("Month")
                                .frame(width: 60, alignment: .trailing)
                                .foregroundColor(.secondary)
                            Text(getRome(Int(dateFormatterMonth.string(from: date))!))
                                .font(.custom(romanFont, fixedSize: 36))
                        }
                        HStack(alignment: .lastTextBaseline) {
                            Text("Year")
                                .frame(width: 60, alignment: .trailing)
                                .foregroundColor(.secondary)
                            Text(getRome(Int(dateFormatterYear.string(from: date))!))
                                .font(.custom(romanFont, fixedSize: 36))
                        }
                    }
                    TipView(cautionTip)
                        
                }
                .padding([.leading, .trailing], 20)
                
            }
            .onTapGesture(count: 2, perform: {
                var copyString = ""
                copyString.append( getRome(Int(dateFormatterDay.string(from: date))!) )
                copyString.append(".")
                copyString.append( getRome(Int(dateFormatterMonth.string(from: date))!) )
                copyString.append(".")
                copyString.append( getRome(Int(dateFormatterYear.string(from: date))!) )
                
                let clipboard = UIPasteboard.general
                clipboard.setValue(copyString, forPasteboardType: UTType.plainText.identifier)
                withAnimation {
                    isCopied = true
                }
                DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.5) {
                    withAnimation {
                        isCopied = false
                    }
                }
                
            })
            .overlay(alignment: .top) {
                if isCopied {
                    Text("Copied successfully!")
                        .foregroundColor(.white)
                        .bold()
                        .font(.footnote)
                        .frame(width: 150, height: 30)
                        .background(Color.secondary.opacity(0.3).cornerRadius(7))
                        .padding(.top)
                }
            }
            .overlay(alignment: .bottomTrailing) {
                HStack {
                    Button(action: {
                        displayHowWorksView.toggle()
                    }, label: {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.title)
                            .foregroundStyle(Color(uiColor: .systemBackground))
                    })
                    .padding()
                }
            }
            .overlay(alignment: .topTrailing) {
                /*
                Button(action: {
                    displayFeedbackView.toggle()
                }, label: {
                    Image(systemName: "exclamationmark.bubble")
                        .font(.title3)
                        .foregroundStyle(Color(uiColor: .systemBackground))
                })
                .padding()
                */
            }
            .padding(.bottom, 60)
            
            
            DatePicker("label:select-date", selection: $date, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 250)
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 15)
                .accentColor(.secondary)
            
        }
        .sheet(isPresented: $displayHowWorksView, content: {
            HowToView(date: date)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        })
        .onAppear {
            Task {
                try? Tips.resetDatastore()
                try? Tips.configure()
            }
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
