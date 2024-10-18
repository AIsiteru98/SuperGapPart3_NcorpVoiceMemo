//
//  PathType.swift
//  SuperGap_Part3_NcorpMemoApp
//
//  Created by 이재용 on 10/18/24.
//

import Foundation

// 패스에 쌓일 수 있는 경우를 한정하기 위해서 열거형으로 지정
// 네비게이션 스택에는 패스가 쌓이고 패스는 자료형을 타지 않는다고 추정
enum PathType: Hashable {
    case homeView
    case todoView
    case memoView
    
}
