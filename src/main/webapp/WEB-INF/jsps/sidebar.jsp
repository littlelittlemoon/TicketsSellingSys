<%--
  Created by IntelliJ IDEA.
  User: LUOLIANG
  Date: 2016/5/16
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div class="sidebar sidebar-fixed" id="sidebar">
    <ul class="nav nav-list">
        <li class="active">
            <a href="#">
                <i class="icon-dashboard"></i>
                <span class="menu-text"> 首页 </span>
            </a>
        </li>
        <li>
            <a href="#" class="dropdown-toggle">
                <i class="icon-desktop"></i>
                <span class="menu-text"> 前台业务 </span>
                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <li>
                    <a href="SaleOfTickets.html">
                        <i class="icon-double-angle-right"></i> 售票业务
                    </a>
                </li>
                <li>
                    <a href="BookTheTickets.html">
                        <i class="icon-double-angle-right"></i> 订票业务
                    </a>
                </li>
                <li>
                    <a href="EndorseTheTickets.html">
                        <i class="icon-double-angle-right"></i> 改签业务
                    </a>
                </li>

                <li>
                    <a href="ReturnTheTickets.html">
                        <i class="icon-double-angle-right"></i> 退票业务
                    </a>
                </li>
            </ul>
        </li>

        <li>
            <a href="#" class="dropdown-toggle">
                <i class="icon-list"></i>
                <span class="menu-text"> 信息查询</span>

                <b class="arrow icon-angle-down"></b>
            </a>

            <ul class="submenu">
                <li>
                    <a href="SaleInfo.html">
                        <i class="icon-double-angle-right"></i> 售票信息查询
                    </a>
                </li>

                <li>
                    <a href="BookInfo.html">
                        <i class="icon-double-angle-right"></i> 订票信息查询
                    </a>
                </li>

                <li>
                    <a href="TimeInfo.html">
                        <i class="icon-double-angle-right"></i> 列车时刻表查询
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#" class="dropdown-toggle">
                <i class="icon-tag"></i>
                <span class="menu-text"> 票务管理 </span>

                <b class="arrow icon-angle-down"></b>
            </a>

            <ul class="submenu">
                <li>
                    <a href="ModifyTheTicketInfo.html">
                        <i class="icon-double-angle-right"></i> 修改车票信息
                    </a>
                </li>

                <li>
                    <a href="RecordTheTicketInfo.html">
                        <i class="icon-double-angle-right"></i> 录入车票信息
                    </a>
                </li>
            </ul>
        </li>

        <li>
            <a href="#" class="dropdown-toggle">
                <i class="icon-calendar"></i>
                <span class="menu-text"> 时刻表信息管理 </span>
                <b class="arrow icon-angle-down"></b>
            </a>

            <ul class="submenu">
                <li>
                    <a href="ModifyTheTimetable.html">
                        <i class="icon-double-angle-right"></i> 修改列车时刻表
                    </a>
                </li>

                <li>
                    <a href="RecordTheTimetable.html">
                        <i class="icon-double-angle-right"></i> 录入列车时刻表
                    </a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- /.nav-list -->

    <div class="sidebar-collapse" id="sidebar-collapse">
        <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
           data-icon2="icon-double-angle-right"></i>
    </div>

    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
    </script>
</div>
</body>
</html>
