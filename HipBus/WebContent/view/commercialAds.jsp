<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/view/setting/setting.jsp"%>
	<!-- 상업광고 -->
	<div class="w3-container">
		<!-- 광고 있을 때 -->
		<c:if test="${ad1_img eq null and ad1_html eq null}">
			<div class="w3-col m12 w3-margin-top">
				<p class="w3-border w3-padding-large w3-padding-128 w3-center">AD</p>
			</div>
		</c:if>
		<c:if test="${ad1_img ne null}">
			<div class="w3-col m12 w3-margin-top">
				<img src="${project}/hipbusSave/${ad1_img}" width="100%"/>
			</div>
		</c:if>
		<c:if test="${ad1_html ne null}">
			<div class="w3-col m12 w3-margin-top">
				${ad1_html}
			</div>
		</c:if>
		
		<c:if test="${ad2_img eq null and ad2_html eq null}">
			<div class="w3-col m12 w3-margin-top">
				<p class="w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
			</div>
		</c:if>
		<c:if test="${ad2_img ne null}">
			<div class="w3-col m12 w3-margin-top">
				<img src="${project}/hipbusSave/${ad2_img}" width="100%"/>
			</div>
		</c:if>
		<c:if test="${ad2_html ne null}">
			<div class="w3-col m12 w3-margin-top">
				${ad2_html}
			</div>
		</c:if>
		
		<c:if test="${ad3_img eq null and ad3_html eq null}">
			<div class="w3-col m12 w3-margin-top">
				<p class="w3-border w3-padding-large w3-padding-48 w3-center">AD</p>
			</div>
		</c:if>
		<c:if test="${ad3_img ne null}">
			<div class="w3-col m12 w3-margin-top">
				<img src="${project}/hipbusSave/${ad3_img}" width="100%"/>
			</div>
		</c:if>
		<c:if test="${ad3_html ne null}">
			<div class="w3-col m12 w3-margin-top">
				${ad3_html}
			</div>
		</c:if>
	</div>