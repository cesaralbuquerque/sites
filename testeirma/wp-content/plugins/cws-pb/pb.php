<div id="cws-pb-text" style="display:none">
	<div class="row row_options">
		<label for="title">Widget Title:</label>
		<input type="text" name="title">
	</div>
	<div class="row">
		<div class="cws_tmce_buttons">
			<a href="#" id="insert-media-button" class="button insert-media add_media" title="Add Media"><span class="wp-media-buttons-icon"></span> Add Media</a>
			<div class="cws_tmce_controls">
				<a href="#" id="cws-switch-text" class="button" data-editor="content" data-mode="tmce" title="Switch to Text">Switch to Text</a>
			</div>
		</div>
		<div class="cws-pb-tmce">
			<textarea class="wp-editor-area" name="cws-pb-content" id="cws-pb-content"></textarea>
		</div>
	</div>
</div>
<div id="cws-pb-tabs" style="display:none">
	<div class="row row_options">
		<label for="title">Tab Title:</label>
		<input type="text" name="title">
	</div>
	<div class="row">
		<div class="cws_tmce_buttons">
			<a href="#" id="insert-media-button" class="button insert-media add_media" data-editor="content" title="Add Media"><span class="wp-media-buttons-icon"></span> Add Media</a>
			<div class="cws_tmce_controls">
				<a href="#" id="cws-switch-text" class="button" data-editor="content" data-mode="tmce" title="Switch to Text">Switch to Text</a>
			</div>
		</div>
		<div class="cws-pb-tmce">
			<textarea class="wp-editor-area" name="cws-pb-content" id="cws-pb-content"></textarea>
		</div>
	</div>
</div>
<div id="cws-pb-accs" style="display:none">
	<div class="row row_options">
		<label for="title">Accordion Title:</label>
		<input type="text" name="title">
	</div>
	<div class="row">
		<div class="cws_tmce_buttons">
			<a href="#" id="insert-media-button" class="button insert-media add_media" data-editor="content" title="Add Media"><span class="wp-media-buttons-icon"></span> Add Media</a>
			<div class="cws_tmce_controls">
				<a href="#" id="cws-switch-text" class="button" data-editor="content" data-mode="tmce" title="Switch to Text">Switch to Text</a>
			</div>
		</div>
			<div class="cws-pb-tmce">
				<textarea class="wp-editor-area" name="cws-pb-content" id="cws-pb-content"></textarea>
			</div>
	</div>
</div>
<div id="cws-pb-accs-title" style="display:none">
	<div class="row row_options">
		<label for="extra_style">Extra style name:</label>
		<select name="extra_style">
			<option></option>
			<option value="type-2">type-2</option>
		</select>
	</div>
	<div class="row row_options">
		<label for="title">Accordion Title:</label>
		<input type="text" name="title">
	</div>
	<div class="row row_options">
		<label for="title">Use it as toggle?:</label>
		<input type="checkbox" name="istoggle">
	</div>
</div>

<div id="cws-pb-col" style="display:none">
	<div class='row row_options'>
		<label for="margins">Margins:</label>
		<fieldset class='margins'>
			<input type="number" id="margin_left" name="margin_left" placeholder="Left (px)">
			<input type="number" id="margin_top" name="margin_top" placeholder="Top (px)">
			<input type="number" id="margin_bottom" name="margin_bottom" placeholder="Bottom (px)">
			<input type="number" id="margin_right" name="margin_right" placeholder="Right (px)">
		</fieldset>
	</div>
</div>
<div id="cws-pb-col-title" style="display:none">
	<form>
		<div class="row row_options">
			<label for="extra_style">Extra style name:</label>
			<select name="extra_style">
				<option></option>
				<option value="type-2">type-2</option>
				<option value="type-vertical">type-vertical</option>
			</select>
		</div>
		<div class="row row_options">
			<label for="title">Widget Title:</label>
			<input type="text" name="title">
		</div>
	</form>
</div>
<div id="pb_overlay" style="display:none"></div>
<div id="cws_content_wrap" data-cws-ajurl="<?php echo CWS_PB_PLUGIN_URL ?>" class="wp-editor-container" style="display:none">
	<div id="bd">
		<div class="yui-b elements_panel">
			<div id="feeds">
				<div class='tabs clearfix'>
					<a class='active' href="#" onclick="document.getElementById('feeds-modules').style.display = 'none';document.getElementById('feeds-cols').style.display = 'block';">Columns</a>
					<a href="#" onclick="document.getElementById('feeds-modules').style.display = 'block';document.getElementById('feeds-cols').style.display = 'none';">Modules</a>
				</div>
				<div class='tabs_content'>
					<ul id="feeds-cols" class='tab_section clearfix'></ul>
					<ul id="feeds-modules" class='tab_section clearfix' style="display:none"></ul>
				</div>
			</div>
		</div>
		<div id="yui-main">
			<div class="yui-b">
				<div class="yui-g">
					<ul id="cws_row"></ul>
				</div>
			</div>
		</div>
	</div>
</div>