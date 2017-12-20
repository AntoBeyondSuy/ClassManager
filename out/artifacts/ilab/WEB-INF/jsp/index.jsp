<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/2/3
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/img/ilab.jpg">
  
  <title>MUC班级管理系统</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath }/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/js/gritter/css/jquery.gritter.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/lineicons/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/to-do.css">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/assets/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/assets/css/style-responsive.css" rel="stylesheet">

</head>

<body>

<section id="container" >
  <!-- **********************************************************************************************************************************************************
  TOP BAR CONTENT & NOTIFICATIONS
  *********************************************************************************************************************************************************** -->
  <!--header start-->
  <header class="header black-bg">
    <div class="sidebar-toggle-box">
      <div class="fa fa-bars tooltips" data-placement="right" data-original-title="折叠导航"></div>
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
          <a class="active" href="${pageContext.request.contextPath }/userIndexUI">
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
          <a href="${pageContext.request.contextPath }/userCalendarUI">
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

      <div class="row">
        <div class="col-lg-9 main-chart">

          <div class="row mt mb">
            <div class="col-md-12">
              <section class="task-panel tasks-widget">
                <div class="panel-heading">
                  <div class="pull-left"><h5><i class="fa fa-tasks"></i>&nbsp;&nbsp;&nbsp;待办事项</h5></div>
                  <br>
                </div>
                <div class="panel-body">
                  <div class="task-content">
                    <ul id="sortable" class="task-list">

                      <!-- iterator for Task -->
                      <s:iterator value="#request.list_task" var="task" status="status">
                        <s:if test="#status.getCount()%5==1">
                          <li class="list-primary">
                            <i class=" fa fa-ellipsis-v"></i>
                            <div class="task-title">
                              <span class="task-title-sp"><s:property value="#task.content" /></span>
                              <span class="badge bg-info"><s:property value="#task.badge" /></span>
                              <div class="pull-right hidden-phone">
                                <button class="btn btn-primary btn-xs fa fa-pencil" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o" onclick="deleteTask(<s:property value="#task.tid" />)"></button>
                              </div>
                            </div>
                          </li>
                        </s:if>
                        <s:elseif test="#status.getCount()%5==2">
                          <li class="list-danger">
                            <i class=" fa fa-ellipsis-v"></i>
                            <div class="task-title">
                              <span class="task-title-sp"><s:property value="#task.content" /></span>
                              <span class="badge bg-important"><s:property value="#task.badge" /></span>
                              <div class="pull-right hidden-phone">
                                <button class="btn btn-primary btn-xs fa fa-pencil" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o" onclick="deleteTask(<s:property value="#task.tid" />)"></button>
                              </div>
                            </div>
                          </li>
                        </s:elseif>
                        <s:elseif test="#status.getCount()%5==3">
                          <li class="list-success">
                            <i class=" fa fa-ellipsis-v"></i>
                            <div class="task-title">
                              <span class="task-title-sp"><s:property value="#task.content" /></span>
                              <span class="badge bg-success"><s:property value="#task.badge" /></span>
                              <div class="pull-right hidden-phone">
                                <button class="btn btn-primary btn-xs fa fa-pencil" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o" onclick="deleteTask(<s:property value="#task.tid" />)"></button>
                              </div>
                            </div>
                          </li>
                        </s:elseif>
                        <s:elseif test="#status.getCount()%5==4">
                          <li class="list-warning">
                            <i class=" fa fa-ellipsis-v"></i>
                            <div class="task-title">
                              <span class="task-title-sp"><s:property value="#task.content" /></span>
                              <span class="badge bg-warning"><s:property value="#task.badge" /></span>
                              <div class="pull-right hidden-phone">
                                <button class="btn btn-primary btn-xs fa fa-pencil" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o" onclick="deleteTask(<s:property value="#task.tid" />)"></button>
                              </div>
                            </div>
                          </li>
                        </s:elseif>
                        <s:else>
                          <li class="list-info">
                            <i class=" fa fa-ellipsis-v"></i>
                            <div class="task-title">
                              <span class="task-title-sp"><s:property value="#task.content" /></span>
                              <span class="badge bg-theme"><s:property value="#task.badge" /></span>
                              <div class="pull-right hidden-phone">
                                <button class="btn btn-primary btn-xs fa fa-pencil" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />"></button>
                                <button class="btn btn-danger btn-xs fa fa-trash-o" onclick="deleteTask(<s:property value="#task.tid" />)"></button>
                              </div>
                            </div>
                          </li>
                        </s:else>
                      </s:iterator>
                    </ul>
                  </div>
                  <div class=" add-task-row">
                    <a class="btn btn-success btn-sm pull-right" href="todo_list.html#" data-toggle="modal" data-target="#myModal0">增加新事务</a>
                  </div>
                </div>
              </section>
            </div><!--/col-md-12 -->
          </div><!-- /row -->
        </div><!-- /col-lg-9 END SECTION MIDDLE -->

        <!-- iterator for Editing and Deleting Task -->
        <s:iterator value="#request.list_task" var="task" status="status">
        <div class="modal fade" id="myModal<s:property value="#status.getCount()" />" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">编辑</h4>
              </div>
              <div class="modal-body">
                <form class="form-horizontal">
                  <input type="hidden" class="form-control" name="userTask.tid" value="<s:property value="#task.tid" />">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">任务内容</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="userTask.content" value="<s:property value="#task.content" />" autofocus>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">标签内容</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="userTask.badge" value="<s:property value="#task.badge" />">
                    </div>
                    <input type="hidden" class="form-control" name="userTask.uid" value="<s:property value="#task.uid" />">
                  </div>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="editTask(this)">保存</button>
              </div>
            </div>
          </div>
        </div>
        </s:iterator>
        <!-- modal for Adding Task -->
        <div class="modal fade" id="myModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">增加</h4>
              </div>
              <div class="modal-body">
                <form class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">任务内容</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="userTask.content" placeholder="任务内容" autofocus>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">标签内容</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="userTask.badge" placeholder="标签内容">
                    </div>
                  </div>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addTask(this)">添加</button>
              </div>
            </div>
          </div>
        </div>

        <!-- **********************************************************************************************************************************************************
        RIGHT SIDEBAR CONTENT
        *********************************************************************************************************************************************************** -->
      <s:if test="#request.list_notification != null">
        <div class="col-lg-3 ds">
          <!--COMPLETED ACTIONS DONUTS CHART-->
          <h3>提醒</h3>

          <!-- iterator for Notification -->
        <s:iterator value="#request.list_notification" var="notification" status="status">
          <s:if test="#notification.time <= 72">
          <div class="desc">
            <div class="thumb">
              <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
            </div>
            <div class="details">
              <p><muted><s:if test="#notification.time == 0">不到一小时前</s:if><s:elseif test="#notification.time <24"><s:property value="#notification.time" />小时前</s:elseif><s:elseif test="#notification.time < 48">一天前</s:elseif><s:elseif test="#notification.time < 72">两天前</s:elseif></muted><br/><br/>
                <a href="${pageContext.request.contextPath }/user<s:property value="#notification.first_link" />"><s:property value="#notification.name" /></a>&nbsp;<s:property value="#notification.first_words" />&nbsp;<a href="${pageContext.request.contextPath }/user<s:property value="#notification.second_link" />"><s:property value="#notification.second_words" /></a><br/>
              </p>
            </div>
          </div>
          </s:if>
        </s:iterator>

        </div><!-- /col-lg-3 -->
      </s:if>
      </div><! --/row -->
    </section>
  </section>

</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="${pageContext.request.contextPath }/assets/js/common-scripts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="${pageContext.request.contextPath }/assets/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/tasks.js" type="text/javascript"></script>

<script type="text/javascript">
  <s:if test='#request.first == "first"'>
    $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: '恭喜完成第一次登录',
            // (string | mandatory) the text inside the notification
            text: '随意戳戳熟悉一下吧~',
            // (string | optional) the image to display on the left
            image: 'assets/img/ilab.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: false,
            // (int | optional) the time you want it to be alive for before fading out
            time: '5000',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
    });
    </s:if>
  <!-- Task List init() -->
  jQuery(document).ready(function() {
        TaskList.initTaskWidget();
        $( "#sortable" ).sortable();
        $( "#sortable" ).disableSelection();
    });

    <!-- Ajax for Task -->
    function editTask(obj)  {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/userEditTask",
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
                        window.location.href="${pageContext.request.contextPath }/userIndexUI" ;
                    }, 1000);
                }
            },
            error:function () {
                alert("系统异常");
            }
        });
    };
    function addTask(obj)  {
               $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath }/userAddTask",
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
                                window.location.href="${pageContext.request.contextPath }/userIndexUI" ;
                            }, 1000);
                        }
                    },
                    error:function () {
                        alert("系统异常");
                    }
                });
    };
    function deleteTask(tid)  {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/userDeleteTask",
            data:"userTask.tid="+tid,
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
                        window.location.href="${pageContext.request.contextPath }/userIndexUI" ;
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
