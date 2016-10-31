/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	config.font_names = '굴림; 돋움; 궁서; HY견고딕; HY견명조; 휴먼둥근헤드라인;' 
		+ '휴먼매직체; 휴먼모음T; 휴먼아미체; 휴먼엑스포; 휴먼옛체; 휴먼편지체;' 
		+  CKEDITOR.config.font_names;
	
	config.extraPlugins += (config.extraPlugins.length == 0 ? '' : ',') + 'youtube';
	config.allowedContent = true;
	config.toolbar = 'my';
	
	config.toolbar_my = 
		[
	    ['Source','-','Save','NewPage','Preview','-','Templates'],
	    ['Undo','Redo','-','Find','Replace','-','Maximize', 'ShowBlocks'],
	    ['Cut','Copy','Paste','-','Print', 'SpellChecker', 'Scayt'],
	    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
	    ['Link','Unlink'],
	    '/',
	    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'], 
	    ['Styles','Format','Font','FontSize'],
	    ['TextColor','BGColor'],
	    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	    ['Image','Youtube','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
	];

/* //디폴트
		config.toolbar = 'Full';
	
	    config.toolbar_Full =
	[
	    ['Source','-','Save','NewPage','Preview','-','Templates'],
	    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
	    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	    ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
	    ['BidiLtr', 'BidiRtl'],
	    '/',
	    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
	    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
	    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	    ['Link','Unlink','Anchor'],
	    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
	    '/',
	    ['Styles','Format','Font','FontSize'],
	    ['TextColor','BGColor'],
	    ['Maximize', 'ShowBlocks','-','About']
	];
*/
	
	
	
	/*
	 	http://igotit.tistory.com/entry/CKEditor-Plugin-%EC%A7%81%EC%A0%91-%EB%A7%8C%EB%93%A4%EA%B8%B0-%EC%98%88-Cy-GistInsert
		http://ojava.tistory.com/1 사용법
	*/
};




 