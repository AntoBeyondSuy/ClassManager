<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/2/13
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/img/ilab.jpg">
    <title>MUC班级管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/js/gritter/css/jquery.gritter.css" />
    <link href="${pageContext.request.contextPath }/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/style-responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/assets/css/daterangepicker.css" rel="stylesheet">

    <!-- JavaScript for datePicker -->
    <script src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/daterangepicker.js"></script>
</head>

<body>

<section id="container" >
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a class="logo"><b>MUC班级管理系统</b></a>
        <!--logo end-->
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="${pageContext.request.contextPath }/userLogout">注销</a></li>
            </ul>
        </div>
    </header>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><img src="${pageContext.request.contextPath }/assets/img/avatar/<s:property value="#session.user.id" />.jpg" class="img-circle" width="60"></p>
                <h5 class="centered"><s:property value="#session.user.name" /></h5>

                <li class="mt">
                    <a href="${pageContext.request.contextPath }/userIndexUI">
                        <i class="fa fa-dashboard"></i>
                        <span>仪表盘</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-user"></i>
                        <span>成员</span>
                    </a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath }/userGetUndergraduate">本科</a></li>
                        <li><a href="${pageContext.request.contextPath }/userGetGraduate">研究生</a></li>
                        <li><a href="${pageContext.request.contextPath }/userGetAdmin">管理员</a></li>
                    </ul>
                </li>

                <li>
                    <a class="active" href="${pageContext.request.contextPath }/userCalendarUI">
                        <i class="fa fa-calendar"></i>
                        <span>日历</span>
                    </a>
                </li>


                <li class="sub-menu">
                    <a href="${pageContext.request.contextPath }/userNewsUI" >
                        <i class="fa fa-globe"></i>
                        <span>新闻</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="${pageContext.request.contextPath }/userWeeklyUI" >
                        <i class="fa fa-book"></i>
                        <span>周记</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-envelope"></i>
                        <span>消息</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="${pageContext.request.contextPath }/userMessageUI">收件箱</a></li>
                        <li><a  href="${pageContext.request.contextPath }/userSentMessageUI">已发送</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/userSettingsUI">
                        <i class="fa fa-cogs"></i>
                        <span>设置</span>
                    </a>
                </li>

            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <h3><i class="fa fa-angle-right"></i> 日历</h3>
            <!-- page start-->
            <div class="row mt">
                <aside class="col-lg-2 mt">
                    <h4><i class="fa fa-angle-right"></i> 事件</h4>
                    <div id="external-events">
                       <div class="external-event label label-info" style="padding: 15px;font-size: 100%">新事件</div>
                    </div>
                    <br /><br />
                    <h4><i class="fa fa-angle-right"></i> 添加</h4>
                    <button class="btn btn-primary btn-xs" style="padding: 10px;font-size: 100%;font-weight: bold" data-toggle="modal" data-target="#add"> 添加新事件</button>
                </aside>
                <aside class="col-lg-10 mt">
                    <section class="panel">
                        <div class="panel-body">
                            <div id="calendar" class="has-toolbar"></div>
                        </div>
                    </section>
                </aside>
            </div>
            <!-- page end-->
        </section>
        <!-- wrapper end -->
    </section>
    <!-- main content end-->

    <!-- iterator for Editing or Deleting Agenda-->
    <s:iterator value="#request.list_agenda" var="agenda" status="status">
        <div class="modal fade" id="agenda<s:property value="#agenda.aid" />" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">编辑</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <input type="hidden" name="userAgenda.aid" value="<s:property value="#agenda.aid" />">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">事务内容</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="userAgenda.title" placeholder="事务内容" value="<s:property value="#agenda.title" />" autofocus>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">起止时间</label>
                                <div class="col-sm-10">

                                    <form class="form-horizontal">
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <input type="text" readonly style="width: 200px" name="userAgenda.start" id="userAgenda<s:property value="#agenda.aid" />" class="form-control" value="<s:property value="#agenda.start" /> - <s:property value="#agenda.end" />" />
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>

                                    <script type="text/javascript">
                                        $(document).ready(function() {
                                            $('#userAgenda<s:property value="#agenda.aid" />').daterangepicker(null, function(start, end, label) {
                                                console.log(<s:property value="#agenda.start" />, <s:property value="#agenda.end" />, label);
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="editAgenda(this)">修改</button>
                        <button type="button" class="btn btn-danger" onclick="deleteAgenda(<s:property value="#agenda.aid" />)">删除</button>
                    </div>
                </div>
            </div>
        </div>
    </s:iterator>

    <!-- modal for Adding Agenda -->
    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">增加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">事务内容</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="userAgenda.title" placeholder="事务内容" autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">起止时间</label>
                            <div class="col-sm-10">

                                <form class="form-horizontal">
                                    <fieldset>
                                        <div class="control-group">
                                            <div class="controls">
                                                <input type="text" readonly style="width: 200px" name="userAgenda.start" id="userAgenda" class="form-control" />
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>

                                <script type="text/javascript">

                                    //日历格式转换
                                    Date.prototype.pattern=function(fmt) {
                                        var o = {
                                            "M+" : this.getMonth()+1, //月份
                                            "d+" : this.getDate(), //日
                                        };
                                        var week = {
                                            "0" : "/u65e5",
                                            "1" : "/u4e00",
                                            "2" : "/u4e8c",
                                            "3" : "/u4e09",
                                            "4" : "/u56db",
                                            "5" : "/u4e94",
                                            "6" : "/u516d"
                                        };
                                        if(/(y+)/.test(fmt)){
                                            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
                                        }
                                        if(/(E+)/.test(fmt)){
                                            fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);
                                        }
                                        for(var k in o){
                                            if(new RegExp("("+ k +")").test(fmt)){
                                                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
                                            }
                                        }
                                        return fmt;
                                    }

                                    //日历dateRangePicker插件初始化
                                    $(document).ready(function() {
                                        var date = new Date();
                                        $('#userAgenda').daterangepicker(null, function(start, end, label) {
                                            console.log(date.pattern("yyyy-MM-dd"), date.pattern("yyyy-MM-dd"), label);
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="addAgenda(this)">添加</button>
                </div>
            </div>
        </div>
    </div>

</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath }/assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/fullcalendar/fullcalendar.min.js"></script>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.nicescroll.js" type="text/javascript"></script>

<!--common script for all pages-->
<script src="${pageContext.request.contextPath }/assets/js/common-scripts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="${pageContext.request.contextPath }/assets/js/calendar-conf-events.js"></script>

<script>
    //custom select box
    $(function(){
        $("select.styled").customSelect();
    });

    //Ajax for Agenda
    function addAgenda(obj)  {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/userAddAgenda",
            data:$(obj).parents(".modal-footer").prev().children(".form-horizontal").serialize(),
            success:function (data) {
                var unique_id = $.gritter.add({
                    // (string | mandatory) the heading of the notification
                    title: data,
                    // (string | mandatory) the text inside the notification
                    text: data,
                    // (string | optional) the image to display on the left
                    image: '${pageContext.request.contextPath }/assets/img/ilab.jpg',
                    // (bool | optional) if you want it to fade out on its own or just sit there
                    sticky: false,
                    // (int | optional) the time you want it to be alive for before fading out
                    time: '1000',
                    // (string | optional) the class name you want to apply to that specific message
                    class_name: 'my-sticky-class'
                });
                if(data=="添加完成，即将刷新") {
                    setTimeout(function () {
                        window.location.href="${pageContext.request.contextPath }/userCalendarUI" ;
                    }, 1000);
                }
            },
            error:function () {
                alert("系统异常");
            }
        });
    };
    function deleteAgenda(aid)  {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/userDeleteAgenda",
            data:"userAgenda.aid="+aid,
            success:function (data) {
                var unique_id = $.gritter.add({
                    // (string | mandatory) the heading of the notification
                    title: data,
                    // (string | mandatory) the text inside the notification
                    text: data,
                    // (string | optional) the image to display on the left
                    image: '${pageContext.request.contextPath }/assets/img/ilab.jpg',
                    // (bool | optional) if you want it to fade out on its own or just sit there
                    sticky: false,
                    // (int | optional) the time you want it to be alive for before fading out
                    time: '1000',
                    // (string | optional) the class name you want to apply to that specific message
                    class_name: 'my-sticky-class'
                });
                if(data=="删除完成，即将刷新") {
                    setTimeout(function () {
                        window.location.href="${pageContext.request.contextPath }/userCalendarUI" ;
                    }, 1000);
                }
            },
            error:function () {
                alert("系统异常");
            }
        });
    };
    function editAgenda(obj)  {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/userEditAgenda",
            data:$(obj).parents(".modal-footer").prev().children(".form-horizontal").serialize(),
            success:function (data) {
                var unique_id = $.gritter.add({
                    // (string | mandatory) the heading of the notification
                    title: data,
                    // (string | mandatory) the text inside the notification
                    text: data,
                    // (string | optional) the image to display on the left
                    image: '${pageContext.request.contextPath }/assets/img/ilab.jpg',
                    // (bool | optional) if you want it to fade out on its own or just sit there
                    sticky: false,
                    // (int | optional) the time you want it to be alive for before fading out
                    time: '1000',
                    // (string | optional) the class name you want to apply to that specific message
                    class_name: 'my-sticky-class'
                });
                if(data=="修改完成，即将刷新") {
                    setTimeout(function () {
                        window.location.href="${pageContext.request.contextPath }/userCalendarUI" ;
                    }, 1000);
                }
            },
            error:function () {
                alert("系统异常");
            }
        });
    };
</script>

</body>
</html>

