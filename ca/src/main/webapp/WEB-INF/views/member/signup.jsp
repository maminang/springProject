<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
</head>
<body>


<!-- header -->

 <jsp:include page="../header.jsp" />
       
<!-- body -->
        <div class="container">
<!-- modal -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
<!--// modal -->
 
        <form name="frm" id="frm" class="form-horizontal" role="form" method="post" action="/member/signup">
            <div class="form-group">
 <!-- Terms of Service -->
                <label for="provision" class="col-lg-2 control-label">회원가입약관</label>
                <div class="col-lg-10" id="provision">
                    <textarea class="form-control" rows="8" style="resize:none">

제1조(목적)
이 약관은  회사(전자상거래 사업자)가 운영하는 DEmoNeyo(이하 “DEmoNeyo”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 DEmoNeyo과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

제2조(정의)
① “DEmoNeyo”이란  회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버DEmoNeyo을 운영하는 사업자의 의미로도 사용합니다.

② “이용자”란 “DEmoNeyo”에 접속하여 이 약관에 따라 “DEmoNeyo”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

③ ‘회원’이라 함은 “DEmoNeyo”에 회원등록을 한 자로서, 계속적으로 “DEmoNeyo”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

④ ‘비회원’이라 함은 회원에 가입하지 않고 “DEmoNeyo”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정) 
① “DEmoNeyo”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자 등을 이용자가 쉽게 알 수 있도록  사이버DEmoNeyo의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

② “DEmoNeyo은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.

③ “DEmoNeyo”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

④ “DEmoNeyo”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 DEmoNeyo의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "DEmoNeyo“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 

⑤ “DEmoNeyo”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “DEmoNeyo”에 송신하여 “DEmoNeyo”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경) 
① “DEmoNeyo”은 다음과 같은 업무를 수행합니다.
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 “DEmoNeyo”이 정하는 업무

② “DEmoNeyo”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.

③ “DEmoNeyo”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.

④ 전항의 경우 “DEmoNeyo”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “DEmoNeyo”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단) 
① “DEmoNeyo”은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.

② “DEmoNeyo”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “DEmoNeyo”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “DEmoNeyo”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “DEmoNeyo”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “DEmoNeyo”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “DEmoNeyo”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.

제6조(회원가입) 
① 이용자는 “DEmoNeyo”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.

② “DEmoNeyo”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “DEmoNeyo”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 “DEmoNeyo”의 기술상 현저히 지장이 있다고 판단되는 경우

③ 회원가입계약의 성립 시기는 “DEmoNeyo”의 승낙이 회원에게 도달한 시점으로 합니다.

④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “DEmoNeyo”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.

제7조(회원 탈퇴 및 자격 상실 등) 
① 회원은 “DEmoNeyo”에 언제든지 탈퇴를 요청할 수 있으며 “DEmoNeyo”은 즉시 회원탈퇴를 처리합니다.

② 회원이 다음 각 호의 사유에 해당하는 경우, “DEmoNeyo”은 회원자격을 제한 및 정지시킬 수 있습니다.
1. 가입 신청 시에 허위 내용을 등록한 경우
2. “DEmoNeyo”을 이용하여 구입한 재화 등의 대금, 기타 “DEmoNeyo”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3. 다른 사람의 “DEmoNeyo” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
4. “DEmoNeyo”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

③ “DEmoNeyo”이 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “DEmoNeyo”은 회원자격을 상실시킬 수 있습니다.

④ “DEmoNeyo”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

본 약관은 가입일일부터 적용됩니다.
 </textarea>
                    <div class="radio">
                        <label>
                            <input type="radio" id="provisionYn" name="provisionYn" value="Y" autofocus="autofocus" checked>
                         	   동의합니다.
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" id="provisionYn" name="provisionYn" value="N">
                   	         동의하지 않습니다.
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="memberInfo" class="col-lg-2 control-label">개인정보취급방침</label>
                <div class="col-lg-10" id="memberInfo">
                    <textarea class="form-control" rows="8" style="resize:none">
DEmoNeyo 주식회사(이하 ‘회사’)는 다음과 같은 원칙에 의하여 이용자의 개인정보를 수집, 이용 및 관리하고 있고, 이와 관련하여 정보통신서비스 제공자가 준수하여야 하는 대한민국의 관계법령 및 개인정보보호 규정, 가이드라인을 준수하고 있습니다.

회사는 개인정보 처리방침을 통하여, 이용자의 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 회사가 어떠한 조치를 취하는지 알려드립니다.
회사의 개인정보 처리방침은 다음과 같은 내용을 담고 있습니다.

1. 개인정보의 수집 및 이용 목적
2. 수집하는 개인정보 항목 및 방법
3. 개인정보 보유ㆍ이용기간 및 파기절차 및 방법
4. 개인정보의 제공
5. 개인정보의 처리위탁
6. 이용자 및 법정대리인의 권리와 그 행사방법
7. 개인정보 자동수집 장치의 설치ㆍ운영 및 그 거부에 관한 사항
8. 개인정보의 기술적/관리적 보호대책
9. 개인정보 전담조직 운영
10. 기타 개인정보 처리에 관한 방침
11. 고지의무


1. 개인정보의 수집 및 이용 목적
회사는 다음의 목적을 위하여 개인정보를 수집 및 이용합니다.
가. 회원관리
이용자 식별 및 본인확인, 가입의사 확인, 불량회원 부정이용 방지, 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리, 공지사항 전달, 회원탈퇴 의사확인, 법정대리인 권리행사 시 본인확인
나. 서비스 이용 및 이용에 따른 요금정산
콘텐츠 제공, 구매 및 요금결제, 물품배송 또는 청구서 발송, 요금추심
다. 마케팅 및 광고활용
신규 서비스 개발 및 특화, 이벤트 등 광고성 정보전달, 인구통계학적 특성에 따른 서비스 제공 및 광고게재, 접속 빈도파악 또는 회원의 서비스 이용 통계
라. 기타
서비스 유효성 확인, 원활한 양질의 서비스 및 교육 콘텐츠 제공

2. 수집하는 개인정보 항목 및 방법
회사는 위 제1항과 같은 ‘개인정보의 수집 및 이용목적’을 위하여 아래와 같은 원칙에 의하여 개인정보를 수집하고 있습니다.
가. 개인정보 수집항목
해당 서비스의 본질적 기능을 수행하기 위한 정보는 필수정보로서 수집하며 이용자가 그 정보를 회사에 제공하지 않는 경우 서비스 이용에 제한이 가해질 수 있지만, 선택정보 즉, 보다 특화된 서비스를 제공하기 위해 추가 수집되는 정보의 경우에는 이를 입력하지 않은 경우에도 서비스 이용제한은 없습니다.
서비스 이용에 따라 다음과 같은 정보를 수집합니다.
<회원가입 시 공통정보> 이름, 로그인ID, 비밀번호, 휴대전화번호, 생년월일, 성별, 이메일, 접속로그, 접속IP정보
<서비스 이용 시> 본인확인 값(CI: 암호화된 개인식별정보, DI: 중복확인정보), 결제기록, 계좌번호, 연락처
<서비스 환불 시> 계좌정보 (거래은행명, 계좌번호, 거래자 성명)
<사업자회원 추가정보> 사업자등록번호, 상호명, 대표자명, 사업장소재지, 업태, 종목, 사업장 전화번호, 사업장 팩스번호, 사업자 인증정보(사업자등록증 사본, 동업계약서 사본)
<리셀러 회원> 주민등록번호(수당 지급을 위한 원천징수 영수증 발급용도)

다만, 이용자의 사상, 신념, 과거의 병력 등 개인의 권리, 이익이나 사생활을 뚜렷하게 침해할 우려가 있는 민감정보는 수집하지 않습니다.
나. 수집 방법
회사가 이용자의 개인정보를 수집하는 방법으로는 홈페이지(회원가입, 상담게시판), 서면양식, 경품 행사 응모, 제휴사로부터의 제공, 생성정보 수집 툴 등을 통해 수집합니다.
다. 이용자의 동의
회사는 이용자의 개인정보를 수집할 때, 위 수집항목의 내용을 변경할 때 사전에 해당 사실을 이용자에게 알리고 동의를 구합니다.

다만, 이용자가 요구하는 서비스를 제공하는 과정에서 이를 이행하기 위하여 필요한 개인정보로서 경제적, 기술적 사유로 통상적인 동의를 받는 것이 뚜렷하게 곤란한 경우, 서비스 제공에 따른 요금정산을 위하여 필요한 경우, 기타 정보통신망법 또는 다른 법률에 특별한 규정이 있는 경우에는 동의를 받지 않고 이용자의 개인정보를 수집할 수 있습니다.
                    
                    </textarea>
                    <div class="radio">
                        <label>
                            <input type="radio" id="memberInfoYn" name="memberInfoYn" value="Y" checked>
                         	동의합니다.
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                         <input type="radio" id="memberInfoYn" name="memberInfoYn" value="N">
                       	 동의하지 않습니다.
                        </label>
                    </div>
                </div>
            </div>
            
 <!-- Privacy -->
            <div class="form-group" id="divId">
                <label for="inputId" class="col-lg-2 control-label">아이디</label>
                <div class="col-lg-10 input-group">
                    <input name="id" type="text" class="form-control onlyAlphabetAndNumber" id="id" data-rule-required="true" placeholder="10자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="10">
			<span class="input-group-btn">
				<button type="button"id="idcheck" class="btn btn-info">ID 중복 체크</button>
			</span>
                </div>
            </div>

            <div class="form-group" id="divPassword">
                <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="password" name="pw" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divPasswordCheck">
                <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divName">
                <label for="inputName" class="col-lg-2 control-label">이름</label>
                <div class="col-lg-10">
                    <input name="name" type="text" class="form-control onlyHangul" id="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                </div>
            </div>
                         
            <div class="form-group" id="divEmail">
                <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                <div class="col-lg-10">
                    <input name="email" type="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="40">
                </div>
            </div>
            
            <div class="form-group" id="divAddress">
                <label for="divAddress" class="col-lg-2 control-label">주소</label>
                <input name="postNum" type="text" id="postNum" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input name="address" type="text" id="address" placeholder="주소"><br>
				<input name="DTL_ADRES" type="text" id="DTL_ADRES" placeholder="상세주소"><br>
            </div>
            
            <div class="form-group" id="divBirth">
                <label for="divBirth" class="col-lg-2 control-label">생년월일</label>
                <div class="col-lg-10">
                    <input name="birth" type="date" class="form-control onlyNumber" id="divBirth" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                </div>
            </div>
            
            <div class="form-group" id="divPhoneNumber">
                <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                <div class="col-lg-10">
                    <input name="phone" type="tel" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmailReceiveYn" class="col-lg-2 control-label">이메일 수신여부</label>
                <div class="col-lg-10">
                    <label class="radio-inline">
                        <input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="Y" checked> 동의합니다.
                    </label>
                    <label class="radio-inline">
                        <input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="N"> 동의하지 않습니다.
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPhoneNumber" class="col-lg-2 control-label">SMS 수신여부</label>
                <div class="col-lg-10">
                    <label class="radio-inline">
                        <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="Y" checked> 동의합니다.
                    </label>
                    <label class="radio-inline">
                        <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지 않습니다.
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" class="btn btn-default">Sign in</button>
                </div>
            </div>
        </form>
         
<!-- script -->     
        <script type="text/javascript">
         
//address search
        function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("DTL_ADRES").value = extraAddr;
                
                } else {
                    document.getElementById("DTL_ADRES").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postNum").value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("DTL_ADRES").focus();
            }
        }).open();
    }
    
 //modal       
            $(document).ready(function(){
            	
            	
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
                //id 체크에 사용할 변수
                var idck = 0;
                $('.onlyAlphabetAndNumber').keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                    }
                });
                 
                $(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
             
                $(".onlyNumber").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                });
                 
//------- 검사하여 상태를 class에 적용
                $('#id').keyup(function(event){
                     
                    var divId = $('#divId');
                     
                    if($('#id').val()==""){
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                    }else{
                        divId.removeClass("has-error");
                        divId.addClass("has-success");
                    }
                });
                 
                $('#password').keyup(function(event){
                     
                    var divPassword = $('#divPassword');
                     
                    if($('#password').val()==""){
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                });
                 
                $('#passwordCheck').keyup(function(event){
                     
                    var passwordCheck = $('#passwordCheck').val();
                    var password = $('#password').val();
                    var divPasswordCheck = $('#divPasswordCheck');
                     
                    if((passwordCheck=="") || (password!=passwordCheck)){
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                });
                 
                $('#name').keyup(function(event){
                     
                    var divName = $('#divName');
                     
                    if($.trim($('#name').val())==""){
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                });
                 
                $('#nickname').keyup(function(event){
                     
                    var divNickname = $('#divNickname');
                     
                    if($.trim($('#nickname').val())==""){
                        divNickname.removeClass("has-success");
                        divNickname.addClass("has-error");
                    }else{
                        divNickname.removeClass("has-error");
                        divNickname.addClass("has-success");
                    }
                });
                 
                $('#email').keyup(function(event){
                     
                    var divEmail = $('#divEmail');
                     
                    if($.trim($('#email').val())==""){
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                });
                 
                $('#phoneNumber').keyup(function(event){
                     
                    var divPhoneNumber = $('#divPhoneNumber');
                     
                    if($.trim($('#phoneNumber').val())==""){
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
                 
                 
//------- validation
                $( "form" ).submit(function( event ) {
                     
                    var provision = $('#provision');
                    var memberInfo = $('#memberInfo');
                    var divId = $('#divId');
                    var divPassword = $('#divPassword');
                    var divPasswordCheck = $('#divPasswordCheck');
                    var divName = $('#divName');
                    var divNickname = $('#divNickname');
                    var divEmail = $('#divEmail');
                    var divPhoneNumber = $('#divPhoneNumber');
                     
                    //회원가입약관
                    if($('#provisionYn:checked').val()=="N"){
                        modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
                        modal.modal('show'); //모달 띄우기
                         
                        provision.removeClass("has-success");
                        provision.addClass("has-error");
                        $('#provisionYn').focus();
                        return false;
                    }else{
                        provision.removeClass("has-error");
                        provision.addClass("has-success");
                    }
                     
                    //개인정보취급방침
                    if($('#memberInfoYn:checked').val()=="N"){
                        modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        memberInfo.removeClass("has-success");
                        memberInfo.addClass("has-error");
                        $('#memberInfoYn').focus();
                        return false;
                    }else{
                        memberInfo.removeClass("has-error");
                        memberInfo.addClass("has-success");
                    }
                     
                    //아이디 검사
                    if($('#id').val()==""){
                        modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                        $('#id').focus();
                        return false;
                    }else{
                        divId.removeClass("has-error");
                        divId.addClass("has-success");
                    }
                    
					//아이디 중복 확인 
                    if(idck==0){
                    	alert('아이디 중복체크를 해주세요');
                    	return false;
                    }
                 	
                    //패스워드 검사
                    if($('#password').val()==""){
                        modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                        $('#password').focus();
                        return false;
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                     
                    //패스워드 확인
                    if($('#passwordCheck').val()==""){
                        modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#passwordCheck').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                     
                    //패스워드 비교
                    if($('#password').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                        modalContents.text("패스워드가 일치하지 않습니다.");
                        modal.modal('show');
                         
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#passwordCheck').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                     
                    //이름
                    if($('#name').val()==""){
                        modalContents.text("이름을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                        $('#name').focus();
                        return false;
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                  
                    //이메일
                    if($('#email').val()==""){
                        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                        $('#email').focus();
                        return false;
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                     
                    //휴대폰 번호
                    if($('#phoneNumber').val()==""){
                        modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $('#phoneNumber').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
                
//ID Duplicate check
                $("#idcheck").click(function(event) {

                	var id =  $("#id").val(); 
                    
                    $.ajax({
                        async: true,
                        type : 'POST',
                        data : id,
                        url : "/member/idcheck",
                        dataType : "json",
                        contentType: "application/json; charset=UTF-8",
                        success : function(data) {
                        	//휴대폰 번호
                            if(data.cnt > 0){
                                modalContents.text("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                                modal.modal('show');
                                 
                                $("#id").focus();
                            }else{
                            	modalContents.text("사용가능한 아이디입니다.");
                            	modal.modal('show');
                                $("#pw").focus();
                                //아이디가 중복하지 않으면  idck = 1 
                                idck = 1;
                            }
                        	
                        }
                    })
                });
                
                // var idck reset
                $("#id").change(function() {
					idck = 0;
				})
            });
            
            
            
        </script>
        </div>
 <!-- :::::::::::::::::::::::::::::::::::: 푸터 :::::::::::::::::::::::::::::::::::::: -->
        <jsp:include page="../footer.jsp" />

	

	

 </body>
</html>