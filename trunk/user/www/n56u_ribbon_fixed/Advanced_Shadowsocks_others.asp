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
        init_itoggle('ss_router_proxy');
        init_itoggle('ss_reuse_port');
        init_itoggle('ss_udp');
        init_itoggle('ss_chromecast');
    });

    function initial() {
        show_banner(2);
        show_menu(5, 11, 3);
        show_footer();

        var o1 = document.form.ss_mode;
        o1.value = '<% nvram_get_x("","ss_mode"); %>';

        ss_mode_change();
    }

    function applyRule() {
        showLoading();
        document.form.action_mode.value = " Restart ";
        document.form.current_page.value = "Advanced_Shadowsocks_others.asp";
        document.form.next_page.value = "";
        document.form.submit();
    }

    function submitInternet(v) {
        showLoading();
        document.Shadowsocks_action.connect_action.value = v;
        document.Shadowsocks_action.current_page = "Advanced_Shadowsocks_others.asp"
        document.Shadowsocks_action.submit();
    }

    function textarea_gfwlist_extra_domain_enabled(v){
        inputCtrl(document.form['shdscks.gfwlist-extra-domain.conf'], v);
    }

    function textarea_gfwlist_extra_ip_enabled(v){
        inputCtrl(document.form['shdscks.gfwlist-extra-ip.conf'], v);
    }

    function textarea_gfwlist_apple_china_enabled(v){
        inputCtrl(document.form['shdscks.gfwlist-apple-china.conf'], v);
    }

    function ss_mode_change(){
        var ss_mode = document.form.ss_mode.value;
        var v = (ss_mode == "1") ? 1 : 0;
        showhide_div('row_gfwlist_top', v);
        showhide_div('row_gfwlist_upd', v);
        showhide_div('row_gfwlist_url', v);
        showhide_div('row_gfwlist_dns', v);
        showhide_div('row_gfwlist_extra_domain', v);
        showhide_div('row_gfwlist_extra_ip', v);
        showhide_div('row_gfwlist_apple_china', v);
        textarea_gfwlist_extra_domain_enabled(v);
        textarea_gfwlist_extra_ip_enabled(v);
        textarea_gfwlist_apple_china_enabled(v);
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
			<input type="hidden" name="current_page" value="Advanced_Shadowsocks_others.asp">
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
                                                        <a class="help_tooltip"  href="javascript:void(0);" onmouseover="openTooltip(this, 26,4);"><#SHADOWSOCKS_Adv_ProxyMode#></a>
                                                    </th>
                                                    <td>
                                                        <select name="ss_mode" class="input" onchange="ss_mode_change();" style="width: 145px;">
                                                            <option value="0"><#SHADOWSOCKS_Adv_GlobalMode#></option>
                                                            <option value="1">GFWList</option>
                                                            <!--option value="2">Chnroute</option-->
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <#SHADOWSOCKS_Adv_SelfProxy#>
                                                    </th>
                                                    <td>
                                                        <div class="main_itoggle">
                                                            <div id="ss_router_proxy_on_of">
                                                                <input type="checkbox" id="ss_router_proxy_fake"
                                                                    <% nvram_match_x("", "ss_router_proxy", "1", "value=1 checked"); %><% nvram_match_x("", "ss_router_proxy", "0", "value=0"); %>>
                                                            </div>
                                                        </div>

                                                        <div style="position: absolute; margin-left: -10000px;">
                                                            <input type="radio" value="1" name="ss_router_proxy"
                                                                id="ss_router_proxy_1"
                                                                <% nvram_match_x("", "ss_router_proxy", "1", "checked"); %>>
                                                            <#checkbox_Yes#>
                                                                <input type="radio" value="0" name="ss_router_proxy"
                                                                    id="ss_router_proxy_0"
                                                                    <% nvram_match_x("", "ss_router_proxy", "0", "checked"); %>>
                                                                <#checkbox_No#>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <#SHADOWSOCKS_Adv_ReusePort#>&nbsp;(Linux kernel > 3.9.0)
                                                    </th>
                                                    <td>
                                                        <div class="main_itoggle">
                                                            <div id="ss_reuse_port_on_of">
                                                                <input type="checkbox" id="ss_reuse_port_fake"
                                                                    <% nvram_match_x("", "ss_reuse_port", "1", "value=1 checked"); %><% nvram_match_x("", "ss_reuse_port", "0", "value=0"); %>>
                                                            </div>
                                                        </div>

                                                        <div style="position: absolute; margin-left: -10000px;">
                                                            <input type="radio" value="1" name="ss_reuse_port"
                                                                id="ss_reuse_port_1"
                                                                <% nvram_match_x("", "ss_reuse_port", "1", "checked"); %>>
                                                            <#checkbox_Yes#>
                                                                <input type="radio" value="0" name="ss_reuse_port"
                                                                    id="ss_reuse_port_0"
                                                                    <% nvram_match_x("", "ss_reuse_port", "0", "checked"); %>>
                                                                <#checkbox_No#>
                                                        </div>
                                                    </td>
                                                </tr>
												<tr>
                                                    <th>
                                                        <#SHADOWSOCKS_Adv_UdpProxy#>
                                                    </th>
                                                    <td>
                                                        <div class="main_itoggle">
                                                            <div id="ss_udp_on_of">
                                                                <input type="checkbox" id="ss_udp_fake"
                                                                    <% nvram_match_x("", "ss_udp", "1", "value=1 checked"); %><% nvram_match_x("", "ss_udp", "0", "value=0"); %>>
                                                            </div>
                                                        </div>

                                                        <div style="position: absolute; margin-left: -10000px;">
                                                            <input type="radio" value="1" name="ss_udp"
                                                                id="ss_udp_1"
                                                                <% nvram_match_x("", "ss_udp", "1", "checked"); %>>
                                                            <#checkbox_Yes#>
                                                                <input type="radio" value="0" name="ss_udp"
                                                                    id="ss_udp_0"
                                                                    <% nvram_match_x("", "ss_udp", "0", "checked"); %>>
                                                                <#checkbox_No#>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <#SHADOWSOCKS_Adv_Chromecast#>
                                                    </th>
                                                    <td>
                                                        <div class="main_itoggle">
                                                            <div id="ss_chromecast_on_of">
                                                                <input type="checkbox" id="ss_chromecast_fake"
                                                                    <% nvram_match_x("", "ss_chromecast", "1", "value=1 checked"); %><% nvram_match_x("", "ss_chromecast", "0", "value=0"); %>>
                                                            </div>
                                                        </div>

                                                        <div style="position: absolute; margin-left: -10000px;">
                                                            <input type="radio" value="1" name="ss_chromecast"
                                                                id="ss_chromecast_1"
                                                                <% nvram_match_x("", "ss_chromecast", "1", "checked"); %>>
                                                            <#checkbox_Yes#>
                                                                <input type="radio" value="0" name="ss_chromecast"
                                                                    id="ss_chromecast_0"
                                                                    <% nvram_match_x("", "ss_chromecast", "0", "checked"); %>>
                                                                <#checkbox_No#>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr id="row_gfwlist_top">
                                                    <th colspan="2" style="background-color: #E3E3E3;">GFWList</th>
                                                </tr>
                                                <tr id="row_gfwlist_upd">
                                                    <th width="50%">
                                                        <#SHADOWSOCKS_Adv_UpdateImmediate#>
                                                    </th>
                                                    <td style="border-top: 0 none;" colspan="2">
                                                        <input type="button" id="btn_connect_3" class="btn btn-info"
                                                            value=<#SHADOWSOCKS_Adv_Update#>
                                                        onclick="submitInternet('Update_gfwlist');">
                                                    </td>
                                                </tr>
                                                <tr id="row_gfwlist_url">
                                                    <th width="50%">
                                                        <#SHADOWSOCKS_Adv_GFWListURL#>
                                                    </th>
                                                    <td>
                                                        <input type="text" maxlength="72" class="input" size="64"
                                                            name="ss_gfwlist_url"
                                                            value="<% nvram_get_x("","ss_gfwlist_url"); %>" />
                                                    </td>
                                                </tr>
                                                <tr id="row_gfwlist_dns">
                                                    <th width="50%">
                                                        <#SHADOWSOCKS_Adv_UnblockedSitesDNS#>
                                                    </th>
                                                    <td>
                                                        <input type="text" maxlength="72" class="input" size="64"
                                                            name="ss_unblocked_sites_dns"
                                                            value="<% nvram_get_x("","ss_unblocked_sites_dns"); %>" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="row_gfwlist_extra_domain" colspan="2">
                                                        <a href="javascript:spoiler_toggle('spoiler_domain_conf')"><span><#CustomConf#> "gfwlist-extra-domain.conf"</span></a>
                                                        <div id="spoiler_domain_conf" style="display:none;">
                                                            <textarea rows="16" wrap="off" spellcheck="false" maxlength="4096" class="span12" name="shdscks.gfwlist-extra-domain.conf" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("shdscks.gfwlist-extra-domain.conf",""); %></textarea>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="row_gfwlist_extra_ip" colspan="2">
                                                        <a href="javascript:spoiler_toggle('spoiler_ip_conf')"><span><#CustomConf#> "gfwlist-extra-ip.conf"</span></a>
                                                        <div id="spoiler_ip_conf" style="display:none;">
                                                            <textarea rows="16" wrap="off" spellcheck="false" maxlength="4096" class="span12" name="shdscks.gfwlist-extra-ip.conf" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("shdscks.gfwlist-extra-ip.conf",""); %></textarea>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="row_gfwlist_apple_china" colspan="2">
                                                        <a href="javascript:spoiler_toggle('spoiler_apple_china_conf')"><span><#CustomConf#> "gfwlist-apple-china.conf"</span></a>
                                                        <div id="spoiler_apple_china_conf" style="display:none;">
                                                            <textarea rows="16" wrap="off" spellcheck="false" maxlength="4096" class="span12" name="shdscks.gfwlist-apple-china.conf" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("shdscks.gfwlist-apple-china.conf",""); %></textarea>
                                                        </div>
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
    
    <form method="post" name="Shadowsocks_action" action="/Advanced_Shadowsocks_action.asp" target="hidden_frame">
        <input type="hidden" name="connect_action" value="">
        <input type="hidden" name="current_page" value="Advanced_Shadowsocks_others.asp">
    </form>
</body>

</html>