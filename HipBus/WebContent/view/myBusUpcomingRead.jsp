<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>

<title>${str_upcomingTitle}</title>
<body class="w3-theme-l5">

	<!-- Navbar -->
	<c:import url="../top.do" />


	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px;">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>

		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../myBusLeft.do"></c:import>
			<!-- End Left Column -->
			
			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div
					class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-white">
						<h2 align="left">Upcoming</h2>
						<div class="w3-col m7">
							<div
								class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
								<div class="w3-container w3-center w3-white">
									<h2 align="left">Upcoming</h2>

									<div class="w3-row">
										<div class="w3-container">
											<div class="w3-card-4">
												<header class="w3-container w3-padding w3-blue-grey">
													<h5>oooo 힙합 공연</h5>
												</header>
												<p align="right" style="padding: 5px">작성자:관리자 |
													작성일:2016-12-19 | 조회수:0</p>
												<hr style="border: 1px outset silver;" />

												<div align="left"
													class="w3-container w3-padding-128 w3-padding-jumbo">
													<div
														class="w3-col m6 w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right">
														<div class="w3-card-4">

															<header class="w3-container w3-padding w3-black">
																<h5>oooo 힙합 공연</h5>
															</header>
															<p align="right" class="w3-margin">작성자:관리자 |
																작성일:2016-12-19 | 조회수:0</p>
															<hr style="border: 1px outset silver;" />

															<div align="left"
																class="w3-container w3-padding-128 w3-padding-jumbo">

																<div class="w3-row">
																	<div class="w3-container">
																		<div class="w3-card-4">
																			<header class="w3-container w3-padding w3-blue-grey">
																				<h5>oooo 힙합 공연</h5>
																			</header>
																			<p align="right" style="padding: 5px">작성자:관리자 |
																				작성일:2016-12-19 | 조회수:0</p>
																			<hr style="border: 1px outset silver;" />

																			<div align="left"
																				class="w3-container w3-padding-128 w3-padding-jumbo">
																				<div>장소</div>
																				<hr style="border: 1px outset lightgray">
																				<div>일시</div>
																				<hr style="border: 1px outset lightgray">
																				<div>출연진</div>
																				<hr style="border: 1px outset lightgray">
																				<div>시간</div>
																				<hr style="border: 1px outset lightgray">

																			</div>
																			<hr style="border: 1px outset silver;" />
																			<footer
																				class="w3-container w3-padding-small w3-white w3-center">

																				<p>
																					<button class="w3-btn w3-border w3-light-grey">목록</button>
																					<button class="w3-btn w3-border w3-light-grey">삭제</button>
																					<button class="w3-btn w3-border w3-light-grey">수정</button>
																				</p>


																				<!-- <input type="image" src="/HipBus/view/img/HipBusLogo_bw.png" style="width:20px;"> -->
																				<i class="glyphicon glyphicon-search"></i>
																			</footer>
																		</div>
																	</div>
																</div>
															</div>

														</div>

													</div>
													<div>장소</div>
													<hr style="border: 1px outset lightgray">
													<div>일시</div>
													<hr style="border: 1px outset lightgray">
													<div>출연진</div>
													<hr style="border: 1px outset lightgray">
													<div>시간</div>
													<hr style="border: 1px outset lightgray">

												</div>
												<hr style="border: 1px outset silver;" />
												<footer class="w3-container w3-padding-small  w3-center">

													<p>
														<button class="w3-btn w3-border w3-black">목록</button>
														<button class="w3-btn w3-border w3-black">삭제</button>
														<button class="w3-btn w3-border w3-black">수정</button>
													</p>


													<!-- <input type="image" src="/HipBus/view/img/HipBusLogo_bw.png" style="width:20px;"> -->
													<i class="glyphicon glyphicon-search"></i>
												</footer>
											</div>

										</div>

										<div>장소</div>
										<hr style="border: 1px outset lightgray">
										<div>일시</div>
										<hr style="border: 1px outset lightgray">
										<div>출연진</div>
										<hr style="border: 1px outset lightgray">
										<div>시간</div>
										<hr style="border: 1px outset lightgray">

									</div>
									<hr style="border: 1px outset silver;" />
									<footer
										class="w3-container w3-padding-small w3-white w3-center">

										<p>
											<button class="w3-btn w3-border w3-light-grey">목록</button>
											<button class="w3-btn w3-border w3-light-grey">삭제</button>
											<button class="w3-btn w3-border w3-light-grey">수정</button>
										</p>


										<!-- <input type="image" src="/HipBus/view/img/HipBusLogo_bw.png" style="width:20px;"> -->
										<i class="glyphicon glyphicon-search"></i>
									</footer>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>

			<!--  Right Column -->
			<c:import url="../myBusRight.do"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
