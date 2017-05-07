# Project
2016_Mycaffe - Smart Cafe Service

# 설계상 제약 사항
>- 구현부에서 관리자 Web은 Spring- MVC 패턴을 이용하여 구현.
>- 비콘 – 사용자(iOS App) 간 통신 구현은 시뮬레이션으로 대체한다.
>- 2016/10/7 현재, 비콘은 s-RFID 사의 iBeacon을 구입, iBeacon API를 사용하여 구현중.
>- 관리자 Web에서 쿠폰 정보에 관한 정보를 수정 시에 쿠폰이 발급 되어있는 회원 리스트를 한 화면에 보여줄 수 있도록 한다.
>- 쿠폰북 정보는 쿠폰을 소유하는 회원의 정보(닉네임과 전화번호)를 보여줄 수 있도록 한다.
>- 음료 주문 시 선 결제는 결제 모듈 도입 여부를 검토해야하므로 후불 결제만 가능하도록 설정한다.
>- 음료 주문 완료 시 쿠폰이 없는 회원은 자동으로 쿠폰북이 생성되며 사용자가 임의로 입력 또는 수정이 불가능하게 구현.
