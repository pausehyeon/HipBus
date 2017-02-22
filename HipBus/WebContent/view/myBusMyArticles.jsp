<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/view/setting/setting.jsp"%>
<%@include file="/view/setting/bus_setting.jsp"%>
<%@include file="/view/setting/myBus_setting.jsp"%>
<%@include file="/view/setting/station_setting.jsp"%>

<title>${str_mybusTitle}</title>
<body class="w3-theme-l5">

	<!-- Navbar -->
	<c:import url="../top.do" />

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px">
		<!-- The Grid -->
		<div class="w3-row w3-container" style="margin-top: 80px">
			<!-- 여백 -->
		</div>

		<div class="w3-row">
			<!-- Left Column -->
			<c:import url="../myBusLeft.do?driver=${driver}"></c:import>
			<!-- End Left Column -->

			<!-- Middle Column -->
			<!-- 여기서부터 -->
			<div class="w3-col m7">
				<div class="w3-container w3-card-2 w3-white w3-round w3-margin-bottom w3-margin-left w3-margin-right w3-padding-32 w3-padding-xxlarge">
					<div class="w3-container w3-center w3-black">
						<h3>
							<i class="fa fa fa-align-left fa-fw w3-margin-right"></i>${nick} ${str_myArticles}
						</h3>
					</div>
					<div class="w3-row">
						<!-- 글이없는경우 -->
						<c:if test="${station==null}">
							<div class="w3-row w3-margin-bottom w3-padding">
								<div class="w3-margin-top w3-container">
									<h5 class="w3-center">${msg_station_x}</h5>
								</div>
							</div>
						</c:if>
						<!-- 글이있는경우 -->

						<c:if test="${count != 0}">
							<c:forEach var="article" items="${station}">
							<script type="text/javascript">
							
							</script>
								<c:if test="${type == 1 }">
									<div>
										<hr>
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<a href="stationRead.do?num=${article.num}&pageNum=${pageNum}&category=${article.category}&type=${type}"> <c:choose>
														<c:when test="${article.category == 1}">
															<h4>[${str_beat}] ${article.subject}</h4>
														</c:when>
														<c:when test="${article.category == 2}">
															<h4>[${str_rab}] ${article.subject}</h4>
														</c:when>
														<c:when test="${article.category == 3}">
															<h4>[${str_mixTape}] ${article.subject}</h4>
														</c:when>
														<c:when test="${article.category == 4}">
															<h4>[${str_vocal}] ${article.subject}</h4>
														</c:when>
														<c:when test="${article.category == 5}">
															<h4>[${str_gasa}] ${article.subject}</h4>
														</c:when>
														<c:when test="${article.category == 6}">
															<h4>[${str_freeBoard}] ${article.subject}</h4>
														</c:when>
													</c:choose>
												</a>
											</div>
											<div class="w3-third w3-container">
												<p class="w3-right w3-tiny">${str_writeNick}:
													${article.nick} | ${str_reg_date}:
													<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
													| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
												</p>
											</div>
										</div>

									</div>
								</c:if>
								<c:if test="${type == 2 }">
									<c:if test="${category1 == 0}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<h5>${msg_station_x}</h5>
											</div>
										</div>
									</c:if>
									<c:if test="${article.category == 1}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
													<h4>[${str_beat}] ${article.subject}</h4>
												</a>
											</div>
											<div class="w3-third w3-container">
												<p class="w3-right w3-tiny">${str_writeNick}:
													${article.nick} | ${str_reg_date}:
													<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
													| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
												</p>
											</div>
										</div>
									</c:if>
								</c:if>
								<c:if test="${type == 3 }">
									<c:if test="${category2 == 0}">
										<div class="w3-row w3-margin-bottom">

											<h5>${msg_station_x}1</h5>

										</div>
									</c:if>
									<c:if test="${article.category == 2}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
													<h4>[${str_rab}] ${article.subject}</h4>
												</a>
											</div>
											<div class="w3-third w3-container">
												<p class="w3-right w3-tiny">${str_writeNick}:
													${article.nick} | ${str_reg_date}:
													<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
													| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
												</p>
											</div>
										</div>
									</c:if>
								</c:if>
								<c:if test="${type == 4 }">
									<c:if test="${category3 == 0}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<h5>${msg_station_x}</h5>
											</div>
										</div>
									</c:if>
									<c:if test="${article.category == 3}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
													<h4>[${str_mixTape}] ${article.subject}</h4>
												</a>
											</div>
											<div class="w3-third w3-container">
												<p class="w3-right w3-tiny">${str_writeNick}:
													${article.nick} | ${str_reg_date}:
													<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
													| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
												</p>
											</div>
										</div>
									</c:if>
								</c:if>
								<c:if test="${type == 5 }">
									<c:if test="${category4 == 0}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<h5>${msg_station_x}</h5>
											</div>
										</div>
									</c:if>
									<c:if test="${article.category == 4}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
													<h4>[${str_vocal}] ${article.subject}</h4>
												</a>
											</div>
											<div class="w3-third w3-container">
												<p class="w3-right w3-tiny">${str_writeNick}:
													${article.nick} | ${str_reg_date}:
													<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
													| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
												</p>
											</div>
										</div>
									</c:if>
								</c:if>
								<c:if test="${type == 6 }">
									<c:if test="${category5 == 0}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<h5>${msg_station_x}</h5>
											</div>
										</div>
									</c:if>
									<c:if test="${article.category == 5}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
													<h4>[${str_gasa}] ${article.subject}</h4>
												</a>
											</div>
											<div class="w3-third w3-container">
												<p class="w3-right w3-tiny">${str_writeNick}:
													${article.nick} | ${str_reg_date}:
													<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
													| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
												</p>
											</div>
										</div>
									</c:if>
								</c:if>
								<c:if test="${type == 7 }">
									<c:if test="${category6 == 0}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<h5>${msg_station_x}</h5>
											</div>
										</div>
									</c:if>
									<c:if test="${article.category == 6}">
										<div class="w3-row w3-margin-bottom">
											<div class="w3-twothird w3-container">
												<a href="stationRead.do?num=${article.num}&type=${type}&category=${article.category}&pageNum${pageNum}">
													<h4>[${str_freeBoard}] ${article.subject}</h4>
												</a>
											</div>
											<div class="w3-third w3-container">
												<p class="w3-right w3-tiny">${str_writeNick}:
													${article.nick} | ${str_reg_date}:
													<fmt:formatDate value="${article.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm" />
													| ${str_readCount}: ${article.readcount} | ${str_upCount}: ${article.likenum }
												</p>
											</div>
										</div>
									</c:if>
								</c:if>

							</c:forEach>
						</c:if>
					</div>
					<c:if test="${type == 1 and station!=null}">
						<div class="w3-center ">
							<!-- Pagination -->

							<c:if test="${startPage > pageBlock}">
								<a class="w3-hover-black" href="myBusMyArticles.do?driver=${driver}">◀◀</a>
								<a class="w3-hover-black" href="myBusMyArticles.do?driver=${driver}&pageNum=${startPage-pageBlock}">◀</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span class="w3-hover-black">${i}</span>
								</c:if>
								<c:if test="${i != currentPage}">
									<a class="w3-hover-black" href="myBusMyArticles.do?driver=${driver}&pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
							<c:if test="${pageCount > endPage}">
								<a class="w3-hover-black" href="myBusMyArticles.do?driver=${driver}&pageNum=${startPage+pageBlock}">▶</a>
								<a class="w3-hover-black" href="myBusMyArticles.do?driver=${driver}&pageNum=${pageCount}">▶▶</a>
							</c:if>
						</div>
					</c:if>
				</div>

				<!-- 여기까지 -->
				<!-- End Middle Column -->
			</div>

			<!--  Right Column -->
			<c:import url="../myBusRight.do?driver=${driver}"></c:import>
			<!-- End Right Column -->

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<!-- Footer -->
	<c:import url="../bottom.do" />

</body>
</html>
