//
//  OnboardingViewModel.swift
//  SuperGap_Part3_NcorpMemoApp
//
//  Created by 이재용 on 10/17/24.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    let onboardingContents: [OnboardingContent] = [
        OnboardingContent(title: "오늘의 할일", subtitle: "To do list로 언제 어디서든 해야할 일을 한눈에", imageName: "Onboarding_To do list-edit"),
        OnboardingContent(title: "똑똑한 나만의 기록장", subtitle: "메모장으로 생각나는 기록은 언제든지", imageName: "Onboarding_Memo-v1-디폴트"),
        OnboardingContent(title: "하나라도 놓치지 않도록", subtitle: "음성메모 기능으로 놓치고 싶지않은 기록까지", imageName: "Onboarding_Memo-v2-dropdown"),
        OnboardingContent(title: "정확한 시간의 경과", subtitle: "타이머 기능으로 원하는 시간을 확인", imageName: "Onboarding_Timer-1")
        ]

    
}

