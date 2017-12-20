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

        <p class="centered"><img src="assets/img/avatar/<s:property value="#session.user.id" />.jpg" class="img-circle" width="60"></p>
        <h5 class="centered"><s:property value="#session.user.name" /></h5>

        <li class="mt">
          <a href="${pageContext.request.contextPath }/userIndexUI">
            <i class="fa fa-dashboard"></i>
            <span>仪表盘</span>
          </a>
        </li>

        <li class="sub-menu">
          <a class="active" href="javascript:;" >
            <i class="fa fa-user"></i>
            <span>成员</span>
          </a>
          <ul class="sub" style="display: block;">
            <li <s:if test="#request.grade==1">class="active"</s:if> ><a href="${pageContext.request.contextPath }/userGetUndergraduate">本科</a></li>
            <li <s:if test="#request.grade==2">class="active"</s:if> ><a href="${pageContext.request.contextPath }/userGetGraduate">研究生</a></li>
            <li <s:if test="#request.grade==3">class="active"</s:if> ><a href="${pageContext.request.contextPath }/userGetAdmin">管理员</a></li>
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
    <section class="wrapper site-min-height">
      <s:if test="#request.grade==1">
        <h3><i class="fa fa-angle-right"></i> 大一</h3>
      <div class="row mt">
        <div class="col-lg-12">
          <! -- 1st ROW OF PANELS -->
          <div class="row">
        <s:iterator value="#request.list_user" var="user" status="status">
          <s:if test='#user.grade=="大一"'>
            <div class="col-lg-4 col-md-4 col-sm-4 mb">
              <!-- WHITE PANEL - TOP USER -->
              <div class="white-panel pn">
                <div class="white-header">
                  <h5><s:property value="#user.student_group" /></h5>
                </div>
                <p><img src="assets/img/avatar/<s:property value="#user.id" />.jpg" class="img-circle" width="50"></p>
                <p><b><s:property value="#user.name" /></b></p>
                <div class="visible-lg visible-md"><br /></div>
                <div class="row">
                  <div class="col-md-6">
                    <p class="small mt">手机号码</p>
                    <p><s:property value="#user.phone_number" /></p>
                  </div>
                  <div class="col-md-6">
                    <p class="small mt">邮箱地址</p>
                    <p><s:property value="#user.email" /></p>
                  </div>
                </div>
              </div>
            </div><!-- /col-md-4 -->
          </s:if>
        </s:iterator>

          </div><! --/END 1ST ROW OF PANELS -->

        </div>
      </div>

        <h3><i class="fa fa-angle-right"></i> 大二</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <! -- 1st ROW OF PANELS -->
            <div class="row">
              <s:iterator value="#request.list_user" var="user" status="status">
                <s:if test='#user.grade=="大二"'>
                  <div class="col-lg-4 col-md-4 col-sm-4 mb">
                    <!-- WHITE PANEL - TOP USER -->
                    <div class="white-panel pn">
                      <div class="white-header">
                        <h5><s:property value="#user.student_group" /></h5>
                      </div>
                      <p><img src="assets/img/avatar/<s:property value="#user.id" />.jpg" class="img-circle" width="50"></p>
                      <p><b><s:property value="#user.name" /></b></p>
                      <div class="visible-lg visible-md"><br /></div>
                      <div class="row">
                        <div class="col-md-6">
                          <p class="small mt">手机号码</p>
                          <p><s:property value="#user.phone_number" /></p>
                        </div>
                        <div class="col-md-6">
                          <p class="small mt">邮箱地址</p>
                          <p><s:property value="#user.email" /></p>
                        </div>
                      </div>
                    </div>
                  </div><!-- /col-md-4 -->
                </s:if>
              </s:iterator>

            </div><! --/END 1ST ROW OF PANELS -->

          </div>
        </div>

        <h3><i class="fa fa-angle-right"></i> 大三</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <! -- 1st ROW OF PANELS -->
            <div class="row">
              <s:iterator value="#request.list_user" var="user" status="status">
                <s:if test='#user.grade=="大三"'>
                  <div class="col-lg-4 col-md-4 col-sm-4 mb">
                    <!-- WHITE PANEL - TOP USER -->
                    <div class="white-panel pn">
                      <div class="white-header">
                        <h5><s:property value="#user.student_group" /></h5>
                      </div>
                      <p><img src="assets/img/avatar/<s:property value="#user.id" />.jpg" class="img-circle" width="50"></p>
                      <p><b><s:property value="#user.name" /></b></p>
                      <div class="visible-lg visible-md"><br /></div>
                      <div class="row">
                        <div class="col-md-6">
                          <p class="small mt">手机号码</p>
                          <p><s:property value="#user.phone_number" /></p>
                        </div>
                        <div class="col-md-6">
                          <p class="small mt">邮箱地址</p>
                          <p><s:property value="#user.email" /></p>
                        </div>
                      </div>
                    </div>
                  </div><!-- /col-md-4 -->
                </s:if>
              </s:iterator>

            </div><! --/END 1ST ROW OF PANELS -->

          </div>
        </div>

        <h3><i class="fa fa-angle-right"></i> 大四</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <! -- 1st ROW OF PANELS -->
            <div class="row">
              <s:iterator value="#request.list_user" var="user" status="status">
                <s:if test='#user.grade=="大四"'>
                  <div class="col-lg-4 col-md-4 col-sm-4 mb">
                    <!-- WHITE PANEL - TOP USER -->
                    <div class="white-panel pn">
                      <div class="white-header">
                        <h5><s:property value="#user.student_group" /></h5>
                      </div>
                      <p><img src="assets/img/avatar/<s:property value="#user.id" />.jpg" class="img-circle" width="50"></p>
                      <p><b><s:property value="#user.name" /></b></p>
                      <div class="visible-lg visible-md"><br /></div>
                      <div class="row">
                        <div class="col-md-6">
                          <p class="small mt">手机号码</p>
                          <p><s:property value="#user.phone_number" /></p>
                        </div>
                        <div class="col-md-6">
                          <p class="small mt">邮箱地址</p>
                          <p><s:property value="#user.email" /></p>
                        </div>
                      </div>
                    </div>
                  </div><!-- /col-md-4 -->
                </s:if>
              </s:iterator>

            </div><! --/END 1ST ROW OF PANELS -->

          </div>
        </div>
      </s:if>
      <s:if test="#request.grade==2">
        <h3><i class="fa fa-angle-right"></i> 研一</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <! -- 1st ROW OF PANELS -->
            <div class="row">
              <s:iterator value="#request.list_user" var="user" status="status">
                <s:if test='#user.grade=="研一"'>
                  <div class="col-lg-4 col-md-4 col-sm-4 mb">
                    <!-- WHITE PANEL - TOP USER -->
                    <div class="white-panel pn">
                      <div class="white-header">
                        <h5><s:property value="#user.student_group" /></h5>
                      </div>
                      <p><img src="assets/img/avatar/<s:property value="#user.id" />.jpg" class="img-circle" width="50"></p>
                      <p><b><s:property value="#user.name" /></b></p>
                      <div class="visible-lg visible-md"><br /></div>
                      <div class="row">
                        <div class="col-md-6">
                          <p class="small mt">手机号码</p>
                          <p><s:property value="#user.phone_number" /></p>
                        </div>
                        <div class="col-md-6">
                          <p class="small mt">邮箱地址</p>
                          <p><s:property value="#user.email" /></p>
                        </div>
                      </div>
                    </div>
                  </div><!-- /col-md-4 -->
                </s:if>
              </s:iterator>

            </div><! --/END 1ST ROW OF PANELS -->

          </div>
        </div>

        <h3><i class="fa fa-angle-right"></i> 研二</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <! -- 1st ROW OF PANELS -->
            <div class="row">
              <s:iterator value="#request.list_user" var="user" status="status">
                <s:if test='#user.grade=="研二"'>
                  <div class="col-lg-4 col-md-4 col-sm-4 mb">
                    <!-- WHITE PANEL - TOP USER -->
                    <div class="white-panel pn">
                      <div class="white-header">
                        <h5><s:property value="#user.student_group" /></h5>
                      </div>
                      <p><img src="assets/img/avatar/<s:property value="#user.id" />.jpg" class="img-circle" width="50"></p>
                      <p><b><s:property value="#user.name" /></b></p>
                      <div class="visible-lg visible-md"><br /></div>
                      <div class="row">
                        <div class="col-md-6">
                          <p class="small mt">手机号码</p>
                          <p><s:property value="#user.phone_number" /></p>
                        </div>
                        <div class="col-md-6">
                          <p class="small mt">邮箱地址</p>
                          <p><s:property value="#user.email" /></p>
                        </div>
                      </div>
                    </div>
                  </div><!-- /col-md-4 -->
                </s:if>
              </s:iterator>

            </div><! --/END 1ST ROW OF PANELS -->

          </div>
        </div>

        <h3><i class="fa fa-angle-right"></i> 研三</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <! -- 1st ROW OF PANELS -->
            <div class="row">
              <s:iterator value="#request.list_user" var="user" status="status">
                <s:if test='#user.grade=="研三"'>
                  <div class="col-lg-4 col-md-4 col-sm-4 mb">
                    <!-- WHITE PANEL - TOP USER -->
                    <div class="white-panel pn">
                      <div class="white-header">
                        <h5><s:property value="#user.student_group" /></h5>
                      </div>
                      <p><img src="assets/img/avatar/<s:property value="#user.id" />.jpg" class="img-circle" width="50"></p>
                      <p><b><s:property value="#user.name" /></b></p>
                      <div class="visible-lg visible-md"><br /></div>
                      <div class="row">
                        <div class="col-md-6">
                          <p class="small mt">手机号码</p>
                          <p><s:property value="#user.phone_number" /></p>
                        </div>
                        <div class="col-md-6">
                          <p class="small mt">邮箱地址</p>
                          <p><s:property value="#user.email" /></p>
                        </div>
                      </div>
                    </div>
                  </div><!-- /col-md-4 -->
                </s:if>
              </s:iterator>

            </div><! --/END 1ST ROW OF PANELS -->

          </div>
        </div>
      </s:if>
      <s:if test="#request.grade==3">
        <h3><i class="fa fa-angle-right"></i> 管理员</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <! -- 1st ROW OF PANELS -->
            <div class="row">
              <s:iterator value="#request.list_user" var="user" status="status">
                <s:if test='#user.grade=="已毕业"'>
                  <div class="col-lg-4 col-md-4 col-sm-4 mb">
                    <!-- WHITE PANEL - TOP USER -->
                    <div class="white-panel pn">
                      <div class="white-header">
                        <h5><s:property value="#user.student_group" /></h5>
                      </div>
                      <p><img src="assets/img/avatar/<s:property value="#user.id" />.jpg" class="img-circle" width="50"></p>
                      <p><b><s:property value="#user.name" /></b></p>
                      <div class="visible-lg visible-md"><br /></div>
                      <div class="row">
                        <div class="col-md-6">
                          <p class="small mt">手机号码</p>
                          <p><s:property value="#user.phone_number" /></p>
                        </div>
                        <div class="col-md-6">
                          <p class="small mt">邮箱地址</p>
                          <p><s:property value="#user.email" /></p>
                        </div>
                      </div>
                    </div>
                  </div><!-- /col-md-4 -->
                </s:if>
              </s:iterator>

            </div><! --/END 1ST ROW OF PANELS -->

          </div>
        </div>
      </s:if>
    </section><! --/wrapper -->
  </section>

  <!--main content end-->
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

</body>
</html>
