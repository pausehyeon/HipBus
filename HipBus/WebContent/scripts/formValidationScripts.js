/**
 * 
 * 반드시
 * <!-- jQuery Validation Plugin -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/additional-methods.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/localization/messages_ko.js"></script>
	<script type="text/javascript" src="${project}/scripts/formValidationScripts.js"></script>
	^ 와 함께 사용해야.
 *
 * 사용된 곳 :
 * inputformvalidate() -> mainSighUp.jsp의 body onload, myBusEdit.jsp의 body onload(현재 작동x 수정필요 TODO)
 * writeformvalidate(), updateeditor() -> stationWrite.jsp의 body onload
 * 
 */

var str_signUpEmail = "* 이 주소로 가입인증 메일이 발송되므로 반드시 정확한 주소를 입력해주세요.";
var str_signUpUserName = "* 닉네임을 입력해주세요.";
var str_signUpPassword = "* 비밀번호는 숫자와 알파벳을 조합하여 5~10자리로 입력해주세요.";
var str_signUpPasswordCheck = "* 확인을 위해 다시 한번 입력해주세요.";
var str_emailNo = "* 이미 존재하는 이메일입니다. <a href='mainSignIn.do'>로그인하기</a>";
var str_userNameNo = "* 이미 존재하는 닉네임입니다.";
var str_passwordCheckNo = "* 비밀번호가 일치하지 않습니다.";
var str_nowhitespace = "* 공백을 포함할 수 없습니다.";
var str_alphanumeric = "* '_' 이외의 특수기호는 포함할 수 없습니다.";
var str_confirmSignUp = "으로 HipBus에서 보내는 가입 인증 링크를 클릭하면 회원가입이 완료됩니다. 가입하시겠습니까?";
var str_needSubject = '* 제목을 입력해주세요.';
var str_needContent = '&nbsp;&nbsp;&nbsp;* 내용을 입력해주세요.';
var str_needUpload = '* 대표 이미지를 입력해주세요.';

function inputformvalidate() {
	$("#inputform").validate({
		errorClass : "w3-text-red w3-xsmall w3-right",
		submitHandler : function() {
			if (confirm(inputform.email.value + str_confirmSignUp)) {
				return true;
			} else {
				return false;
			}
		},
		// 규칙
		rules : {
			email : {
				required : true,
				email : true,
				remote : {
					url : "verifyEmailResult.do",
					type : "post",
					data : {
						email : function() {
							return inputform.email.value;
						}
					}
				}
			},
			nick : {
				required : true,
				minlength : 3,
				maxlength : 10,
				nowhitespace : true,
				remote : {
					url : "verifyNickResult.do",
					type : "post",
					data : {
						nick : function() {
							return inputform.nick.value;
						}
					}
				}
			},
			passwd : {
				required : true,
				minlength : 5,
				maxlength : 10,
				nowhitespace : true,
				alphanumeric : true
			},
			repasswd : {
				required : true,
				equalTo : passwd
			}
		},
		// 규칙체크 실패시 출력될 메시지
		messages : {
			email : {
				required : str_signUpEmail,
				remote : str_emailNo
			},
			nick : {
				required : str_signUpUserName,
				remote : str_userNameNo,
				nowhitespace : str_nowhitespace
			},
			passwd : {
				required : str_signUpPassword,
				nowhitespace : str_nowhitespace,
				alphanumeric : str_alphanumeric
			},
			repasswd : {
				required : str_signUpPasswordCheck,
				equalTo : str_passwordCheckNo
			}
		}
	});
}

function updateeditor(){
	for(var i in CKEDITOR.instances) {
		CKEDITOR.instances[i].updateElement();
	}
}

function writeformvalidate(){
	$("form[name=writeform]").validate({
		errorClass : "w3-text-red w3-xsmall",
		ignore: [],         
		rules: {
			subject: {
				required : true
			},
			content: {
				required: function(){
					updateeditor();
					return true;
				}
			},
			upload: {
				required: true
			}
		},
		messages: {
			subject : {
				required : str_needSubject
				},
			content : {
				required : str_needContent
				},
			upload : {
				required : str_needUpload
			}
		}
	});
}

