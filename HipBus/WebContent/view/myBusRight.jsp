<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<!-- Right Column -->
<div class="w3-col m2">
	<div class="w3-card-2 w3-round w3-white w3-center">
		<div class="w3-container">			
			
				<c:if test="${driver==email}">
					<div class="w3-right w3-padding-12">
						<button class="w3-btn" onclick="location='myBusUpcomingWrite.do?driver=${driver}'">
							<i class="fa fa-pencil"></i>&nbsp; ${str_edit}
						</button>
					</div>
				</c:if>
				<c:if test="${driver!=email and upcomingDto!=null}">
					<div class="w3-right w3-padding-12">
						<button class="w3-btn" onclick="location='myBusUpcoming.do?driver=${driver}'">${str_goUpcomingList}</button>
					</div>
				</c:if>
				<c:if test="${driver!=email and upcomingDto==null}">
					<div class="w3-right w3-padding-12">
						&nbsp;
					</div>
				</c:if>
			<c:if test="${upcomingDto.imglocation==null}">
				<img src="${project}/view/img/notice1.png" alt="some image"	style="width: 100%;">
				<p>
					<strong>예정된 공연이 없습니다.</strong>
				</p>
			</c:if>
			<c:if test="${upcomingDto.imglocation!=null}">
				<img src="${project}/hipbusSave/${upcomingDto.imglocation}" alt="some image"
					style="width: 100%;">
				<p>
					<strong>${upcomingDto.subject}</strong>
				</p>
				<fmt:formatDate var="date" value="${upcomingDto.perf_date}" pattern="yy/MM/dd hh:mm"/>
				<p>${date}</p>
				<p>
					<button class="w3-btn w3-btn-block w3-theme-l1"
							onclick="location='myBusUpcomingRead.do?driver=${driver}&num=${upcomingDto.num}'">${str_detail}</button>
				</p>
			</c:if>
			
		</div>
	</div>
	<br>
	<div class="w3-card-2 w3-round w3-white w3-center">

		<div class="w3-container">
			<div class="w3-right w3-padding-16">
				<button type="button" class="w3-btn w3-theme-l1">
					<i class="fa fa-pencil"></i>&nbsp; ${str_edit}
				</button>
			</div>
			<img src="${project}/view/img/topdriver1.png" alt="some image"
				style="width: 100%;">
			<p>
				<strong>${str_wanted}</strong>
			</p>
			<p>듀오로 활동하실 멤버를 구합니다.</p>
			<p>
				<button class="w3-btn w3-btn-block w3-theme-l1">${str_detail}</button>
			</p>
		</div>
	</div>

	<!-- End Right Column -->
</div>
</html>
