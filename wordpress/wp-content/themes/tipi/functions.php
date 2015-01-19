<?php

/* #######################################################################

	Tipi by Supa

	Load Supa Framework and Functionality files

####################################################################### */

	$basedir = get_template_directory() . '/framework/';

	// Load main theme options
	require_once($basedir .'theme-options.php');

	// load twitter styles and scripts
	require_once($basedir .'styles-and-scripts.php');

	// load widgets
	require_once($basedir .'widgets.php');

	// load custom meta
	require_once($basedir .'custom-meta.php');

	// load custom post types
	require_once($basedir .'custom-post-types.php');

	// shortcodes
	require_once($basedir .'shortcodes.php');

	// activate plugins
	require_once($basedir .'plugins.php');

	// load standard functions
	require_once($basedir .'default.php');

?>
