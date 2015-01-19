"use strict";
var makeCRCTable = function() {
	var c;
	var crcTable = [];
	for (var n = 0; n < 256; n++) {
		c = n;
		for (var k = 0; k < 8; k++) {
			c = ((c & 1) ? (0xEDB88320 ^ (c >>> 1)) : (c >>> 1));
		}
		crcTable[n] = c;
	}
	return crcTable;
}

var crc32 = function(str) {
	var crcTable = window.crcTable || (window.crcTable = makeCRCTable());
	var crc = 0 ^ (-1);
	for (var i = 0; i < str.length; i++) {
		crc = (crc >>> 8) ^ crcTable[(crc ^ str.charCodeAt(i)) & 0xFF];
	}
	return (crc ^ (-1)) >>> 0;
};

/* ===== YUI portal ===== */
/*YUI_config = {
	filter: 'debug', // request -debug versions of modules for log statements
	//gallery: 'gallery-2014.02.20-23-55',
	debug: true,
	logExclude: {
		base: true, // Don't broadcast log messages from the event module
		attribute: true, // or the attribute module
		widget: true // or the widget module
	},
	logLevel: 'error',
	useBrowserConsole: true,
};*/

//Use loader to grab the modules needed
YUI().use('dd', 'event-base',
	'gallery-accordion-horiz-vert', 'tabview', 'node', 'panel', 'dd-delegate',
	'dd-plugin', 'dd-drop-plugin', 'dd-proxy', 'anim', 'anim-base', 'cookie',
	'json', function(Y) {
		//Make this an Event Target so we can bubble to it
		var Portal = function() {
			Portal.superclass.constructor.apply(this, arguments);
		};
		Portal.NAME = 'portal';
		Y.extend(Portal, Y.Base);
		// This is our new bubble target.
		Y.Portal = new Portal();

		Y.DD.Drag.prototype._handleMouseDownEvent = function(ev) {
			this.fire('drag:mouseDown', {	ev: ev });
		};

		var old_content, old_content_hash, new_content_hash, nestedPanel = null;
		var ajurl = '';
		var cws_cont_wrap_id = document.getElementById('cws_content_wrap');

		Y.on('domready', function(e) {
			Y.one('.wp-editor-tabs').prepend(
				'<a id="content-cws" class="wp-switch-editor switch-cws">CWS Builder</a>'
			);
			Y.one('input#publish').on('mousedown', function(e) {
				onClickTmce_or_Publish(e, true);
			});
			Y.one('#content-cws').on('click', function(e) {
				e.preventDefault();
				onClickorDomReady(e);
				e.stopPropagation();
			});
			if ( 'cwspb' == getUserSetting('editor') ) {
				onClickorDomReady(e);
			}
		});

		var onClickorDomReady = function(e) {
			var content_wrap = Y.one('#wp-content-wrap');
			if (!content_wrap.hasClass('cws-active')) {
				var source = content_wrap.hasClass('html-active') ? 'html' : 'tmce';
				var id = 'content';
				var tmce_i = 0;
				if (!tinymce.editors.length) {
					//switchEditors.switchto(document.getElementById('content-tmce'));
					setTimeout(function() {
						tinymce.init( tinyMCEPreInit.mceInit['content'] );
					}, 1000);
				}
				if (!tinymce.editors.length) {
					return;
				}
				setUserSetting('editor', 'cwspb');

				// var panxy = getUserSetting('cwspanxy');
				var panxy = 0;
				if (panxy) {
					panx = panxy & 0xffff;
					pany = panxy >> 16;
				} else {
					pany = document.getElementById('wpadminbar').clientHeight + 5;
					panx = document.getElementById('adminmenuwrap').clientWidth + 5;
				}

				if ('tmce' === source) {
					// tmce
					Y.all('#wp-content-editor-container, #post-status-info').hide();
					Y.one('#wp-content-wrap').removeClass('html-active');
					Y.one('#wp-content-wrap').removeClass('tmce-active');
					Y.one('#wp-content-wrap').addClass('cws-active');
					Y.one('#cws_content_wrap').show();

					var ed = tinyMCE.get(id);
					var dom = tinymce.DOM;
					old_content = tinyMCE.activeEditor.getContent({format: 'html'});
					old_content = old_content.replace(/<p>(\[\/?cws-.*?\])<\/p>/g, "$1");
					old_content = old_content.replace(/<p>(\[\/?cws-.*?\])<br \/>/g, "$1");
					old_content = old_content.replace(/<p>(\[\/?item.*?\])<\/p>/g, "$1");
					old_content = old_content.replace(/<p>(\[\/?item.*?\])<br \/>/g, "$1");
				} else {
					// text
					Y.one('#post-status-info').hide();
					Y.one('#wp-content-editor-container').hide();
					Y.one('#wp-content-wrap').removeClass('html-active');
					Y.one('#wp-content-wrap').removeClass('tmce-active');
					Y.one('#wp-content-wrap').addClass('cws-active');
					Y.one('#cws_content_wrap').show();
					//old_content = Y.one('#' + id).get('value');
					old_content = Y.one('#' + id)._node.innerText;
					/*
					old_content = window.switchEditors.wpautop( Y.one('#' + id).get('value') );
					old_content = old_content.replace(/<p>(\[\/?cws-.*?\])<\/p>/g, "$1");
					old_content = old_content.replace(/<p>(\[\/?cws-.*?\])<br \/>/g, "$1");
					old_content = old_content.replace(/<p>(\[\/?item.*?\])<\/p>/g, "$1");
					old_content = old_content.replace(/<p>(\[\/?item.*?\])<br \/>/g, "$1");
					*/
					//old_content = Y.one('#' + id).get('value');
				}
				var bNeedUpdate = false;
				var tmce_hash = crc32(old_content);
				if (!old_content_hash || tmce_hash != new_content_hash) {
					old_content_hash = tmce_hash;
					bNeedUpdate = true;
				}
				var li_rows = Y.all('#cws_row li');
				if (typeof preprocessContent == 'function') {
					old_content = preprocessContent(old_content);
				}
				var first8chars = old_content.substring(0, 8);
				if (old_content.length && '[cws-row' === first8chars && bNeedUpdate) {
					// we should build new content and compare it with the old one
					// if they don't match (for example at the first run, or after
					//
					// first we should clear old content if there's any
					//document.getElementById('pb_overlay').style.display = 'block';
					cleanAll();
					//window.setTimeout(buildModFromContent(old_content), 1000);
					buildModFromContent(old_content);
					//document.getElementById('pb_overlay').style.display = 'none';
				} else if (old_content.length && '[cws-row' !== first8chars) {
					// should insert old content into our builder
					// as text block
					cleanAll();
					var row = createMod(feeds['cols1']);
					var mod = createMod(widgets['w_widget1']);
					Y.one('#cws_row').appendChild(row);
					Y.one('.cwspb_widgets>ul').appendChild(mod);
					Y.one('#cws_row .cwspb_widgets li .inner').empty().append(old_content);
					initClonedDD(row);
					initClonedDD(mod);
				}
			}
		};

		var buildModFromContent0 = function (cont) {
			var i = 0;
			setTimeout(function () {
				buildModFromContent(cont);
				if (i < 1000000)
            i++, window.setTimeout(arguments.callee, 10);
			}, 10);
		};

		var cleanAll = function() {
			Y.all('#cws_row ul.item li.item').each(function(el) {
				id = el.get('id');
				dd = Y.DD.DDM.getDrag('#' + id);
				dd.destroy();
				el.get('parentNode').removeChild(el);
			});
			Y.all('#cws_row li.item').each(function(el) {
				id = el.get('id');
				dd = Y.DD.DDM.getDrag('#' + id);
				dd.destroy();
				el.get('parentNode').removeChild(el);
			});
			return;
		};

		var trim = Y.Lang.trim;

		var process_sc = function(content, node) {
			if (!ajurl.length) {
				var contwr = document.getElementById('cws_content_wrap');
				if (contwr) {
					ajurl = contwr.getAttribute('data-cws-ajurl');
				}
			}
			if (ajurl.length > 0) {
				var sc_parts = content.split(/\[(?=[^\/])/ig); // !!! no sc in sc !!!
				node.empty();
				node._node.setAttribute('data-cws-raw', content);
				if (sc_parts.length > 1) {
					jQuery.ajax({ url: ajurl + '/pbaj.php',
						data: {	cont: content	},
						//async: false,
						type: 'post',
						error: function() {
							node.append(content);
						},
						success: function(data) {
							//bAjComplete = true;
							node.append(data);
						},
						//timeout: 50
					});
				} else {
					node.append(content);
				}
			}
		}

		var buildModFromContent = function(content) {
			var fromidx = 0, curr_row = 0;
			while (8 == 8) {
				var row_start = content.indexOf('[cws-row', fromidx);
				if (-1 == row_start) {
					break;
				}
				curr_row++;
				var row_open_end = content.indexOf(']', fromidx + 8);
				var params = evalparam(trim(content.substring(fromidx + 9, row_open_end)));
				var col_nums = params.cols.substring(1).length;
				col_nums = col_nums ? col_nums : parseInt(params.cols.substring(0));
				var row = createMod(feeds['cols' + params.cols]);
				for (var n in params ) {
					if (params.hasOwnProperty(n) && n !== 'cols') {
						row.setData(n, params[n]);
					}
				}
				Y.one('#cws_row').appendChild(row);
				fromidx = row_open_end + 1;
				var row_end = content.indexOf('[/cws-row]', fromidx) + 10; // sizeof [/cws-row]
				// parse cols
				for (var i = 0; i < col_nums; i++) {
					fromidx = content.indexOf('[col', fromidx) + 4;
					var col_open_end = content.indexOf(']', fromidx);
					var col_params = evalparam(trim(content.substring(fromidx, col_open_end)));
					var col_end = content.indexOf('[/col]', fromidx);
					while (7 == 7) {
						var w_start = content.indexOf('[cws-widget', fromidx);
						if (-1 == w_start || w_start > col_end) {
							break;
						}
						var w_open_end = content.indexOf(']', w_start + 11);
						var w_params = evalparam(trim(content.substring(w_start + 11, w_open_end)));
						// we can use underscore here as it's already included into wp
						var cur_widget = _.find(widgets, function(obj) {
							return obj.type == w_params.type
						});
						var curr_pos = w_open_end + 1,
							item_open_end, item_end;
						var mod = createMod(cur_widget, true);
						Y.one('#cws_row>li:nth-child(' + curr_row + ') .cwspb_widgets>ul:nth-child(' + (i + 1) + ')').appendChild(mod);
						switch (w_params.type) {
							case 'text':
								var textblock = content.substring(curr_pos, content.indexOf('[/cws-widget]', fromidx));
								var mod_inner = mod.one('.inner');
								process_sc(textblock, mod_inner);
								//var mod_inner = mod.one('.inner');
								//mod_inner.empty().append(textblock_c);
								//if ( crc32(textblock) != crc32(textblock_c) ) {
									// save raw content as data attribute
								//	mod_inner._node.setAttribute('data-cws-raw', textblock);
								//}
								break;
							case 'tabs':
								var tabs = mod.getData('tabs');
								var tab_item = {};
								tabs.plug(Removeable);
								for (var y = 0; y < w_params.items; y++) {
									curr_pos = content.indexOf('[item', curr_pos) + 5;
									item_open_end = content.indexOf(']', curr_pos);
									item_end = content.indexOf('[/item]', item_open_end);
									var item_params = evalparam(trim(content.substring(curr_pos, item_open_end)));
									tab_item['label'] = item_params.title;
									var textblock = trim(content.substring(item_open_end + 1, item_end));
									tab_item['content'] = '';
									tabs.add(tab_item, tabs.size());
									process_sc(textblock, tabs.item(tabs.size()-1).get('panelNode'));
									/*if ( crc32(textblock) != crc32(textblock_c) ) {
										tabs.item(tabs.size()-1).get('panelNode')._node.setAttribute('data-cws-raw', textblock);
									}*/
									curr_pos = item_end + 7;
								}
								tabs.selectChild(0);
								tabs.plug(Addable);
								//tabs.render(mod.one('.inner'));
								break;
							case 'accs':
								var accs = mod.getData('accs');
								var accs_item = {};
								if (1 == w_params.toggle) {
									mod.setData('istoggle', true);
									accs.set('allowMultipleOpen', true);
								} else {
									mod.setData('istoggle', false);
									accs.set('allowMultipleOpen', false);
								}
								//var curr_pos = w_open_end+1, item_open_end, item_end;
								accs.plug(RemoveableAcc);
								for (var y = 0; y < w_params.items; y++) {
									curr_pos = content.indexOf('[item', curr_pos) + 5;
									item_open_end = content.indexOf(']', curr_pos);
									item_end = content.indexOf('[/item]', item_open_end);
									var item_params = evalparam(trim(content.substring(curr_pos, item_open_end)));
									accs_item['label'] = item_params.title;
									var textblock = trim(content.substring(item_open_end + 1, item_end));
									accs_item['section'] = '';
									accs.insertSection(accs.section_list.length - 1,
										'<div><a href="javascript:void(0);">' + accs_item['label'] + '</a>\
										<div class="control_panel">\
										<a class="yui3-acc-remove" title="remove slide"></a>'+
										'<a class="yui3-pref" title="Edit slide"></a></div></div>',
										'<div>' + accs_item['section'] + '</div>');
									process_sc(textblock, accs.section_list[accs.section_list.length - 2].content);
									if (item_params.open == '1') {
										accs.openSection(accs.section_list.length - 2);
									}
									/*if ( crc32(textblock) != crc32(textblock_c) ) {
										// save original content
										accs.section_list[accs.section_list.length - 2].content._node.setAttribute('data-cws-raw', textblock);
									}*/

									curr_pos = item_end + 7;
								}
								accs.plug(AddableAcc);
								break;
						}
						fromidx = content.indexOf('[/cws-widget]', fromidx) + 13; // sizeof [/cws-widget]
						initClonedDD(mod, true);
						var mod_title = undefined !== w_params.title ? w_params.title : '';
						mod.one('h4 strong').set('innerText', mod_title);
						var new_data = mod.getData('data');
						new_data.title = mod_title;
						mod.setAttribute('cws-title', mod_title);
						mod.setData('data', new_data);
						mod.setData('extra_style', w_params.e_style);
					}

				}
				fromidx = row_end;
				initClonedDD(row);
			}
		};

		var evalparam = function(str) {
			var obj = {};
			var spos = 0, epos = 0;
			var is_quote = 0;
			var name = '', value = '';
			while (true) {
				spos = str.indexOf('=', epos);
				if (spos == -1) break;
				name = str.substring(epos, spos);
				is_quote = str.substring(spos + 1, spos + 2) == '"' ? 1 : 0;
				var space = str.indexOf(is_quote == 1 ? '"' : ' ', spos + is_quote + 1);
				value = space !== -1 ? str.substring(spos + is_quote + 1, space) : str.substring(spos + is_quote + 1);
				obj[name] = value;
				epos = space + is_quote + 1;
				if (!epos) break;
			};
			return obj;
		};

		Y.all('#content-tmce, #content-html').on('click', function(e) {
			onClickTmce_or_Publish(e, false);
			Y.all('#wp-content-editor-container, #post-status-info').show();
		});

		var onClickTmce_or_Publish = function(e, is_update) {
			var target_tab;
			var panxy = panx || pany<<16;
			setUserSetting('cwspanxy', panxy);
			if (e.type == 'click') {
				target_tab = e.target.getAttribute('id').substring(8);
				setUserSetting('editor', target_tab);
			} else {
				target_tab = 'tmce';
			}

			if (Y.one('#wp-content-wrap').hasClass('cws-active')) {
				var id = 'content';
				var ed = tinyMCE.get(id);
				var dom = tinymce.DOM;
				var new_content = buildContent();
				if (!is_update) {
					//delete data;
					var data = {};
					new_content_hash = crc32(new_content);
					if (new_content_hash != old_content_hash) {
						old_content_hash = new_content_hash;
					}
				}
				//ed.setContent(window.switchEditors.wpautop(new_content), {format: 'html'});
				ed.setContent(new_content, {format: 'raw'});
				if ('html' === target_tab) {
					//Y.one('#content').set('value', window.switchEditors.pre_wpautop(new_content) );
					new_content = new_content.replace(/<p>(.*?)<\/p>/g, "\n\r$1\n\r");
					Y.one('#content').set('value', new_content);
				} else {
					//Y.one('#content').set('value', new_content);
				}
				if (!is_update) {
					Y.one('#wp-content-wrap').removeClass('cws-active');
					Y.one('#cws_content_wrap').hide();
					dom.addClass('wp-content-wrap', target_tab + '-active');
				}
			}
		};

		var cleanupYuid = function(node) {
			if (node) {
				node.all('*[id^="yui"]').removeAttribute('id');
			}
		};

		var buildContent = function() {
			var ret = '';
			Y.all('#cws_row>li').each(function(el0) {
				var col_id = el0.getData('data').id;
				ret += '[cws-row cols=' + col_id.substring(4);
				var e_style = el0.getData('extra_style');
				ret += (e_style !== undefined && e_style.length) ? ' e_style="' + e_style + '"' : '';
				var margin = el0.getData('margin_left');
				ret += (margin !== undefined && margin.length) ? ' margin_left="' + margin + '"' : '';
				margin = el0.getData('margin_right');
				ret += (margin !== undefined && margin.length) ? ' margin_right="' + margin + '"' : '';
				margin = el0.getData('margin_top');
				ret += (margin !== undefined && margin.length) ? ' margin_top="' + margin + '"' : '';
				margin = el0.getData('margin_bottom');
				ret += (margin !== undefined && margin.length) ? ' margin_bottom="' + margin + '"' : '';
				ret += ']';
				var col = 0;
				// columns
				var colnum = parseInt(col_id.substring(4, 5));
				el0.all('.cwspb_widgets>ul').each(function(el1, c) {
					var spn = isNaN(parseInt(col_id.substring(5 + col, 6 + col))) ? 1 : parseInt(col_id.substring(5 + col, 6 + col));
					ret += '[col span=' + 12 * spn / colnum + ']';
					// widgets
					var param;
					el1.all('>li').each(function(el2, c) {
						var data = el2.getData('data');
						ret += '[cws-widget type=' + data.type;
						param = el2.getData('extra_style');
						ret += (param !== undefined && param.length) ? ' e_style="' + param + '"' : '';
						var mod_inner;
						switch (data.type) {
							case 'text':
								ret += ' title="' + el2.getAttribute('cws-title') + '"]';
								mod_inner = el2.one('.inner')
								cleanupYuid(mod_inner);
								var text_block = (null !== mod_inner._node.getAttribute('data-cws-raw') ) ? mod_inner._node.getAttribute('data-cws-raw') : mod_inner.get('innerHTML');
								ret += text_block;
								break;
							case 'tabs':
								ret += ' title="' + el2.getAttribute('cws-title') + '"';
								param = el2.getData(data.type);
								var num_tabs = param.size();
								ret += ' items=' + num_tabs + ']';
								for (var i = 0; i < num_tabs; i++) {
									var open = param.item(i).get('selected') == '1' ? ' open=1' : '';
									ret += '[item' + open + ' type=' + data.type + ' title="' + param.item(i).get('srcNode').get('innerHTML') + '"]';
									mod_inner = param.item(i);
									//cleanupYuid(mod_inner);
									//ret += mod_inner.get('content');
									var text_block = (null !== mod_inner.get('panelNode')._node.getAttribute('data-cws-raw')) ?
										mod_inner.get('panelNode')._node.getAttribute('data-cws-raw') : mod_inner.get('content');
									ret += text_block;
									ret += '[/item]';
								}
								break;
							case 'accs':
								var istoggle = el2.getData('istoggle');
								if (istoggle) {
									ret += ' toggle=1';
								}
								param = el2.getData(data.type);
								ret += ' title="' + el2.getAttribute('cws-title') + '"';
								var num_tabs = param.section_list.length - 1;
								if (-1 != num_tabs) {
									ret += ' items=' + num_tabs + ']';
									for (var i = 0; i < num_tabs; i++) {
										var open = param.section_list[i].open ? ' open=1' : '';
										ret += '[item' + open + ' type=' + data.type + ' title="' + param.section_list[i].title.one('>div>a').get('innerText') + '"]';
										mod_inner = param.section_list[i].content.one('>div');
										cleanupYuid(mod_inner);
										var text_block = (null !== param.section_list[i].content._node.getAttribute('data-cws-raw')) ?
											param.section_list[i].content._node.getAttribute('data-cws-raw') : mod_inner.get('innerHTML');
										ret += text_block;
										ret += '[/item]';
									}
								}
								break;
						}
						ret += '[/cws-widget]';
					});
					col++;
					ret += '[/col]';
				});
				ret += '[/cws-row]';
			});
			return ret;
		};

		var Addable = function(config) {
			Addable.superclass.constructor.apply(this, arguments);
		};
		var AddableAcc = function(config) {
			AddableAcc.superclass.constructor.apply(this, arguments);
		};

		Addable.NAME = 'addableTabs';
		Addable.NS = 'addable';
		AddableAcc.NAME = 'addableAccN';
		AddableAcc.NS = 'addableAcc';

		Y.extend(Addable, Y.Plugin.Base, {
			ADD_TEMPLATE: '<li class="yui3-tab" title="add a tab">' +
				'<a class="yui3-tab-label yui3-tab-add"></a></li>',

			initializer: function(config) {
				var tabview = this.get('host');
				tabview.after('render', this.afterRender, this);
				tabview.get('contentBox')
					.delegate('click', this.onAddClick, '.yui3-tab-add', this);
			},

			getTabInput: function() {
				var tabview = this.get('host');
				return {
					label: 'New Tab',
					content: 'New Tab Content. Click * to edit.',
				}
			},

			afterRender: function(e) {
				var tabview = this.get('host');
				tabview.get('contentBox').one('> ul').append(this.ADD_TEMPLATE);
			},

			onAddClick: function(e) {
				e.stopPropagation();
				var tabview = this.get('host'),
					input = this.getTabInput();
				tabview.add(input, tabview.size());
				tabview.selectChild(tabview.size() - 1);
			}
		});

		Y.extend(AddableAcc, Y.Plugin.Base, {
			ADD_TEMPLATE: '<div>' +
				'<a class="yui3-tab-label yui3-acc-add"></a></div>',

			initializer: function(config) {
				var acc = this.get('host');
				acc.after('render', this.afterRender, this);
				acc.get('contentBox').delegate('click',this.onAddClick, '.yui3-acc-add', this);
				acc.get('contentBox').delegate('click',this.onAddClick0, '.yui3-accordion-title', this);
			},

			getTabInput: function() {
				var acc = this.get('host');
				return {
					label: 'New Tab',
					section: 'New Tab Content. Click * to edit.',
				}
			},

			afterRender: function(e) {
				var acc = this.get('host');
				acc.appendSection(this.ADD_TEMPLATE, '<div class="yui3-accordion-section-clip"></div>');
			},

			onAddClick0: function(e) {
				var one_a = e.target.one("a");
				var classname = null !== one_a ? one_a.get('className') : '';
				if ( -1 !== classname.indexOf('yui3-acc-add') ) {
					// prevent + slide from shaking
					e.stopPropagation();
				} else {
				}
			},

			onAddClick: function(e) {
				e.stopPropagation();
				var acc = this.get('host');
				acc.insertSection(acc.section_list.length - 1,
					'<div><a href="javascript:void(0);">New Slide</a>\
					<div class="control_panel">\
					<a class="yui3-acc-remove" title="remove slide"></a>'+
					'<a class="yui3-pref" title="Edit slide"></a></div></div>',
					'<div>New Slide Content</div>');
				//acc.openSection(acc.section_list.length - 1);
			}
		});

		var Removeable = function(config) {
			Removeable.superclass.constructor.apply(this, arguments);
		};
		var RemoveableAcc = function(config) {
			RemoveableAcc.superclass.constructor.apply(this, arguments);
		};

		Removeable.NAME = 'removeableTabs';
		Removeable.NS = 'removeable';
		RemoveableAcc.NAME = 'removeableAccN';
		RemoveableAcc.NS = 'removeableAcc';

		Y.extend(Removeable, Y.Plugin.Base, {
			REMOVE_TEMPLATE: '<div class="control_panel"><a class="yui3-tab-remove" title="remove tab"></a>'+
		'<a class="yui3-tab-edit" title="Edit tab"></a></div>',

			initializer: function(config) {
				var tabview = this.get('host'),
					cb = tabview.get('contentBox');

				cb.addClass('yui3-tabview-removeable');
				cb.delegate('click', this.onRemoveClick, '.yui3-tab-remove', this);
				cb.delegate('click', this.onEditClick, '.yui3-tab-edit', this);

				// Tab events bubble to TabView
				tabview.after('tab:render', this.afterTabRender, this);
			},

			afterTabRender: function(e) {
				// boundingBox is the Tab's LI
				e.target.get('boundingBox').append(this.REMOVE_TEMPLATE);
			},

			onRemoveClick: function(e) {
				e.stopPropagation();
				var tab = Y.Widget.getByNode(e.target);
				tab.remove();
			},

			onEditClick: function(e) {
				e.stopPropagation();
				current_tab = Y.Widget.getByNode(e.target);
				g_li = current_tab._parentNode.ancestor('li.item');
				//var curr_idx = acc.findSection(e.target);
				nestedPanel = showpanel(current_tab.get('label'));
				nestedPanel.show();
				nestedPanel.on('init', onPanelInit, {
					cfg: current_tab,
					bTitlePref: false
				});
			}
		});

		Y.extend(RemoveableAcc, Y.Plugin.Base, {
			REMOVE_TEMPLATE: '<div class="control_panel"><a class="yui3-acc-remove" title="remove slide"></a>'+
		'<a class="yui3-pref" title="Edit slide"></a></div>',

			initializer: function(config) {
				var acc = this.get('host'),
					cb = acc.get('contentBox');

				cb.addClass('yui3-acc-removeable');
				cb.delegate('click', this.onRemoveClick, '.yui3-acc-remove', this);
				cb.delegate('click', this.onPrefClick, '.yui3-pref', this);

				// Tab events bubble to TabView
				acc.after('accordion:render', this.afterAccRender, this);
				acc.allow_all_closed = true;
			},

			afterAccRender: function(e) {
				// boundingBox is the Tab's LI
				e.target.get('titles').append(this.REMOVE_TEMPLATE);
			},

			onPrefClick: function(e) {
				e.stopPropagation();
				var acc = Y.Widget.getByNode(e.target);
				g_li = acc._parentNode.get('parentNode').get('parentNode').get('parentNode');
				var curr_idx = acc.findSection(e.target);
				nestedPanel = showpanel(acc.section_list[curr_idx].title.one('a:first-child').get('innerText'));
				nestedPanel.show();
				nestedPanel.on('init', onPanelInit, {
					cfg: curr_idx,
					bTitlePref: false
				});
			},

			onRemoveClick: function(e) {
				e.stopPropagation();
				var acc = Y.Widget.getByNode(e.target);
				acc.removeSection(acc.findSection(e.target));
			}
		});


		//Setup some private variables..
		var goingUp = false,
			lastY = 0,
			trans = {},
			g_li = null;

		//The list of feeds that we are going to use
		var feeds = {
			'cols1': {
				id: 'cols1',
				title: '1/1',
				type: 'col'
			},
			'cols2': {
				id: 'cols2',
				title: '2/2',
				type: 'col'
			},
			'cols3': {
				id: 'cols3',
				title: '3/3',
				type: 'col'
			},
			'cols4': {
				id: 'cols4',
				title: '4/4',
				type: 'col'
			},
			'cols321': {
				id: 'cols321',
				title: '2/3 + 1/3',
				type: 'col'
			},
			'cols312': {
				id: 'cols312',
				title: '1/3 + 2/3',
				type: 'col'
			},
			'cols413': {
				id: 'cols413',
				title: '1/4 + 3/4',
				type: 'col'
			},
			'cols431': {
				id: 'cols431',
				title: '3/4 + 1/4',
				type: 'col'
			},
			'cols4112': {
				id: 'cols4112',
				title: '1/4 + 1/4 + 2/4',
				type: 'col'
			},
			'cols4211': {
				id: 'cols4211',
				title: '2/4 + 1/4 + 1/4',
				type: 'col'
			},
			'cols4121': {
				id: 'cols4121',
				title: '1/4 + 2/4 + 1/4',
				type: 'col'
			},
		};

		var widgets = {
			'w_widget1': {
				id: 'w_widget1',
				type: 'text',
				wtitle: true,
				dtitle: 'Text',
			},
			'w_widget2': {
				id: 'w_widget2',
				type: 'tabs',
				wtitle: true,
				dtitle: 'Tabs',
			},
			'w_widget3': {
				id: 'w_widget3',
				type: 'accs',
				wtitle: true,
				dtitle: 'Accordion/Toggle',
			},
		};

		// http://jafl.github.io/yui-modules/accordion-horiz-vert/

		//Simple method for stopping event propagation
		//Using this so we can detach it later
		var stopper = function(e) {
			e.stopPropagation();
		};

		//Helper method for creating the feed DD on the left
		var _createFeedDD = function(node) {
			//Create the DD instance
			var id = node.getAttribute('id') !== undefined ? node.getAttribute('id') : node.getData('id');
			var data = 'w_' == id.substring(0, 2) ? widgets[id] : feeds[id];
			node.setData('data', data);
			var groups = 'cols' == data.id.substring(0, 4) ? ['cols'] : ['widgets']

			if (false == Y.DD.DDM.getDrag('#' + data.id)) {
				var dd = new Y.DD.Drag({
					node: node,
					data: data,
					groups: groups,
					bubbleTargets: Y.Portal
				});
				dd.plug(Y.Plugin.DDProxy, {
					moveOnEnd: false,
					cloneNode: true,
					borderStyle: 'none'
				});
				//Setup some stopper events
				dd.on('drag:start', _handleStart);
				dd.on('drag:end', stopper);
				dd.on('drag:drophit', stopper);
			}
		};

		var _nodeSelect = function(e) {
			var a = e.target,
				div = a.ancestor('li.item');

			updateMod( feeds['cols' + e.target.get('value')], div );
		}


		//Handle the node:click event
		// click on the dropped item
		var w_node;
		var current_acc, current_tab;

		var _nodeClick = function(e) {
			//Is the target an href?
			if (e.target.test('a')) {
				var a = e.target,
					anim = null,
					div = a.get('parentNode').get('parentNode').get('parentNode');
				switch (a.getAttribute('class')) {
					case 'min':
						//Get some node references
						//debugger
						var div_inner = div.one('div.inner'),
							ul = div.one('div.inner>*'),
							h4 = div.one('h4'),
							h = h4.get('offsetHeight'),
							hUL = div_inner.get('clientHeight'),
							inner = div.one('div.inner');

						//Create an anim instance on this node.
						anim = new Y.Anim({
							node: inner
						});
						//Is it expanded?
						if (!div.hasClass('minned')) {
							//Set the vars for collapsing it
							anim.setAttrs({
								to: {
									height: 0,
									padding: 0
								},
								duration: '.25',
								easing: Y.Easing.easeOut,
								iteration: 1
							});
							//On the end, toggle the minned class
							//Then set the cookies for state
							anim.on('end', function() {
								div.toggleClass('minned');
								div.setAttribute('cws-h', hUL);
								//_setCookies();
							});
						} else {
							//Set the vars for expanding it
							hUL = div.getAttribute('cws-h') - hUL;
							anim.setAttrs({
								to: {
									height: (hUL),
								},
								duration: '.25',
								easing: Y.Easing.easeOut,
								iteration: 1
							});
							//Toggle the minned class
							anim.on('end', function() {
								div.toggleClass('minned');
								div.setAttribute('cws-h', 0);
								div_inner._node.removeAttribute('style');
							});
						}
						//Run the animation
						anim.run();
						break;
					case 'close':
						//Get some Node references..
						var li = div.get('parentNode'),
							id = li.get('id'),
							dd = Y.DD.DDM.getDrag('#' + id);
						//Destroy the DD instance.
						dd.destroy();
						//Setup the animation for making it disappear
						anim = new Y.Anim({
							node: div,
							to: {
								opacity: 0
							},
							duration: '.25',
							easing: Y.Easing.easeOut
						});
						anim.on('end', function() {
							//On end of the first anim, setup another to make it collapse
							var anim = new Y.Anim({
								node: div,
								to: {
									height: 0
								},
								duration: '.25',
								easing: Y.Easing.easeOut
							});
							anim.on('end', function() {
								li.get('parentNode').removeChild(li);
							});
							anim.run();
						});
						//Run the animation
						anim.run();
						break;
					case 'pref':
						e.preventDefault();
						e.stopPropagation();
						var li = g_li = div.get('parentNode'),
							id = li.get('id'),
							dd = Y.DD.DDM.getDrag('#' + id),
							data = dd.get('data');

						var content = getContent(data);
						var title = g_li.getData('data').dtitle;
						title = (undefined !== title) ? title : g_li.getData('data').title;
						nestedPanel = showpanel(title, true);
						nestedPanel.show();

						nestedPanel.on('init', onPanelInit, {
							bTitlePref: true
						});

						break;
					case 'clone':
						var li = div.get('parentNode'),
							ul = li.get('parentNode'),
							id = li.get('id'),
							dd = Y.DD.DDM.getDrag('#' + id),
							data = dd.get('data');
						a = li.insert(li.cloneNode(true), 'after');
						var newli = li.get('nextSibling');

						if ('tabs' === data.type || 'accs' === data.type) {
							newli.all('*[role]').each(function(b) {
								b.removeAttribute('role');
								b.removeAttribute('aria-labeledby');
								b.removeAttribute('aria-controls');
								b.removeAttribute('aria-hidden');
							});
						}
						newli.all('*[id^="yui"]').removeAttribute('id');

						initClonedDD(newli);
						var wdgts = newli.all('.cwspb_widgets li.item');
						if (wdgts.size()) {
							wdgts.each(function(b) {
								// id cloned too
								initClonedDD(b);
							});
						}

						var a_yui = newli.all('*[id^="yui"]');
						if (a_yui.size()) {
							a_yui.each(function(b) {
								b.removeAttribute('id');
							});
						}
						a_yui = li.all('h4 *[id^="yui"]');
						if (a_yui.size()) {
							a_yui.each(function(b) {
								b.removeAttribute('id');
							});
						}
						break;
				}
				//Stop the click
				e.halt();
			}
		};

		var _switchTextEditor = function(e) {
			e.stopPropagation();
			e.preventDefault();
			var qttb = w_node.one('.cws-pb-tmce>.quicktags-toolbar');
			var textarea = w_node.one('.wp-editor-area');
			if ('tmce' == e.target.getData('mode') ) {
				var textareaid = textarea.get('id');
				if (!qttb) {
					var qt = quicktags( window.tinyMCEPreInit.qtInit[textareaid] );
					quicktags({id:textareaid, buttons: "strong,em,link,block,del,ins,img,ul,ol,li,code,more,close"});
					QTags._buttonsInit();
				} else {
					qttb.show();
				}

				var iframe = tinymce.DOM.get(nestedPanel.bodyNode.one('iframe').get('id'));
				var editorHeight = iframe ? parseInt( iframe.style.height, 10 ) : 0;

				if ( editorHeight ) {
					var toolbarHeight = nestedPanel.bodyNode.one('.mce-toolbar-grp').get('clientHeight');
					editorHeight = editorHeight + toolbarHeight - 14;

					// height cannot be under 50 or over 5000
					if ( editorHeight > 50 && editorHeight < 5000 ) {
						textarea.setStyle('height', editorHeight);
					}
				}

				w_node.one('.cws-pb-tmce>div').hide();
				w_node.one('.cws-pb-tmce>textarea').show();

				var html = window.switchEditors.pre_wpautop( tinyMCE.activeEditor.getContent({format: 'html'}) );
				textarea.set('value', html);

				e.target.set('innerHTML', 'Switch to Visual');

				e.target.setData('mode', 'html');
			} else {
				w_node.one('.cws-pb-tmce>div').show();
				w_node.one('.cws-pb-tmce>textarea').hide();
				qttb.hide();
				tmce_content = window.switchEditors.wpautop( textarea.get('value') );
				tinyMCE.activeEditor.setContent(tmce_content, {format: 'html'});

				e.target.set('innerHTML', 'Switch to Text');
				e.target.setData('mode', 'tmce');
				setTimeout(function () {
						if (window.scrollY !== scry) {
							window.scrollTo(scrx, scry);
						}
					}, 5);
			}
		};

		var onPanelInit = function(e) {
			var data = g_li.getData('data');
			var type = data.type;
			g_li.setData('bTitlePref', this.bTitlePref);
			var template = (false === this.bTitlePref || 'text' === type) ? type : (data.wtitle) ? 'col-title' : 'col';
			if ('col-title' == template && 'accs' == data.type) {
				template = 'accs-title';
			}

			var wb = Y.one('.yui3-widget-bd');
			w_node = wb.append(Y.one('#cws-pb-' + template).cloneNode(true).show());

			if (null !== wb.one('#cws-switch-text')) {
				wb.one('#cws-switch-text').on('click', _switchTextEditor);
			}

			if (w_node.one('textarea')) {
				w_node.one('textarea').set('id', w_node._yuid);
			}
			switch (template) {
				case 'text':
					var text_block = (null !== g_li.one('.inner')._node.getAttribute('data-cws-raw') ) ? g_li.one('.inner')._node.getAttribute('data-cws-raw') : g_li.one('.inner').get('innerHTML');
					_inittmce(w_node, text_block);
					wb.one('input[name="title"]').set('value', g_li.getAttribute('cws-title'));
					break;
				case 'tabs':
					text_block = (null !== this.cfg.get('panelNode')._node.getAttribute('data-cws-raw')) ?
							this.cfg.get('panelNode')._node.getAttribute('data-cws-raw') : this.cfg.get('content');
					_inittmce(w_node, text_block);
					wb.one('input[name="title"]').set('value', this.cfg.get('label'));
					break;
				case 'accs':
					current_acc = g_li.getData('accs').section_list[this.cfg];
					text_block = (null !== current_acc.content._node.getAttribute('data-cws-raw')) ?
							current_acc.content._node.getAttribute('data-cws-raw') : current_acc.content.one('>div').get('innerHTML');
					_inittmce(w_node, text_block);
					wb.one('input[name="title"]').set('value', current_acc.title.one('a:first-child').get('innerText'));
					break;
				default:
					var dtitle = g_li.getAttribute('cws-title');
					var e_style = wb.one('select[name="extra_style"]');
					if (e_style) {
						e_style.set('value', g_li.getData('extra_style'));
					}
					if (dtitle.length) {
						wb.one('input[name="title"]').set('value', dtitle);
					}
					break;
			}

			wb.all('input').each(function(v, k) {
				if (undefined !== g_li.getData(v.get('name')) && 'title' !== v.get('name') ) {
					if ('checkbox' == v.getAttribute('type')) {
						v.set('checked', g_li.getData(v.get('name')));
					} else {
						v.set('value', g_li.getData(v.get('name')));
					}
				}
			});
			document.getElementById('pb_overlay').style.display = 'block';
		}

		var getFilteredTmceContent = function(textmode) {
			var obj = '';
			if ('html' === textmode) {
				obj = window.switchEditors.wpautop(nestedPanel.bodyNode.one('.wp-editor-area').get('value'));
			} else {
				//obj = tinyMCE.activeEditor.getContent({format: 'html'});
				obj = tinyMCE.activeEditor.getContent({format: 'raw'});
			}
			/*obj = obj.replace(/<p><\/p>/g, '<br>');
			obj = obj.replace(/<div>&nbsp;<\/div>/g, '<br>');*/
			return obj;
		}

		var panx, pany;
		var scrx, scry;

		var showpanel = function(title) {
			if (null === nestedPanel) {
				scrx = ( window.scrollX || window.pageXOffset );
				scry = ( window.scrollY || window.pageYOffset );

				nestedPanel = new Y.Panel({
					//srcNode		 : content,
					headerContent: title,
					bodyContent: '',
					width: 800,
					//height: ,
					zIndex: 6000,
					x: panx + scrx,
					y: pany + scry,
					visible: false,
					modal: true,
					render: document.body,
					buttons: [{
						value: 'Apply',
						section: Y.WidgetStdMod.FOOTER,
						action: function(e) {
							e.preventDefault();
							var wb;
							var bSkipTitle = false;
							var w_type = g_li.getData('data').type;
							var switch_text = this.bodyNode.one('#cws-switch-text')
							var textmode = switch_text ? switch_text.getData('mode') : null;
							if (false === g_li.getData('bTitlePref') || 'text' == w_type) {
								switch (w_type) {
									case 'col':

										break;
									case 'text':
										var obj = getFilteredTmceContent(textmode);
										process_sc(obj, g_li.one('.inner'));
										//var mod_inner = g_li.one('.inner');
										//mod_inner.empty().append(textblock_c);
										//if ( crc32(obj) != crc32(textblock_c) ) {
											// save raw content as data attribute
										//	mod_inner._node.setAttribute('data-cws-raw', obj);
										//}

										//g_li.one('.inner').empty().append(obj);
										//data.title = wb.one('input[name="title"]').get('value');
										break;
									case 'tabs':
										wb = Y.one('.yui3-widget-bd');
										obj = getFilteredTmceContent(textmode);
										process_sc(obj, current_tab.get('panelNode'));
										/*current_tab.set('content', textblock_c);
										if ( crc32(obj) != crc32(textblock_c) ) {
											current_tab.get('panelNode')._node.setAttribute('data-cws-raw', obj);
										}*/
										current_tab.set('label', wb.one('input[name="title"]').get('value'));
										bSkipTitle = true;
										break;
									case 'accs':
										wb = Y.one('.yui3-widget-bd');
										obj = getFilteredTmceContent(textmode);
										process_sc(obj, current_acc.content);
										/*current_acc.content.one('>div').set('innerHTML', obj);
										if ( crc32(obj) != crc32(textblock_c) ) {
											current_acc.content._node.setAttribute('data-cws-raw', obj);
										}*/
										current_acc.content.get('parentNode').get('parentNode')
											.one('#' + current_acc.content.get('parentNode').get('aria-labeledby') + ' a')
											.set('innerText', wb.one('input[name="title"]').get('value'));
										bSkipTitle = true;
										break;
								}
							}
							// save all extra features
							this.bodyNode.all('input,select').each(function(v, k) {
								g_li.setData(v.get('name'), v.get('value'));
								switch (v.get('name')) {
									case 'title':
										if (!bSkipTitle) {
											var data = g_li.getData('data');
											var title_old = data.title;
											data.title = v.get('value');
											g_li.setAttribute('cws-title', v.get('value'));
											g_li.one('h4>strong').set('innerText', v.get('value'));
											g_li.setData('data', data);
										}
										break;
									case 'istoggle':
										g_li.getData('accs').set('allowMultipleOpen', v.get('checked'));
										g_li.setData(v.get('name'), v.get('checked'));
										break;
								}
							});
							//removeItems();
						}
					}, {
						value: 'Close',
						section: Y.WidgetStdMod.FOOTER,
						action: function(e) {
							e.preventDefault();
							//tinymce.execCommand('mceRemoveControl', true, 'cws-pb-content');
							if (editor !== undefined && editor.getContentAreaContainer() != null ) {
								tmceh = editor.getContentAreaContainer().firstChild.clientHeight;
							}
							tinymce.remove('textarea#' + w_node._yuid);
							nestedPanel.hide();
							document.getElementById('pb_overlay').style.display = 'none';
							//w_node.remove();
							//nestedPanel = null;
						}
					}]
				});
				nestedPanel.plug(Y.Plugin.Drag, {
					handles: ['.yui3-widget-hd']
				});
			} else {
				//nestedPanel.set('srcNode', content);
				nestedPanel.set('width', 500);
				nestedPanel.set('headerContent', title);
			}
			nestedPanel.on('visibleChange', function(e) {
				if (false === e.newVal) {
					setTimeout(function() {
						nestedPanel.destroy(false);
						nestedPanel = null;
					}, 15);
				}
			});
			nestedPanel.on('focusedChange', function(e, el) {
				// otherwise shortcode dialogs inputs wouldn't get focus
				e.preventDefault();
			});
			return nestedPanel;
		}

		var tmceh = 500;
		var editor;

		var _inittmce = function(w_node, content) {
			if (tinymce.editors.length == 0) {
				switchEditors.switchto(document.getElementById('content-tmce'));
			}
			tinymce.init({
				selector: 'textarea#' + w_node._yuid,
				//theme: "modern",
				content_css: tinyMCE.editors[0].settings.content_css,
				resize: true,
				height: tmceh,
				init_instance_callback: function(ed) {
					setTimeout(function () {
						if (window.scrollY !== scry) {
							window.scrollTo(scrx, scry);
						}
					}, 5);
				},
				external_plugins: tinyMCE.editors[0].settings.external_plugins,
				plugins: tinyMCE.editors[0].settings.plugins,
				toolbar1: tinyMCE.editors[0].settings.toolbar1,
				toolbar2: tinyMCE.editors[0].settings.toolbar2,
				toolbar3: tinyMCE.editors[0].settings.toolbar3,
				setup: function(editor) {
					editor.on('init', function(e) {
						editor.setContent(content);
					});
					editor.on('focus', function(e) {
						if (window.scrollY !== scry) {
							window.scrollTo(scrx, scry);
						}
					});
				}
			});
			editor = tinymce.editors[tinymce.editors.length - 1];
		}

		var getContent = function(data) {
			//var id_name =
			return 'w_' == data.id.substring(0, 2) ? '#cws-pb-' + data.id : '#cws-pb-cols';
		}

		var initClonedDD = function(node, isnew) {
			isnew = typeof isnew !== 'undefined' ? isnew : false;
			var id = node.getData('id');
			var data = 'w_' == id.substring(0, 2) ? widgets[id] : feeds[id];
			node.removeAttribute('id');
			node.removeAttribute('class').addClass('item');
			//node.setData('data', data);
			if (!isnew) {
				if ('tabs' == data.type) {
					// need to remove + tab first
					var plus_tab = node.one('li[title="add a tab"]');
					plus_tab.get('parentNode').removeChild(plus_tab);
					node.all('li.yui3-tab div.control_panel').remove();
					var tabview = new Y.TabView({
						srcNode: node.one('.cws-pb-tabs'),
						plugins: [Addable, Removeable]
					});
					tabview.render(node.one('.inner'));
					node.setData('tabs', tabview);
				} else if ('accs' === data.type) {
					node.one('.cws-pb-accs-content>div:last-of-type').remove();
					node.one('.cws-pb-accs-content>div:last-of-type').remove();
					node.all('.yui3-acc-remove').remove();
					node.all('.yui3-pref').remove();
					var acc = node.one('.cws-pb-accs').get('parentNode');
					node.one('.yui3-accordion>ul').appendTo(acc);
					node.one('.yui3-accordion').remove();
					var ul_acc = node.one('ul.cws-pb-accs-content');
					var ul_li;
					ul_acc.all('>div[class^="yui3"]').each(function() {
						if (this.hasClass('yui3-accordion-title')) {
							ul_li = Y.Node.create('<li></li>');
							ul_acc.insert(ul_li);
						}
						if (this.hasClass('yui3-accordion-section-clip')) {
							ul_acc.all('>div[class^="yui3"]').item(0).one('>div>div').appendTo(ul_li);
						} else {
							ul_acc.all('>div[class^="yui3"]').item(0).one('>div').appendTo(ul_li);
						}
						this.remove();
					});
					var srcNode = node.one('.cws-pb-accs');
					var vm = new Y.Accordion({
						srcNode: node.one('.cws-pb-accs-content'),
						replaceTitleContainer: false,
						animateOpenClose: false,
						animateInsertRemove: false,
						replaceSectionContainer: false,
						plugins: [AddableAcc, RemoveableAcc]
					});
					Y.delegate('click', onTitleClicked, srcNode, '.yui3-accordion-title', null, vm);
					//accordions.push(vm);
					node.setData('accs', vm);
					vm.render(srcNode);
				}
			}

			var groups = 'cols' == data.id.substring(0, 4) ? ['cols'] : ['widgets']
			var dd = new Y.DD.Drag({
				node: node,
				data: data,
				groups: groups,
				bubbleTargets: Y.Portal
			});
			dd.plug(Y.Plugin.DDProxy, {
				moveOnEnd: false,
				cloneNode: true,
				borderStyle: 'none'
			});

			uls = node.all('.cwspb_widgets>ul');
			uls.each(function(v, k) {
				var tar = new Y.DD.Drop({
					node: v,
					padding: '5',
					groups: ['widgets'],
					bubbles: Y.Portal
				});
			});
			//Setup some stopper events
			dd.on('drag:start', _handleStart);
			dd.on('drag:end', stopper);
			dd.on('drag:drophit', stopper);

			dd.set('node', node);
			dd.set('dragNode', Y.DD.DDM._proxy);
			setupModDD(node, data, dd);
		};

		//This creates the module, either from a drag event or from the cookie load
		var setupModDD = function(mod, data, dd) {
			var node = mod;
			//Listen for the click so we can react to the buttons
			node.setData('data', data);
			node.one('h4').on('click', _nodeClick);
			node.one('h4').on('change', _nodeSelect);

			//Remove the event's on the original drag instance
			dd.detachAll('drag:start');
			dd.detachAll('drag:end');
			dd.detachAll('drag:drophit');

			//It's a target
			dd.set('target', true);
			//Setup the handles
			dd.addHandle('h4').addInvalid('a');
			//Remove the mouse listeners on this node
			dd._unprep();
			//Update a new node
			dd.set('node', mod);
			//Reset the mouse handlers
			dd._prep();
		};

		function onTitleClicked(e, a) {
			//var bToggle = 'on' === a._parentNode.get('parentNode').get('parentNode').get('parentNode').getData('istoggle') ? true : false;
			var i = a.findSection(e.target);
			if (i >= 0) {
				a.toggleSection(i);
			}
		}

		var updateMod = function(new_data, old_li) {
			// first we need to determine
			// should we delete some cols or add them
			// if delete - check if there're any modules inside
			// and move them to the first one
			// if we add, then update spans if necessary
			// and just add some columns
			var id = old_li.get('id'),
				dd = Y.DD.DDM.getDrag('#' + id),
				old_data = dd.get('data'),
				n_colnum = parseInt(new_data.id.substring(4, 5)),
				colconf = new_data.id.substring(5),
				o_colnum = parseInt(old_data.id.substring(4, 5)),
				first_col = old_li.one('.cwspb_widgets>ul');
			n_colnum = (colconf.length) || parseInt(new_data.id.substring(4, 5));
			o_colnum = (old_data.id.substring(5).length) || parseInt(old_data.id.substring(4, 5));
			if (n_colnum < o_colnum) {
				// need to check for modules and move
				// them all to first column
				var k = n_colnum+1;
				for (var i = k; i<=o_colnum; i++) {
					var curr_col = old_li.one('.cwspb_widgets>ul:nth-child(' + k + ')');
					curr_col.all('>li').each(function(el2) {
						first_col.appendChild(el2);
					});
					curr_col.get('parentNode').removeChild(curr_col);
				}
			} else if (n_colnum > o_colnum) {
				// we should just add columns
				var k = n_colnum - o_colnum;
				var str = ''
				for (var i=0; i<k; i++) {
					str += '<ul class="item span12"></ul>'
				}
				var a = Y.Node.create(str);
				old_li.one('.cwspb_widgets').appendChild(a);
				var uls = old_li.all('.cwspb_widgets>ul');
				uls.each(function(v, k) {
					var tar = new Y.DD.Drop({
						node: v,
						padding: '5',
						groups: ['widgets'],
						bubbles: Y.Portal
					});
				});
			}
			// now update spans
			old_li.all('.cwspb_widgets ul.item').each( function(el1, c) {
				var span = colconf.length ? 12 * parseInt(colconf[c], 16) / (n_colnum+1) : 12 / n_colnum;
				el1._node.className = el1._node.className.replace(/(span[0-9]+)/g, 'span' + span);
			});

			dd.set('data', new_data);
			old_li.setData('data', new_data);
			//old_li.one('h4 strong').set('innerText', new_data.title);
			old_li.setData('id', new_data.id);

			//Resync all the targets because something moved..
			Y.Lang.later(50, Y, function() {
				Y.DD.DDM.syncActiveShims(true);
			});
		}

		var accordions = [];

		//Helper method to create the markup for the module..
		var createMod = function(data, isnew) {
			isnew = typeof isnew !== 'undefined' ? isnew : false;
			var type = data.type;
			if ('col' == type) {
				var colnum = parseInt(data.id.substring(4, 5));
				var colconf = data.id.substring(5);
				var span = '';
				var str_inner = '<div class="cwspb_widgets">'
				if (colconf.length) {
					for (var i = 0; i < colconf.length; i++) {
						span = 12 * parseInt(colconf[i], 16) / colnum;
						str_inner += '<ul class="item span' + span + '"></ul>';
					}
				} else {
					span = 12 / colnum;
					for (var i = 0; i < colnum; i++) {
						str_inner += '<ul class="item span' + span + '"></ul>';
					}
				}

				str_inner += '</div>';
			} else {
				switch (data.type) {
					case 'text':
						str_inner = isnew ? '<div></div>' : '<p>Some content here depending on data type</p>';
						break;
					case 'tabs':
						str_inner = isnew ? '<div class="cws-pb-tabs"><ul></ul><div></div></div>' : '<div class="cws-pb-tabs">\
						<ul>\
							<li><a href="#tab1">Tab 1</a></li>\
							<li><a href="#tab2">Tab 2</a></li>\
						</ul>\
						<div>\
						<div id="tab1"><p>Tab 1 content</p></div>\
						<div id="tab2"><p>Tab 2 content</p></div>\
						</div>\
					</div>';
						break;
					case 'accs':
						str_inner = '<div class="cws-pb-accs"></div><ul class="cws-pb-accs-content">'
						str_inner += isnew ? '</ul>' : '<li>\
								<div><a href="javascript:void(0);">#1</a></div>\
								<div><p>testing</p></div>\
							</li>\
							<li>\
								<div><a href="javascript:void(0);">#2</a></div>\
								<div><p>testing testing</p></div>\
							</li>\
						</ul>';
						break;

				}
			}

			if (undefined === data.title) {
				data.title = '';
			}
			var dtitle = data.dtitle !== undefined ? data.dtitle + ':' : '';
			if ('col' == type) {
				var sel_col = '<label><select>';
				Y.each(feeds, function(v, k) {
					var issel = (data.id === v.id) ? ' selected' : '';
					sel_col += '<option value="'+ v.id.substring(4) +'"' + issel + '>'+ v.title +' Column</option>'
				});
				sel_col += '</select></label>';

				var str = '<li class="item" data-id="' + data.id + '">' +
					'<div class="mod">' +
					'<h4>' +
					'<div class="control_panel">' +
					'<a title="close module" class="close" href="#"></a>' +
					'<a title="minimize module" class="min" href="#"></a>' +
					'<a title="pref module" class="pref" href="#"></a>' +
					'<a title="clone module" class="clone" href="#"></a>' +
					'</div>' +
					dtitle + sel_col +
					'</h4><div class="inner">';
			} else {
				var str = '<li class="item" data-id="' + data.id + '">' +
					'<div class="mod">' +
					'<h4>' +
					'<div class="control_panel">' +
					'<a title="close module" class="close" href="#"></a>' +
					'<a title="minimize module" class="min" href="#"></a>' +
					'<a title="pref module" class="pref" href="#"></a>' +
					'<a title="clone module" class="clone" href="#"></a>' +
					'</div>' +
					dtitle + '<strong></strong>' +
					'</h4><div class="inner">';
			}

			str += str_inner;
			str += '</div></div></li>';
			var a = Y.Node.create(str);
			if ('tabs' == data.type) {
				if (!isnew) {
					var tabview = new Y.TabView({
						srcNode: a.one('.cws-pb-tabs'),
						plugins: [Addable, Removeable]
					});
				} else {
					var tabview = new Y.TabView({
						srcNode: a.one('.cws-pb-tabs')
					});
				}
				tabview.render(a.one('.inner'));
				a.setData('tabs', tabview);
			} else if ('accs' == data.type) {
				var srcNode = a.one('.cws-pb-accs');
				var vm = new Y.Accordion({
					srcNode: a.one('.cws-pb-accs-content'),
					replaceTitleContainer: false,
					animateOpenClose: false,
					animateInsertRemove: false,
					replaceSectionContainer: false,
					plugins: [AddableAcc, RemoveableAcc]
				});
				Y.delegate('click', onTitleClicked, srcNode, '.yui3-accordion-title', null, vm);
				//accordions.push(vm);
				a.setData('accs', vm);
				vm.render(srcNode);
			}
			return a;
		};

		//Handle the start Drag event on the left side
		var _handleStart = function(e) {
			//Stop the event
			stopper(e);
			//Some private vars
			var drag = this,
				column_1st = null;
			/*		debugger
					delete data;
					data = {};*/
			//drag.get('data').title = '';
			var mod = createMod(drag.get('data'));
			if ('cols' == drag.get('data').id.substring(0, 4)) {
				column_1st = Y.one('#cws_row');
			} else {
				column_1st = Y.one('.cwspb_widgets>ul');
			}
			if (!column_1st) {
				// Empty row placeholder, should prolly add one
				var row = createMod(feeds['cols1']);
				Y.one('#cws_row').appendChild(row);
				initClonedDD(row);
				column_1st = Y.one('.cwspb_widgets>ul');
			}
			if (column_1st) {
				//Add it to the first list
				//column_1st.appendChild(mod);
				column_1st.insertBefore(mod, column_1st._node.firstChild);
				//Set the item on the left column disabled.
				//drag.get('node').addClass('disabled');
				//Set the node on the instance
				drag.set('node', mod);
				//Add some styles to the proxy node.
				drag.get('dragNode').setStyles({
					opacity: '.5',
					borderStyle: 'none',
					zIndex: '100000000',
					width: '320px',
					height: '61px'
				});
				//Update the innerHTML of the proxy with the innerHTML of the module
				drag.get('dragNode').set('innerHTML', drag.get('node').get('innerHTML'));
				//set the inner module to hidden
				drag.get('node').one('div.mod').setStyle('visibility', 'hidden');
				//add a class for styling
				drag.get('node').addClass('moving');
				//Setup the DD instance
				setupModDD(mod, drag.get('data'), drag);

				//Remove the listener
				this.detach('drag:start', _handleStart);
			}
		};

		//Walk through the feeds list and create the list on the left
		var feedList = Y.one('#feeds ul#feeds-cols');
		Y.each(feeds, function(v, k) {
			var li = Y.Node.create('<li id="' + k + '">' + v.title + '</li>');
			feedList.appendChild(li);
			//Create the DD instance for this item
			_createFeedDD(li);
		});
		feedList = Y.one('#feeds ul#feeds-modules');
		Y.each(widgets, function(v, k) {
			var li = Y.Node.create('<li id="' + k + '">' + v.dtitle + '</li>');
			feedList.appendChild(li);
			//Create the DD instance for this item
			_createFeedDD(li);
		});

		//This does the calculations for when and where to move a module
		var _moveMod = function(drag, drop) {
			if (drag.get('node').hasClass('item')) {
				var dragNode = drag.get('node'),
					dropNode = drop.get('node');

				var n_parent = dropNode.get('parentNode');
				if (dropNode && n_parent) {
					if (goingUp) {
						n_parent.insertBefore(dragNode, dropNode);
					} else {
						n_parent.appendChild(dragNode);
					}
				}
				//Resync all the targets because something moved
				Y.Lang.later(50, Y, function() {
					Y.DD.DDM.syncActiveShims(true);
				});
			}
		};

	/*
	Handle the drop:enter event
	Now when we get a drop enter event, we check to see if the target is an LI, then we know it's our module.
	Here is where we move the module around in the DOM.
	*/
		Y.Portal.on('drop:enter', function(e) {
			if (!e.drag || !e.drop || (e.drop !== e.target)) {
				return false;
			}
			var node = e.drop.get('node')
			if ( node.get('tagName').toLowerCase() === 'li' && node.hasClass('item') ) {
				_moveMod(e.drag, e.drop);
			}
		});

		//Handle the drag:drag event
		//On drag we need to know if they are moved up or down so we can place the module in the proper DOM location.
		Y.Portal.on('drag:drag', function(e) {
			var y = e.target.mouseXY[1];
			if (y < lastY) {
				goingUp = true;
			} else {
				goingUp = false;
			}
			lastY = y;
		});

		/*
	Handle the drop:hit event
	Now that we have a drop on the target, we check to see if the drop was not on a LI.
	This means they dropped on the empty space of the UL.
	*/
		Y.Portal.on('drag:drophit', function(e) {
			var drop = e.drop.get('node'),
				drag = e.drag.get('node');

			if (drop.get('tagName').toLowerCase() !== 'li') {
				drop.appendChild(drag);
			}
		});

		//Handle the drag:start event
		//Use some CSS here to make our dragging better looking.
		Y.Portal.on('drag:start', function(e) {
			var drag = e.target;
			if (drag.target) {
				drag.target.set('locked', true);
			}
			drag.get('dragNode').set('innerHTML', drag.get('node').get('innerHTML'));
			drag.get('dragNode').setStyle('opacity', '.5');
			drag.get('dragNode').setStyle('z-index', '100000001');
			drag.get('node').one('div.mod').setStyle('visibility', 'hidden');
			drag.get('node').addClass('moving');
		});

		//Handle the drag:end event
		//Replace some of the styles we changed on start drag.
		Y.Portal.on('drag:end', function(e) {
			var drag = e.target;
			if (drag.target) {
				drag.target.set('locked', false);
			}
			drag.get('node').setStyle('visibility', '');
			drag.get('node').one('div.mod').setStyle('visibility', '');
			drag.get('node').removeClass('moving');
			drag.get('dragNode').set('innerHTML', '');

			// mas: make a left item draggable again
			var dd = Y.DD.DDM.getDrag('#' + drag.get('node').get('id')),
				data = dd.get('data'),
				item = Y.one('#' + data.id);
			_createFeedDD(item);

			uls = drag.get('node').all('.cwspb_widgets>ul');
			uls.each(function(v, k) {
				var tar = new Y.DD.Drop({
					node: v,
					padding: '5',
					groups: ['widgets'],
					bubbles: Y.Portal
				});
			});
			//_setCookies();
		});

		//Handle going over a UL, for empty lists
		Y.Portal.on('drop:over', function(e) {
			var drop = e.drop.get('node'),
				drag = e.drag.get('node');
			if (drop.get('tagName').toLowerCase() !== 'li') {
				if (!drop.contains(drag)) {
					drop.appendChild(drag);
					//drop.insertBefore(drag, drop.firstChild);
					Y.Lang.later(50, Y, function() {
						Y.DD.DDM.syncActiveShims(true);
					});
				}
			}
		});

		//Create simple targets for the main lists..
		var uls = Y.all('#cws_row ul.list');
		uls.each(function(v, k) {
			var tar = new Y.DD.Drop({
				node: v,
				groups: ['cols'],
				padding: '20 0',
				bubbles: Y.Portal
			});
		});

		//Get the cookie data

	});

jQuery(document).ready(function (){
	jQuery(document).on( "click", ".elements_panel .tabs a", function (){
		jQuery(this).addClass("active").siblings("a").removeClass("active");
	});
});