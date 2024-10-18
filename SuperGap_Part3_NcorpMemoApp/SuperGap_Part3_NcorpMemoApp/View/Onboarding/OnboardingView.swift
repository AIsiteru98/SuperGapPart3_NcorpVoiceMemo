//
//  OnboardingView.swift
//  SuperGap_Part3_NcorpMemoApp
//
//  Created by 이재용 on 10/14/24.
//

import SwiftUI

struct OnboardingView: View {
    // StateObjcect를 사용하는 이유
    // 온보딩 뷰 생성시 최초 1회 생성후 라이프사이클 동안 공유됨
    // StateObjcect로 관리되는 객체가 변경될 때마다. 뷰는 새로 랜더링 됨
    @StateObject private var onboardingViewModel: OnboardingViewModel = OnboardingViewModel()
    
    
    var body: some View {
        // TODO: - 화면 전환 구현 필요
        OnboardingContentView(onboardingViewModel: onboardingViewModel)
    }
}

//MARK: - Onboarding Content View
private struct OnboardingContentView: View {
    // observedObject를 사용하는 이유
    // 이미 다른곳에서 관리되는 객체를 관찰하기 위한 것
    // 현재 온보딩뷰에서 뷰모델이 생성되고 관리되므로 새로 생성할 필요 없이 관찰 후
    // 값 변경시 새로 그려지기만 하면 된다.
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    
    // fileprivate 로 설정하는 이유
    // 온보딩컨텐츠뷰는 온보딩에서만 사용되고 다른 곳에서는 사용되지 않음, 따라서 오류 발생을 줄이기 위해 이 파일 내부에서만 활용되도록 함
    // 내 기존 방식은 서브뷰를 따로 생성해서 활용하는데 이 경우 파일이 분산되어 귀찮아지는 단점이 있다. 이 방식이 더 유용한다고 고려됨
    fileprivate init(onboardingViewModel: OnboardingViewModel) {
        self.onboardingViewModel = onboardingViewModel
    }
    fileprivate var body: some View {
        VStack {
            // 온보딩 셀리스트 뷰
            OnboardingCellListView(onboardingViewModel: onboardingViewModel)
            Spacer()
            // 시작 버튼 뷰
            StartButtonView()
        }
    }
}
//MARK: - Onboarding Cell List View
private struct OnboardingCellListView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    @State private var selectedIndex : Int // 태그용
    
    init(onboardingViewModel: OnboardingViewModel,
         selectedIndex: Int = 0) {
        self.onboardingViewModel = onboardingViewModel
        self.selectedIndex = selectedIndex
    }
    
    fileprivate var body: some View {
        TabView(selection: $selectedIndex) {
            // 왜 ForEach의 대상을 Array로 감싸는가?
            // .enumerated()는 Sequence를 반환한다.
            // Sequence는 프로토콜로, 값을 순서대로 1개씩 제공하고 단방향 순회를 한다.
            // 또한 랜덤 엑세스를 할 수 없다.
            // ForEach문은 랜덤 엑세스가 가능해야 하기 때문에 enumerated()로 시퀀스화 된 것을 다시 배열로 변경해 주는 것.
            ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element) { index, element in
                OnboardingCellView(onboardingContent: element)
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
        .background(
            selectedIndex % 2 == 0 ? Color.customBackgroundSky : Color.customBackgroundGreen
        )
        
    }
}

//MARK: - Onboarding Cell View

private struct OnboardingCellView: View {
    private var onboardingContent : OnboardingContent
    
    fileprivate init(onboardingContent: OnboardingContent) {
        self.onboardingContent = onboardingContent
    }
    
    fileprivate var body: some View {
        VStack {
            Image(onboardingContent.imageName)
                .resizable()
                .scaledToFit()
            
            
            HStack {
                Spacer()
                
                VStack {
                    Spacer()
                        .frame(height: 46)
                    
                    Text(onboardingContent.title)
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                        .frame(height: 5)
                    
                    Text(onboardingContent.subtitle)
                        .font(.system(size: 16))
                }
                
                Spacer()
                
            }
            .background(.white)
            .cornerRadius(0)
        }
        .shadow(radius: 10)
    }
}

// MARK: - 시작하기 버튼 뷰
private struct StartButtonView: View {
    fileprivate var body: some View {
        Button {
            print("start")
        } label: {
            Text("시작하기 ->")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color.customKeyGreen)
            
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    OnboardingView()
}
