//
//  OVSubView1.swift
//  SuperGap_Part3_NcorpMemoApp
//
//  Created by 이재용 on 10/14/24.
//

import SwiftUI

struct OVSubView1: View {
    var body: some View {
        ZStack {
            Image("Onboarding_To do list-edit")
                .border(.red)
            Rectangle()
                .foregroundStyle(.blue)
                .frame(width: 100, height: 100,alignment: .bottom)
            // check, 뷰의 위치를 조정하는법
        }
    }
}

#Preview {
    OVSubView1()
}
