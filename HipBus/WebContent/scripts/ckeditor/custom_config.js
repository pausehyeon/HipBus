/**
 * html5audio 플러그인 추가 : 의존성 때문에 widget, widgetselection, lineutils 플러그인이 필요.
 */
CKEDITOR.plugins.addExternal( 'widget', '/HipBus/scripts/ckeditor/plugins/widget/', 'plugin.js' );
CKEDITOR.plugins.addExternal( 'widgetselection', '/HipBus/scripts/ckeditor/plugins/widgetselection/', 'plugin.js' );
CKEDITOR.plugins.addExternal( 'lineutils', '/HipBus/scripts/ckeditor/plugins/lineutils/', 'plugin.js' );
CKEDITOR.plugins.addExternal( 'html5audio', '/HipBus/scripts/ckeditor/plugins/html5audio/', 'plugin.js' );
CKEDITOR.plugins.addExternal( 'videodetector', '/HipBus/scripts/ckeditor/plugins/videodetector/', 'plugin.js' );


CKEDITOR.editorConfig = function( config ) {
	config.extraPlugins = 'widget';
	config.extraPlugins = 'widgetselection';
	config.extraPlugins = 'lineutils';
	config.extraPlugins = 'html5audio';
	config.extraPlugins = 'videodetector';	//code 순서에 따라 둘 중 하나만 동작
	
	
	config.toolbarGroups = [
		//{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ]},
		//{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		//{ name: 'links' },
		//{ name: 'forms' },
		//{ name: 'tools' },
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		'/',
		{ name: 'others' },
		{ name: 'insert'}
	];

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
};