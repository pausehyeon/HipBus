/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */



CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	
	config.resize_enabled = false;
	config.enterMode = CKEDITOR.ENTER_BR;
	
	 config.toolbar = [
			['Undo','Redo','-','Find','Replace','-','SelectAll'],
			['Bold','Italic','-'],
			['Outdent','Indent','Blockquote'],
			['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','Link'],
			['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar'],'/',
			['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Maximize','ShowBlocks','Source',]
	 ];

};
