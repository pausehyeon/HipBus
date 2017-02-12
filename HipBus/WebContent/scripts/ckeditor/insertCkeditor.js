/**
 * ckeditor를 사용하는 .jsp파일에 반드시 포함해야 하는 script.
 * textarea의 id를 'editor'로 설정해야 한다.
 */

CKEDITOR.replace('editor', {
	enterMode : "2",
	height : '350px', // 입력창의 높이
	resize_enabled : false, // 사이즈 조정
	filebrowserImageUploadUrl : "uploadToEditor.do", // 이미지 업로드를 위해 핸들러 연결해줌.
	filebrowserUploadUrl : "uploadToEditor.do", 
	customConfig : '/HipBus/scripts/ckeditor/custom_config.js'
});