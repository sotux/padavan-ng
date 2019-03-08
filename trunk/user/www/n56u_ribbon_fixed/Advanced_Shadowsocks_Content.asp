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
<% shadowsocks_status(); %>

var $j = jQuery.noConflict();

$j(document).ready(function () {
    init_itoggle('ss_enable');
});

function initial() {
    show_banner(2);
    show_menu(5, 11, 1);
    show_footer();

    fill_ss_status(shadowsocks_status());
    fill_ss_tunnel_status(shadowsocks_tunnel_status());
}

function applyRule() {
    showLoading();
    document.form.action_mode.value = " Restart ";
    document.form.current_page.value = "Advanced_Shadowsocks_Content.asp";
    document.form.next_page.value = "";
    document.form.submit();
}

function submitInternet(v) {
    showLoading();
    document.Shadowsocks_action.connect_action.value = v;
    document.Shadowsocks_action.current_page = "Advanced_Shadowsocks_Content.asp"
    document.Shadowsocks_action.submit();
}

function fill_ss_status(status_code) {
    var stext = "Unknown";
    if (status_code == 0)
        stext = "ss-redir&nbsp;&nbsp;&nbsp;<#Stopped#>";
    else if (status_code == 1)
        stext = "ss-redir&nbsp;&nbsp;&nbsp;<#Running#>";
    $("ss_status").innerHTML = '<span class="label label-' + (status_code != 0 ? 'success' : 'warning') + '">' + stext + '</span>';
}

function fill_ss_tunnel_status(status_code) {
    var stext = "Unknown";
    if (status_code == 0)
        stext = "ss-tunnel&nbsp;<#Stopped#>";
    else if (status_code == 1)
        stext = "ss-tunnel&nbsp;<#Running#>";
    $("ss_tunnel_status").innerHTML = '<span class="label label-' + (status_code != 0 ? 'success' : 'warning') + '">' + stext + '</span>';
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

            <input type="hidden" name="current_page" value="Advanced_Shadowsocks_Content.asp">
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
                                                    <th colspan="2" style="background-color: #E3E3E3;">
                                                        <#SHADOWSOCKS_Global#>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <th width="50%">
                                                        <#InetControl#>
                                                    </th>
                                                    <td style="border-top: 0 none;" colspan="2">
                                                        <input type="button" id="btn_connect_1" class="btn btn-info"
                                                            value=<#Connect#> onclick="submitInternet('Reconnect');">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <#running_status#>
                                                    </th>
                                                    <td colspan="2">
                                                        <div id="ss_status"></div>
                                                        <div id="ss_tunnel_status"></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <#SHADOWSOCKS_Enable#>
                                                    </th>
                                                    <td>
                                                        <div class="main_itoggle">
                                                            <div id="ss_enable_on_of">
                                                                <input type="checkbox" id="ss_enable_fake"
                                                                    <% nvram_match_x("", "ss_enable", "1", "value=1 checked"); %><% nvram_match_x("", "ss_enable", "0", "value=0"); %>>
                                                            </div>
                                                        </div>

                                                        <div style="position: absolute; margin-left: -10000px;">
                                                            <input type="radio" value="1" name="ss_enable"
                                                                id="ss_enable_1"
                                                                <% nvram_match_x("", "ss_enable", "1", "checked"); %>>
                                                            <#checkbox_Yes#>
                                                                <input type="radio" value="0" name="ss_enable"
                                                                    id="ss_enable_0"
                                                                    <% nvram_match_x("", "ss_enable", "0", "checked"); %>>
                                                                <#checkbox_No#>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2" style="background-color: #E3E3E3;">
                                                        <#SHADOWSOCKS_LocalConfig#>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th width="50%">
                                                        <#SHADOWSOCKS_LocalPort#>
                                                    </th>
                                                    <td>
                                                        <input type="text" maxlength="6" class="input" size="15"
                                                            name="ss_local_port" style="width: 145px"
                                                            value="<% nvram_get_x("", "ss_local_port"); %>">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th width="50%">MTU:</th>
                                                    <td>
                                                        <input type="text" maxlength="6" class="input" size="15"
                                                            name="ss_mtu" style="width: 145px"
                                                            value="<% nvram_get_x("", "ss_mtu"); %>">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2" style="background-color: #E3E3E3;">
                                                        <#SHADOWSOCKS_TunnelConfig#>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th width="50%">
                                                        <a class="help_tooltip"  href="javascript:void(0);" onmouseover="openTooltip(this, 26,1);"><#SHADOWSOCKS_TunnelRemoteHost#></a>
                                                    </th>
                                                    <td>
                                                        <input type="text" maxlength="32" class="input" size="64"
                                                            name="ss_tunnel_remote"
                                                            value="<% nvram_get_x("","ss_tunnel_remote"); %>" />
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <th width="50%">
                                                        <a class="help_tooltip"  href="javascript:void(0);" onmouseover="openTooltip(this, 26,2);"><#SHADOWSOCKS_TunnelLocalPort#></a>
                                                    </th>
                                                    <td>
                                                        <input type="text" maxlength="6" class="input" size="15"
                                                            name="ss_tunnel_local_port" style="width: 145px"
                                                            value="<% nvram_get_x("", "ss_tunnel_local_port"); %>">
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <th width="50%">MTU:</th>
                                                    <td>
                                                        <input type="text" maxlength="6" class="input" size="15"
                                                            name="ss_tunnel_mtu" style="width: 145px"
                                                            value="<% nvram_get_x("", "ss_tunnel_mtu"); %>">
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
        <input type="hidden" name="current_page" value="Advanced_Shadowsocks_Content.asp">
    </form>


</body>

</html>
