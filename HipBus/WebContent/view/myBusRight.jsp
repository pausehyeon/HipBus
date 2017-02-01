<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<!-- Right Column -->
<div class="w3-col m2">
	<div class="w3-card-2 w3-round w3-white w3-center">
		<div class="w3-container">
			<div class="w3-right w3-padding-16">
				<button type="button" class="w3-btn w3-theme-l1">
					<i class="fa fa-pencil"></i>&nbsp; Edit
				</button>
			</div>
			<img src="${project}/view/img/notice1.png" alt="some image"
				style="width: 100%;">
			<p>
				<strong>Seoul soul Festival 2016</strong>
			</p>
			<p>토요일 15:00</p>
			<p>
				<button class="w3-btn w3-btn-block w3-theme-l1">자세히</button>
			</p>
		</div>
	</div>
	<br>

	<div class="w3-card-2 w3-round w3-white w3-padding-16 w3-center">
		<div class="w3-container">
			<div class="w3-right w3-padding-16">
				<button type="button" class="w3-btn w3-theme-l1">
					<i class="fa fa-pencil"></i>&nbsp; Edit
				</button>
			</div>
			<img src="${project}/view/img/topdriver1.png" alt="some image"
				style="width: 100%;">
			<p>
				<strong>구인</strong>
			</p>
			<p>듀오로 활동하실 멤버를 구합니다.</p>
			<p>
				<button class="w3-btn w3-btn-block w3-theme-l1">자세히</button>
			</p>
		</div>
	</div>

	<!-- End Right Column -->
</div>
</html>
