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
    @StateObject private var pathModel = PathModel()
    
    var body: some View {
        // TODO: - 화면 전환 구현 필요
        NavigationStack(path: $pathModel.paths) {
            OnboardingContentView(onboardingViewModel: onboardingViewModel)
            //navigaionDestination은 해쉬어블을 채택한 경우만 사용가능하므로 패스타입에 추가함
                .navigationDestination(
                    for: PathType.self) { path in
                        switch path {
                        case .homeView:
                            HomeView()
                                .navigationBarBackButtonHidden()
                        case .memoView:
                            MemoView()
                                .navigationBarBackButtonHidden()
                        case.todoView:
                            TodoView()
                                .navigationBarBackButtonHidden()
                        }
                    }
        }
        //네비게이션 스택에 대해 환경객체 제공
        .environmentObject(pathModel)
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
                .padding(.top, 40)
            
            
            HStack {
                // 중앙 정렬을 위한 스페이서 1
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
                // 중앙 정렬을 위한 스페이서 2
                Spacer()
                
            }
            .background(.white)
            .cornerRadius(0)
            .shadow(radius: 10)
            
        }
        
    }
}

// MARK: - 시작하기 버튼 뷰
private struct StartButtonView: View {
    // 다른 뷰에서 관리하는 곳에 접근하려면 어떻게 할까?
    // 상위 뷰의 정보를 주입받으면 된다
    // 네비게이션 스택처럼 뷰의 전환 전체를 컨트롤하는 경우, environmentObject로 전역으로 컨트롤 하면 된다.
    @EnvironmentObject private var pathModel : PathModel
    fileprivate var body: some View {
        Button {
            pathModel.paths.append(.homeView)
        } label: {
            Text("시작하기 ->")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color.customKeyGreen)
            
        }
        .padding(.bottom, 50)
    }
}
/*
 @EnvironmentObject의 장점
 글로벌 상태 관리:
 @EnvironmentObject는 뷰의 상위에서 설정된 객체를 하위 뷰로 자동적으로 전달할 수 있기 때문에, 뷰 계층 구조에서 여러 뷰가 같은 데이터를 공유해야 할 때 매우 유용합니다.
 예를 들어, OnboardingView에서 StartButtonView가 같은 PathModel 데이터를 참조하고 싶을 때, 일일이 @Binding으로 전달할 필요 없이 @EnvironmentObject로 쉽게 접근할 수 있습니다.
 데이터 전달의 단순화:
 상위 뷰에서 하위 뷰로 데이터를 전달할 때, @Binding을 사용하면 모든 뷰 계층을 통해 데이터를 전달해야 하지만, @EnvironmentObject는 그럴 필요 없이 직접적으로 접근할 수 있습니다. 중간에 있는 뷰들에서 데이터를 전달하는 코드를 작성하지 않아도 됩니다.
 동일한 객체를 여러 뷰에서 사용할 때 편리:
 @EnvironmentObject는 여러 뷰에서 공유해야 하는 데이터 모델에 적합합니다. OnboardingView와 같은 상위 뷰에서 PathModel을 주입하면, 하위 뷰들(예: StartButtonView, OnboardingContentView)에서 해당 데이터를 간편하게 사용할 수 있습니다.
 */

#Preview {
    OnboardingView()
}
