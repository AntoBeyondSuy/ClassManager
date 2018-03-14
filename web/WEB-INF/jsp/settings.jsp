<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s" %>
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

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/assets/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/assets/css/style-responsive.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/cropper.min.css">

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
          <a class="active" href="${pageContext.request.contextPath }/userSettingsUI">
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
    <section class="wrapper"><%--包括 设置、头像、其他信息--%>
      <h3><i class="fa fa-angle-right"></i> 设置</h3><%--设置 两个大字--%>

      <!-- INLINE FORM ELELEMNTS 头像 栏-->
      <div class="row mt" style="float: left; width: 450px; display: inline-block; margin-top: 0;">
        <div class="col-lg-12">
          <div class="form-panel">

            <%--模态框区域--%>
            <div class="container" id="crop-avatar">
              <!-- Cropping modal -->
              <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <form class="avatar-form" enctype="multipart/form-data" method="post">
                      <div class="modal-header text-center">
                        <button class="close" data-dismiss="modal" type="button">&times;</button>
                        <h4 class="modal-title" id="avatar-modal-label">更改头像</h4>
                      </div>
                      <div class="modal-body">
                        <div class="avatar-body">

                          <!-- Upload image and data -->
                          <div class="avatar-upload">
                            <%--<input class="avatar-src" name="avatar_src" type="hidden">--%>
                            <input class="avatar-data" name="avatar_data" type="hidden">
                            <label for="avatarInput">本地上传</label>
                            <input class="avatar-input" id="avatarInput" name="avatar_file" type="file">
                          </div>

                          <!-- Crop and preview -->
                          <div class="row">
                            <div class="col-md-9">
                              <div class="avatar-wrapper"></div>
                            </div>
                            <div class="col-md-3">
                              <div class="avatar-preview preview-lg"></div>
                            </div>
                          </div>

                          <div class="row avatar-btns">
                            <div class="col-md-9">
                            </div>
                            <div class="col-md-3">
                              <button class="btn btn-primary btn-block avatar-save" type="button" onclick="avatar()">提交</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div><!-- /.modal -->

            </div>

            <%--在页面上显示的区域--%>
            <h4 class="mb"><i class="fa fa-angle-right"></i> 头像</h4>
            <form class="form-horizontal style-form" method="get" style="height: 100%;">
              <div class="form-group">

                <label class="col-sm-2 control-label" style="width: 100%;">当前头像</label>

                <div class="col-sm-10 text-center" style="width: 100%;">
                  <img src="assets/img/avatar/<s:property value="#session.user.id" />.jpg" class="img-circle" width="270">
                  <br /><br />
                  <div>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#avatar-modal">修改当前头像</button>
                  </div>
                </div>

              </div>
            </form>

          </div><!-- /form-panel -->
        </div><!-- /col-lg-12 -->
      </div><!-- /row -->


      <!-- BASIC FORM ELELEMNTS 其他设置 栏-->
      <div class="row mt" style="width: 800px; display: inline-block; margin-top: 0;">
        <div class="col-lg-12">
          <div class="form-panel">
            <div class="pull-right">
              <button type="button" class="btn btn-success" onclick="settings()">更改</button>
            </div>
            <h4 class="mb"><i class="fa fa-angle-right"></i> 其他信息</h4>
            <form class="form-horizontal style-form" id="settings" method="get">
              <div class="form-group">
                <label class="col-sm-2 col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                  <input name="settingsUser.password" type="password" class="form-control" placeholder="密码">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 col-sm-2 control-label">重复密码</label>
                <div class="col-sm-10">
                  <input name="settingsUser.password2" type="password" class="form-control" placeholder="重复密码">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                  <input name="settingsUser.name" type="text" class="form-control" placeholder="学号" value="<s:property value="#request.user1.name" />">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 col-sm-2 control-label">学号</label>
                <div class="col-sm-10">
                  <input name="settingsUser.student_id" type="text" class="form-control" placeholder="学号" value="<s:property value="#request.user1.student_id" />">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 col-sm-2 control-label">年级</label>
                <div class="col-sm-10">
                  <select name="settingsUser.grade" class="form-control">
                    <option>年级</option>
                    <option <s:if test='#request.user1.grade=="大一"'> selected="selected"</s:if>>大一</option>
                    <option <s:if test='#request.user1.grade=="大二"'> selected="selected"</s:if>>大二</option>
                    <option <s:if test='#request.user1.grade=="大三"'> selected="selected"</s:if>>大三</option>
                    <option <s:if test='#request.user1.grade=="大四"'> selected="selected"</s:if>>大四</option>
                    <option <s:if test='#request.user1.grade=="研一"'> selected="selected"</s:if>>研一</option>
                    <option <s:if test='#request.user1.grade=="研二"'> selected="selected"</s:if>>研二</option>
                    <option <s:if test='#request.user1.grade=="研三"'> selected="selected"</s:if>>研三</option>
                   </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 col-sm-2 control-label">组别</label>
                <div class="col-sm-10">
                  <select name="settingsUser.student_group" class="form-control">
                    <option>组别</option>
                    <option <s:if test='#request.user1.student_group=="软件工程"'> selected="selected"</s:if>>软件工程</option>
                    <option <s:if test='#request.user1.student_group=="计算机科学与技术"'> selected="selected"</s:if>>深度学习</option>
                    <option <s:if test='#request.user1.student_group=="通信工程"'> selected="selected"</s:if>>其他</option>
                    <option <s:if test='#request.user1.student_group=="电子信息工程"'> selected="selected"</s:if>>大数据</option>
                    <option <s:if test='#request.user1.student_group=="物联网工程"'> selected="selected"</s:if>>深度学习</option>
                    <option <s:if test='#request.user1.student_group=="工科实验班"'> selected="selected"</s:if>>其他</option>
                    <option <s:if test='#request.user1.student_group=="自动化"'> selected="selected"</s:if>>大数据</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 col-sm-2 control-label">邮箱</label>
                <div class="col-sm-10">
                  <input name="settingsUser.email" type="text" class="form-control" placeholder="邮箱" value="<s:property value="#request.user1.email" />">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 col-sm-2 control-label">手机号码</label>
                <div class="col-sm-10">
                  <input name="settingsUser.phone_number" type="text" class="form-control" placeholder="手机号码" value="<s:property value="#request.user1.phone_number" />">
                </div>
              </div>
            </form>
            </div>
           </div><!-- col-lg-12-->
      </div><!-- /row -->


    </section><! --/wrapper -->

  </section><!-- /MAIN CONTENT -->

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
<script src="${pageContext.request.contextPath }/assets/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/cropper.min.js"></script>

<script type="text/javascript">

  function  avatar() {
      var form = new FormData($(".avatar-form")[0]);

      $.ajax({
          url:"${pageContext.request.contextPath}/userAvatar",
          type:"post",
          data:form,
          processData:false,
          contentType:false,
          success:function(data){
              var unique_id = $.gritter.add({
                  // (string | mandatory) the heading of the notification
                  title: data,
                  text: data,
                  // (string | mandatory) the text inside the notification
                  // (string | optional) the image to display on the left
                  image: '${pageContext.request.contextPath }/assets/img/ilab.jpg',
                  // (bool | optional) if you want it to fade out on its own or just sit there
                  sticky: false,
                  // (int | optional) the time you want it to be alive for before fading out
                  time: '1000',
                  // (string | optional) the class name you want to apply to that specific message
                  class_name: 'my-sticky-class'
              });
              if(data=="上传成功，即将刷新") {
                  setTimeout(function () {
                      window.location.href="${pageContext.request.contextPath }/userSettingsUI" ;
                  }, 1000);
              }
          },
          error:function(e){
              var unique_id = $.gritter.add({
                  // (string | mandatory) the heading of the notification
                  title: "抱歉" ,
                  // (string | mandatory) the text inside the notification
                  text: "目前仅支持jpg格式",
                  // (string | optional) the image to display on the left
                  image: '${pageContext.request.contextPath }/assets/img/ilab.jpg',
                  // (bool | optional) if you want it to fade out on its own or just sit there
                  sticky: false,
                  // (int | optional) the time you want it to be alive for before fading out
                  time: '1000',
                  // (string | optional) the class name you want to apply to that specific message
                  class_name: 'my-sticky-class'
              });
          }
      });
  }

  function settings() {
      $.ajax({
          url: "${pageContext.request.contextPath}/userSettings",
          type: "post",
          data: $("#settings").serialize(),
          success:function(data){
              var unique_id = $.gritter.add({
                  title: data,
                  text: data,
                  image: '${pageContext.request.contextPath }/assets/img/ilab.jpg',
                  sticky: false,
                  time: '1000',
                  class_name: 'my-sticky-class'
              });
              if(data=="修改成功，即将刷新") {
                  setTimeout(function () {
                      window.location.href="${pageContext.request.contextPath }/userSettingsUI" ;
                  }, 1000);
              }
          },
          error:function(e){
              var unique_id = $.gritter.add({
                  title: "抱歉" ,
                  text: "服务器错误",
                  image: '${pageContext.request.contextPath }/assets/img/ilab.jpg',
                  sticky: false,
                  time: '1000',
                  class_name: 'my-sticky-class'
              });
          }
      });
  }
</script>

</body>
</html>
