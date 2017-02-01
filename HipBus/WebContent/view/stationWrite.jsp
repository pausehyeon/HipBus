<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>

<title>HipBus</title>
<body>

	<c:import url="../top.do"/>
	<%@ include file="navbar_station.jsp"%>
	
	<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
	<div class="w3-main " style="margin-right: 20%; margin-left: 20%">
		<div class="w3-row w3-container" style="margin-top: 64px">
			<h3>글쓰기</h3>
			<hr>
		</div>
		<div class="w3-row">
			<div class="w3-container">
				<form name="writeform" method="post">
					<div class="w3-card-4">
						<header class="w3-container w3-padding-jumbo w3-theme-l3">
							<select class="w3-left" name="category" style="margin:2px">
							    <option value="">전체보기</option>
							    <option value="비트">비트</option>
							    <option value="랩">랩</option>
							    <option value="믹스테잎">믹스테잎</option>
							    <option value="보컬">보컬</option>
							    <option value="가사">가사</option>
							    <option value="잡담">잡담</option>
							</select>
							<input class="w3-input" type="text" required> <label
								class="w3-label w3-validate">글제목</label> <a href="#"
								class="w3-btn w3-padding w3-theme-d1 w3-margin w3-right"><i
								class="fa fa-image w3-margin-right"></i>이미지 첨부</a>
						</header>

						<div class="w3-container w3-padding-32 w3-padding-jumbo">
							<textarea class="w3-input" rows="15"></textarea>
						</div>

						<footer
							class="w3-container w3-padding-jumbo w3-theme-l3 w3-center">
							<input type="submit"
								class="w3-btn w3-padding w3-theme-d1 w3-margin-left"
								value="작성완료"> <a href="#"
								class="w3-btn w3-padding w3-theme-d1 w3-margin-left"><i
								class="fa fa-mail-reply w3-margin-right"></i>작성취소</a>
						</footer>
					</div>
				</form>
			</div>
		</div>

		<!-- END MAIN -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do"/>


</body>
</html>
