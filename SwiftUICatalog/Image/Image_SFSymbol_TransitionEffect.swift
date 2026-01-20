//
//  Image_SFsymbol_TransitionEffect.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/20/26.
//

import SwiftUI

struct Image_SFSymbol_TransitionEffect: View {

    @State private var isShown: Bool = false
    @State private var replace: Bool = false
    @State private var variableValue: Double = 0.0

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 24) {
                Text("Updates on SF Symbol 7")
                    .fontWeight(.bold)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .center)

                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 2)


                VStack(alignment: .leading) {
                    Button(action: {
                        isShown.toggle()
                    }, label: {
                        Text("Draw")
                    })
                    .buttonBorderShape(.roundedRectangle(radius: 8))
                    .buttonStyle(.bordered)


                    Text("Draw On")
                        .font(.headline)

                    HStack(spacing: 16) {
                        VStack {
                            Text("Default")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOn, options: .speed(1.0)))
                            }
                        }
                        VStack {
                            Text("byLayer")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOn.byLayer))
                            }
                        }
                        VStack {
                            Text("individually")
                                .font(.subheadline)
                            if isShown {

                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOn.individually))
                            }
                        }
                        VStack {
                            Text("wholeSymbol")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOn.wholeSymbol))
                            }
                        }

                    }
                    .frame(height: 84, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .leading)


                    Divider()

                    Text("Draw Off")
                        .font(.headline)


                    HStack(spacing: 16) {
                        VStack {
                            Text("Default")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOff))
                            }
                        }
                        VStack {
                            Text("byLayer")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOff.byLayer))
                            }
                        }
                        VStack {
                            Text("individually")
                                .font(.subheadline)
                            if isShown {

                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOff.individually))
                            }
                        }
                        VStack {
                            Text("wholeSymbol")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOff.wholeSymbol))
                            }
                        }

                    }
                    .frame(height: 84, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Text("**NOTE**: For Playback Options `nonReversed` and `reversed`, we can combine those with other ones: `byLayer`, `individually`, and `wholeSymbol`.")
                        .font(.caption)
                        .fixedSize(horizontal: false, vertical: true)


                    HStack(spacing: 16) {
                        VStack {
                            Text("nonReversed")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOff.nonReversed))
                            }
                        }
                        VStack {
                            Text("nonReversed + individually")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOff.nonReversed.individually))
                            }
                        }

                        VStack {
                            Text("reversed")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOff.reversed))
                            }
                        }

                        VStack {
                            Text("nonReversed + individually")
                                .font(.subheadline)
                            if isShown {
                                _Image(systemName: "pencil.and.scribble")
                                    .transition(.symbolEffect(.drawOff.reversed.individually))
                            }
                        }

                    }
                    .frame(height: 84, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .leading)



                }


                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 2)


                VStack(alignment: .leading) {
                    Text("SymbolVariableValueMode")
                        .font(.headline)

                    Slider(
                        value: $variableValue,
                        in: 0...1,
                        label: {}, minimumValueLabel: {
                        Text("0")
                    }, maximumValueLabel: {
                        Text("100%")
                    })


                    HStack(spacing: 16) {
                        VStack {
                            Text("Color")
                                .font(.subheadline)

                            Image(systemName: "dot.radiowaves.left.and.right", variableValue: variableValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 32)
                                .symbolVariableValueMode(.color)
                        }

                        VStack {
                            Text("Draw")
                                .font(.subheadline)

                            Image(systemName: "thermometer.high", variableValue: variableValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 32)
                                .symbolVariableValueMode(.draw)

                        }
                    }

                }

                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 2)


                VStack(alignment: .leading) {
                    Text("SymbolColorRenderingMode")
                        .font(.headline)


                    HStack(spacing: 16) {
                        VStack {
                            Text("flat")
                                .font(.subheadline)

                            _Image(systemName: "folder.circle.fill")
                                .symbolRenderingMode(.multicolor)
                                .symbolColorRenderingMode(.flat)

                        }

                        VStack {
                            Text("gradient")
                                .font(.subheadline)

                            _Image(systemName: "folder.circle.fill")
                                .symbolRenderingMode(.multicolor)
                                .symbolColorRenderingMode(.gradient)

                        }
                    }

                }
               .frame(maxWidth: .infinity, alignment: .leading)


                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 2)


                VStack(alignment: .leading) {
                    Text("Enhanced Magic Replace")
                        .font(.headline)

                    Text("**NOTE**: `magic` replace is the default option, so we don't have to chain up the function explicitly. ")
                        .font(.caption)
                        .fixedSize(horizontal: false, vertical: true)


                    HStack(spacing: 16) {
                        Button(action: {
                            replace.toggle()
                        }, label: {
                            Text("Replace")
                        })
                        .buttonBorderShape(.roundedRectangle(radius: 8))
                        .buttonStyle(.bordered)


                        _Image(systemName: replace ? "checkmark.circle" : "circle")
                            .contentTransition(.symbolEffect(.replace.magic(fallback: .replace)))
                    }

                }
                .frame(maxWidth: .infinity, alignment: .leading)


            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .padding(.bottom, 64)

        }
        .background(.yellow.opacity(0.1))

    }


    private func _Image(systemName: String) -> some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: 32)

    }

}

#Preview {
    Image_SFSymbol_TransitionEffect()
}
