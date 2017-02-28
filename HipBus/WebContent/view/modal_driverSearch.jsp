<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/view/setting/navbar_top_setting.jsp"%>
<!-- 멤버 검색결과창 -->
<div class="w3-container">
  <div id="driverSearch" class="w3-modal">
    <div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('driverSearch').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-8 w3-display-topright" title="Close Modal">×</span>
      </div>
		<div class="w3-container w3-padding-jumbo" id="myBusSearchResult">
			
		</div>
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
      	<p class="w3-right-align"><span>Jihyeon</span>${str_searchList}</p>
      </div>

    </div>
  </div>
  
  <div id="crewSearch" class="w3-modal">
    <div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('crewSearch').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-8 w3-display-topright" title="Close Modal">×</span>
      </div>
		<div class="w3-container w3-padding-jumbo" id="crewSearchResult">
			
			
		</div>
      <div id="crewKeyword" class="w3-container w3-border-top w3-padding-16 w3-light-grey">
      	<p class="w3-right-align"><span></span>${str_searchList}</p>
      </div>

    </div>
  </div>
  
  
  
  
  
  
</div>
<!-- login 모달 창 끝 -->