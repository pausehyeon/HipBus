/**
 * html5audio 플러그인 추가 : 의존성 때문에 widget, widgetselection, lineutils 플러그인이 필요.
 */
CKEDITOR.plugins.addExternal( 'widget', '/HipBus/scripts/ckeditor/plugins/widget/', 'plugin.js' );
CKEDITOR.plugins.addExternal( 'widgetselection', '/HipBus/scripts/ckeditor/plugins/widgetselection/', 'plugin.js' );
CKEDITOR.plugins.addExternal( 'lineutils', '/HipBus/scripts/ckeditor/plugins/lineutils/', 'plugin.js' );
CKEDITOR.plugins.addExternal( 'html5audio', '/HipBus/scripts/ckeditor/plugins/html5audio/', 'plugin.js' );
CKEDITOR.plugins.addExternal( 'youtube', '/HipBus/scripts/ckeditor/plugins/youtube/', 'plugin.js' );


CKEDITOR.editorConfig = function( config ) {
	config.extraPlugins = 'youtube,html5audio';
	
	config.toolbarGroups = [
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'about', groups: [ 'about' ] },
		'/',
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'insert', groups: [ 'insert', 'html5audio'] }
	];

	config.removeButtons = 'Underline,Subscript,Superscript,Cut,Copy,Paste,PasteText,PasteFromWord,Scayt,Link,Anchor,Unlink,Table,Outdent,Indent,About,HorizontalRule,SpecialChar';

	
};