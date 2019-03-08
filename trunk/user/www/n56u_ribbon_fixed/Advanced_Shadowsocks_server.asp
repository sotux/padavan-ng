<!DOCTYPE html>
<html>

<head>
	<title>
		<#Web_Title#> - <#menu5_13#>
	</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="-1">

	<link rel="shortcut icon" href="images/favicon.ico">
	<link rel="icon" href="images/favicon.png">
	<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
	<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">

	<script type="text/javascript" src="/jquery.js"></script>
	<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
	<script type="text/javascript" src="/state.js"></script>
	<script type="text/javascript" src="/general.js"></script>
	<script type="text/javascript" src="/itoggle.js"></script>
	<script type="text/javascript" src="/popup.js"></script>
	<script type="text/javascript" src="/help.js"></script>

	<script>
		var $j = jQuery.noConflict();

		$j(document).ready(function () {
		});

		function initial() {
			show_banner(2);
			show_menu(5, 11, 2);
			show_footer();

			var o1 = document.form.ss_method;
			var o2 = document.form.ss_plugin;
			var o3 = document.form.ss_plugin_opts;
			o1.value = '<% nvram_get_x("","ss_method"); %>';
			o2.value = '<% nvram_get_x("","ss_plugin"); %>';
			o3.value = '<% nvram_get_x("","ss_plugin_opts"); %>';
		}

		function applyRule() {
			showLoading();
			document.form.action_mode.value = " Restart ";
			document.form.current_page.value = "Advanced_Shadowsocks_server.asp";
			document.form.next_page.value = "";
			document.form.submit();
		}
	</script>

	<style>
		.nav-tabs>li>a {
			padding-right: 6px;
			padding-left: 6px;
		}
	</style>
</head>

<body onload="initial();" onunLoad="return unload_body();">

	<div class="wrapper">
		<div class="container-fluid" style="padding-right: 0px">
			<div class="row-fluid">
				<div class="span3">
					<center>
						<div id="logo"></div>
					</center>
				</div>
				<div class="span9">
					<div id="TopBanner"></div>
				</div>
			</div>
		</div>

		<div id="Loading" class="popup_bg"></div>

		<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
		<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
			<input type="hidden" name="current_page" value="Advanced_Shadowsocks_server.asp">
			<input type="hidden" name="next_page" value="">
			<input type="hidden" name="next_host" value="">
			<input type="hidden" name="sid_list" value="ShadowsocksConf;">
			<input type="hidden" name="group_id" value="">
			<input type="hidden" name="action_mode" value="">
			<input type="hidden" name="action_script" value="">

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span3">
						<!--Sidebar content-->
						<!--=====Beginning of Main Menu=====-->
						<div class="well sidebar-nav side_nav" style="padding: 0px;">
							<ul id="mainMenu" class="clearfix"></ul>
							<ul class="clearfix">
								<li>
									<div id="subMenu" class="accordion"></div>
								</li>
							</ul>
						</div>
					</div>

					<div class="span9">
						<!--Body content-->
						<div class="row-fluid">
							<div class="span12">
								<div class="box well grad_colour_dark_blue">
									<h2 class="box_head round_top">
										<#menu5_13#>
									</h2>
									<div class="round_bottom">
										<div class="row-fluid">
											<div id="tabMenu" class="submenuBlock"></div>
											<table width="100%" cellpadding="4" cellspacing="0" class="table">
												<tr>
													<th width="50%">
														<#SHADOWSOCKS_ServerIP#>
													</th>
													<td>
														<input type="text" maxlength="64" class="input" size="64"
															name="ss_server"
															value="<% nvram_get_x("","ss_server"); %>" />
													</td>
												</tr>
												<tr>
													<th width="50%">
														<#SHADOWSOCKS_ServerPassword#>
													</th>
													<td>
														<input type="password" maxlength="32" class="input" size="32"
															name="ss_password" id="ss_password"
															value="<% nvram_get_x("","ss_password"); %>" />
														<button style="margin-left: -5px;" class="btn" type="button"
															onclick="passwordShowHide('ss_password')"><i
																class="icon-eye-close"></i></button>
													</td>
												</tr>
												<tr>
													<th width="50%">
														<#SHADOWSOCKS_ServerPort#>
													</th>
													<td>
														<input type="text" maxlength="6" class="input" size="15"
															name="ss_server_port" style="width: 145px"
															value="<% nvram_get_x("","ss_server_port"); %>" />
													</td>
												</tr>
												<tr>
													<th width="50%">
														<#SHADOWSOCKS_ServerEncrypt#>
													</th>
													<td>
														<select name="ss_method" class="input" style="width: 200px;">
															<option value="rc4-md5">rc4-md5</option>
															<option value="aes-128-gcm">aes-128-gcm</option>
															<option value="aes-192-gcm">aes-192-gcm</option>
															<option value="aes-256-gcm">aes-256-gcm</option>
															<option value="aes-128-cfb">aes-128-cfb</option>
															<option value="aes-192-cfb">aes-192-cfb</option>
															<option value="aes-256-cfb">aes-256-cfb</option>
															<option value="aes-128-ctr">aes-128-ctr</option>
															<option value="aes-192-ctr">aes-192-ctr</option>
															<option value="aes-256-ctr">aes-256-ctr</option>
															<option value="camellia-128-cfb">camellia-128-cfb</option>
															<option value="camellia-192-cfb">camellia-192-cfb</option>
															<option value="camellia-256-cfb">camellia-256-cfb</option>
															<option value="bf-cfb">bf-cfb</option>
															<option value="chacha20-ietf-poly1305">
																chacha20-ietf-poly1305</option>
															<option value="xchacha20-ietf-poly1305">
																xchacha20-ietf-poly1305</option>
															<option value="salsa20">salsa20</option>
															<option value="chacha20">chacha20</option>
															<option value="chacha20-ietf">chacha20-ietf</option>
														</select>
													</td>
												</tr>
												<tr>
													<th width="50%">
														<#SHADOWSOCKS_ServerTimeout#>
													</th>
													<td>
														<input type="text" maxlength="6" class="input" size="15"
															name="ss_timeout" style="width: 145px"
															value="<% nvram_get_x("","ss_timeout"); %>" />
													</td>
												</tr>
												<tr>
													<th width="50%">
														<#SHADOWSOCKS_ServerObfs#>
													</th>
													<td>
														<select name="ss_plugin" class="input" style="width: 200px;">
															<option value="">none</option>
															<option value="obfs-local">obfs-local</option>
														</select>
													</td>
												</tr>
												<tr>
													<th width="50%">
														<a class="help_tooltip"  href="javascript:void(0);" onmouseover="openTooltip(this, 26,3);"><#SHADOWSOCKS_ServerObfsParam#></a>
													</th>
													<td>
														<input type="text" maxlength="72" class="input" size="64"
															name="ss_plugin_opts"
															value="<% nvram_get_x("","ss_plugin_opts"); %>" />
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<center><input class="btn btn-primary" style="width: 219px"
																type="button" value="<#CTL_apply#>"
																onclick="applyRule()" /></center>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<div id="footer"></div>
	</div>
</body>

</html>