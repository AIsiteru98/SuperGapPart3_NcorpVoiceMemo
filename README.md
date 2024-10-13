---
title: N사 음성메모앱

---

# N사 음성메모앱 
- 온보딩 화면
- Todo List 화면 구현
- 메모장 화면 구현
- 음성메모 화면 구현
- 타이머 화면 구현
- 설정 화면 구현
- 홈 화면 구현

# 개발 환경
- Target -> iOS16 +
- Xcode -> verion 14+

# 기술스택
1. SwiftUI
2. AVFoundation
3. UserNotifications



# 구현내용



# 학습

## SwiftUI?

> <span style="font-size:150%">특징</span>
> 상태중심 프레임워크
> Xcode 12, iOS 13이상부터 지원
> less code, better code, everywhere

<span style="font-size:150%">장점</span>
- 선언적 구문
- 코드가 간결함
- 뷰 조합을 통한 구현
- 모디파이어 체인징을 통한 편리한 구현
- 프리뷰의 존재


<span style="font-size:150%">단점</span>
- UIKit을 전부 대체하지 못함
- 낮은 버전에서의 버그 발생
- 매 버전마다 변경되는 부분들이 많음

<details>
  <summary>UIKit을 극복 못한 부분</summary>
  SwiftUI가 UIKit을 완전히 대체하지 못하는 기능적인 측면에서의 차이점은 다음과 같습니다:

1. **UIScrollView의 정교한 커스터마이징**:  
   SwiftUI의 `ScrollView`는 기본적인 스크롤 동작만을 지원하며, 스크롤 위치를 세밀하게 제어하거나 페이지 스크롤, 스크롤 이벤트 감지는 UIKit의 `UIScrollView`가 더 강력합니다.

2. **UICollectionView의 복잡한 레이아웃 지원 부족**:  
   SwiftUI의 `LazyVGrid`와 `LazyHGrid`는 단순한 그리드 레이아웃만 지원하지만, UIKit의 `UICollectionView`는 다양한 레이아웃(예: 그리드, 리스트, 카드 레이아웃)을 정교하게 커스터마이징할 수 있습니다.

3. **UITableView의 다양한 기능 부족**:  
   SwiftUI의 `List`는 기본적인 테이블 목록만 제공하지만, UIKit의 `UITableView`는 섹션, 인덱스 바, 셀 슬라이드 동작, 셀 확장/축소, 다중 선택 등의 기능을 더 정교하게 구현할 수 있습니다.

4. **뷰 컨트롤러 라이프사이클**:  
   SwiftUI는 선언형으로 뷰를 관리하지만, UIKit의 `UIViewController`는 뷰 컨트롤러의 생명 주기(예: `viewWillAppear`, `viewDidLoad`)를 세밀하게 제어할 수 있어, 복잡한 상태 관리나 뷰 간의 전환에서 더 많은 유연성을 제공합니다.

5. **애니메이션 제어**:  
   SwiftUI의 애니메이션은 단순하고 직관적이지만, UIKit의 `UIViewPropertyAnimator`나 `Core Animation`을 통해 복잡하고 세밀한 애니메이션 제어가 가능합니다.

6. **UIGestureRecognizer**:  
   SwiftUI는 기본적인 제스처(탭, 스와이프, 드래그 등)를 제공하지만, UIKit의 `UIGestureRecognizer`는 제스처 인식의 세밀한 조정 및 복합 제스처 지원(예: 길게 누르기 후 드래그)을 가능하게 합니다.

7. **Custom Transitions**:  
   SwiftUI는 화면 전환 시 기본적인 애니메이션만 제공하지만, UIKit에서는 커스텀 전환 애니메이션을 정교하게 제어할 수 있어 화면 간의 전환을 더 세밀하게 조작할 수 있습니다.

8. **Alert 및 Action Sheet 커스터마이징**:  
   SwiftUI의 `Alert` 및 `ActionSheet`는 단순한 경고창만 지원하지만, UIKit의 `UIAlertController`는 더 복잡한 사용자 정의가 가능합니다. 예를 들어, 이미지 삽입, 다중 액션 추가 등이 가능합니다.

9. **Split View 및 Multiple Window 지원**:  
   UIKit의 `UISplitViewController`는 iPad에서 두 개 이상의 뷰를 나란히 보여줄 수 있으며, SwiftUI는 이런 복잡한 레이아웃을 완전히 지원하지 못합니다. 또한, UIKit에서는 여러 개의 윈도우를 지원하는 기능이 있지만, SwiftUI는 아직 이 부분에서 제약이 있습니다.

10. **Text Field 커스터마이징**:  
    SwiftUI의 `TextField`는 단순한 텍스트 입력만 지원하는 반면, UIKit의 `UITextField`는 더 복잡한 입력 커스터마이징(입력 필터, 커스텀 키보드, 입력 시 애니메이션 등)이 가능합니다.

11. **Background Task 및 Advanced Multitasking**:  
    SwiftUI는 백그라운드 작업 처리가 간소화되어 있지만, UIKit에서는 백그라운드 작업을 세밀하게 제어할 수 있는 `URLSession`, `Background Fetch`, `Background App Refresh` 등의 기능을 제공합니다.

12. **캘린더 및 날짜 선택 커스터마이징**:  
    SwiftUI의 `DatePicker`는 단순한 날짜 및 시간 선택만 가능하지만, UIKit의 `UIDatePicker`는 모드, 지역화, 시간대 등 다양한 옵션을 더 세밀하게 제어할 수 있습니다.

13. **Camera 및 Media 기능 제어**:  
    SwiftUI는 기본적인 미디어 기능만 지원하는 반면, UIKit은 `UIImagePickerController` 등을 통해 카메라, 사진 라이브러리, 비디오 녹화 등을 더 세밀하게 제어할 수 있습니다.

14. **상태 관리와 데이터 흐름 제어**:  
    SwiftUI는 `@State`, `@Binding`, `@Environment`와 같은 방식으로 상태를 관리하지만, UIKit에서는 뷰 컨트롤러 간의 데이터 전달, 상태 보존 및 복구, 사용자 정의 상태 관리가 더 유연하게 가능합니다.

이처럼 SwiftUI는 간단한 UI 구성에 적합하지만, 복잡한 사용자 정의나 세밀한 제어가 필요한 기능에서는 아직 UIKit이 더 적합한 경우가 많습니다.
</details>


<span style="font-size:150%">상태?</span>
상태란 데이터의 스냅샷이다.
@State나 @Published등 동적 지정된 프로퍼티의 값이 변경되면 해당 프로퍼티와 연결된 뷰를 새로 그려주는 것

## SwiftUI의 View Layout 결정 원리
![image](https://hackmd.io/_uploads/H1ZQhfKyJx.png)


레이아웃 중립 -> 크기가 정해지지 않고, 하위 뷰의 크기에 따라 결정됨

- 루트 뷰
> 최상위 뷰로, 부모 뷰로부터 공간을 받음
> 레이아웃 중립적일 수 있으나, 시스템에 의해 초기 크기가 결정됨
> 하위 뷰에게 공간 할당을 위임하고, 하위 뷰의 크기에 따라 자신의 크기도 결정됨

- 콘텐츠 뷰
> 레이아웃 중립
> body에 정의된 하위 뷰들의 레이아웃에 따라 크기가 결정됨
> 하위 뷰에 공간 제안을 하고, 하위 뷰의 크기에 맞추어 자신의 크기를 조정함

- 백그라운드
> 크기는 백그라운드를 적용한 뷰의 크기에 맞춰짐
> 자체적으로 레이아웃을 결정하지 않으며, 상위 뷰의 크기에 맞춰 렌더링됨
> 패딩이 적용된 경우, 패딩 크기를 포함한 영역을 백그라운드로 지정

- 패딩
> 지정된 패딩 값만큼 크기가 증가
> 상위 뷰로부터 제안받은 공간을 하위 뷰로 전달할 때, 패딩 크기를 포함해 하위 뷰에 제안됨
> ex) 텍스트 크기에 20의 패딩을 추가하여 상위 뷰에게 반환

- 텍스트
> 주어진 사용 가능 공간에서 자신의 텍스트 내용에 맞춰 크기를 결정
> 별도의 지정이 없으면 텍스트 크기에 맞춰 중앙에 배치됨
> 추가적인 frame이나 alignment 옵션을 통해 크기와 위치를 조정할 수 있음
 
 
 # MVVM


 