//
//  Constants.swift
//  SuperGap_Part3_NcorpMemoApp
//
//  Created by 이재용 on 10/17/24.
//

import Foundation

// use on Onboarding SubView
struct OnboardingContent : Hashable {
    // Hashable 채택이유 : TabView에서 사용하기 때문
    /*
     hashable 은 두 객체가 동일한 지 여부를 확인함
     동일성 확인을 위해 Hashable은 Equatable 프로토콜을 채택하여 ==로 비교연산을 가능토록 함
     
     탭뷰에서 해쉬블이 필요한 이유
     1. 고유 식별
        탭 뷰는 탭 간 전환시 데이터를 명확히 구분할 수 있어야 함
    2. 상태 비교
        해쉬블을 준수하는 객체는 해시 값을 통해 빠르게 비교할 수 있다. 탭뷰가 화면을 업뎃하거나 상태관리 시, 탭의 데이터를 해시 값을 통해 비교함으로써, 어떤 탭이 활성화 되었는지, 어떤 탭이 이전 상태였는 지 빠르게 알아냄
     3. 탭뷰의 선택 상태 관리
        탭 뷰는 태그를 통해 선택된 탭을 추적함.
     */
    let title: String
    let subtitle: String
    let imageName: String
    
    init(title: String, subtitle: String, imageName: String) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
    }
}

