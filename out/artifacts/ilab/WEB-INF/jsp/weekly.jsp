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

  <script src="${pageContext.request.contextPath }/assets/js/ckeditor/ckeditor.js"></script>
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
          <a class="active" href="${pageContext.request.contextPath }/userWeeklyUI" >
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


      <div class="pull-right" style="padding: 1%;">
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#add">写周记</button>
      </div>
      <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 750px">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">写周记</h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal">
            <textarea placeholder="在这里开始写周记" name="userWeekly.content" id="editor" rows="10" cols="80">

            </textarea>
                  <script>
                      // Replace the <textarea id="editor1"> with a CKEditor
                      // instance, using default configuration.
                      CKEDITOR.replace( 'editor', { allowedContent: true} );
                  </script>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
              <button type="button" class="btn btn-success" onclick="addWeekly('userWeekly.content='+CKEDITOR.instances.editor.document.getBody().getHtml().replace(/%/g,'%25').replace(/&/g,'%26'))">提交</button>
            </div>
          </div>
        </div>
      </div>
      <s:set name="flag" value="1" />
      <s:iterator value="#request.list_weekly" var="weekly" status="status">
      <s:if test='(#session.user.id == #weekly.author_id || #session.user.grade == "已毕业" )'>
      <s:if test='(#flag == 0 && #status.getCount()>1 && #request.list_weekly[#status.getCount()-2].year == #weekly.year && #request.list_weekly[#status.getCount()-2].month == #weekly.month && #request.list_weekly[#status.getCount()-2].day == #weekly.day)||(#status.getCount()>1 && #request.list_weekly[#status.getCount()-2].year == #weekly.year && #request.month != #weekly.month && #request.list_weekly[#status.getCount()-2].month == #weekly.month)||(#status.getCount()>1 && #request.list_weekly[#status.getCount()-2].year == #weekly.year && #request.year != #weekly.year)'>
        <div class="col-lg-4 col-md-4 col-sm-4 mb">
          <!-- WHITE PANEL - TOP USER -->
          <div class="content-panel pn">
            <div class="blog-bg"  style="background: url(${pageContext.request.contextPath }/assets/img/news/<s:property value="#status.getCount()%20" />.jpg) no-repeat center top;background-size:100%">

            </div>
            <div class="blog-text text-center">
              <p style="font-size:150%"><s:property value="#weekly.author_name" /></p>
              <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />">了解更多</button>

              <div class="modal fade" id="myModal<s:property value="#status.getCount()" />" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="width: 750px">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title"><s:property value="#weekly.author_name" /></h4>
                    </div>
                    <div class="modal-body">
                      <img src="assets/img/avatar/<s:property value="#weekly.author_id" />.jpg" class="img-circle" width="60"><h5 class="centered"><s:property value="#weekly.author_name" /></h5>
                      <br />
                      <div class="text-center" style="width:80%;margin:0 auto">

                        <textarea  name="userWeekly.content" id="editor<s:property value="#status.getCount()" />" rows="10" cols="80">
                <s:property value="#weekly.content" />
            </textarea>
                        <script>
                            // Replace the <textarea id="editor1"> with a CKEditor
                            // instance, using default configuration.
                            CKEDITOR.replace( 'editor<s:property value="#status.getCount()" />', { allowedContent: true} );
                        </script>
                      </div>
                      <br />
                      <div class="modal-footer">
                        <div class="pull-left" style="font-size: 120%;padding: 1%;">发布于 <s:property value="#weekly.year" />-<s:property value="#weekly.month" />-<s:property value="#weekly.day" /></div>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <s:if test='#session.user.id == #weekly.author_id || #session.user.grade == "已毕业"'>
                          <button type="button" class="btn btn-success" onclick="updateWeekly('userWeekly.wid='+'<s:property value="#weekly.wid" />'+'&userWeekly.content='+CKEDITOR.instances.editor<s:property value="#status.getCount()" />.document.getBody().getHtml().replace(/%/g,'%25').replace(/&/g,'%26'))">修改</button>
                          <button type="button" class="btn btn-danger" onclick="deleteWeekly(<s:property value="#weekly.wid" />)">删除</button>
                        </s:if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div><!-- /col-md-4-->

        </div><!-- /col-md-4 -->
      </s:if>
        <s:else>
        <s:if test='#weekly.year == #request.year'>
        <s:if test='#weekly.month == #request.month'>
        <s:if test='#weekly.day == #request.day'>
      <s:set name="flag" value="0" />
        <h3><i class="fa fa-angle-right"></i> 今天</h3>
      <div class="row mt">
        <div class="col-lg-12">
          <! -- 1st ROW OF PANELS -->
          <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 mb">
              <!-- WHITE PANEL - TOP USER -->
              <div class="content-panel pn">
                <div class="blog-bg"  style="background: url(${pageContext.request.contextPath }/assets/img/news/<s:property value="#status.getCount()%20" />.jpg) no-repeat center top;background-size:100%">

                </div>
                <div class="blog-text text-center">
                  <p style="font-size:150%"><s:property value="#weekly.author_name" /></p>
                  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />">了解更多</button>

                  <div class="modal fade" id="myModal<s:property value="#status.getCount()" />" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="width: 750px">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h4 class="modal-title"><s:property value="#weekly.author_name" /></h4>
                        </div>
                        <div class="modal-body">
                          <img src="assets/img/avatar/<s:property value="#weekly.author_id" />.jpg" class="img-circle" width="60"><h5 class="centered"><s:property value="#weekly.author_name" /></h5>
                          <br />
                          <div class="text-center" style="width:80%;margin:0 auto">
                            <textarea name="userWeekly.content" id="editor<s:property value="#status.getCount()" />" rows="10" cols="80">
                              <s:property value="#weekly.content" />
                            </textarea>
                            <script>
                                // Replace the <textarea id="editor1"> with a CKEditor
                                // instance, using default configuration.
                                CKEDITOR.replace( 'editor<s:property value="#status.getCount()" />', { allowedContent: true} );
                            </script>
                          </div>
                          <br />
                          <div class="modal-footer">
                            <div class="pull-left" style="font-size: 120%;padding: 1%;">发布于 <s:property value="#weekly.year" />-<s:property value="#weekly.month" />-<s:property value="#weekly.day" /></div>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <s:if test='#session.user.id == #weekly.author_id || #session.user.grade == "已毕业"'>
                              <button type="button" class="btn btn-success" onclick="updateWeekly('userWeekly.wid='+'<s:property value="#weekly.wid" />'+'&userWeekly.content='+CKEDITOR.instances.editor<s:property value="#status.getCount()" />.document.getBody().getHtml().replace(/%/g,'%25').replace(/&/g,'%26'))">修改</button>
                              <button type="button" class="btn btn-danger" onclick="deleteWeekly(<s:property value="#weekly.wid" />)">删除</button>
                            </s:if>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div><!-- /col-md-4-->

            </div><!-- /col-md-4 -->
            </s:if>
            <s:else>
            <s:set name="flag" value="0" />
              </div>
              </div>
              </div>
            <h3><i class="fa fa-angle-right"></i> <s:property value="#request.day - #weekly.day" />天前</h3>
            <div class="row mt">
              <div class="col-lg-12">
                <! -- 1st ROW OF PANELS -->
                <div class="row">
                  <div class="col-lg-4 col-md-4 col-sm-4 mb">
                    <!-- WHITE PANEL - TOP USER -->
                    <div class="content-panel pn">
                      <div class="blog-bg"  style="background: url(${pageContext.request.contextPath }/assets/img/news/<s:property value="#status.getCount()%20" />.jpg) no-repeat center top;background-size:100%">

                      </div>
                      <div class="blog-text text-center">
                        <p style="font-size:150%"><s:property value="#weekly.author_name" /></p>
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />">了解更多</button>

                        <div class="modal fade" id="myModal<s:property value="#status.getCount()" />" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                          <div class="modal-dialog" style="width: 750px">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><s:property value="#weekly.author_name" /></h4>
                              </div>
                              <div class="modal-body">
                                <img src="assets/img/avatar/<s:property value="#weekly.author_id" />.jpg" class="img-circle" width="60"><h5 class="centered"><s:property value="#weekly.author_name" /></h5>
                                <br />
                                <div class="text-center" style="width:80%;margin:0 auto">
                                  <textarea name="userWeekly.content" id="editor<s:property value="#status.getCount()" />" rows="10" cols="80">
                                    <s:property value="#weekly.content" />
                                  </textarea>
                                  <script>
                                      // Replace the <textarea id="editor1"> with a CKEditor
                                      // instance, using default configuration.
                                      CKEDITOR.replace( 'editor<s:property value="#status.getCount()" />' , { allowedContent: true});
                                  </script>
                                </div>
                                <br />
                                <div class="modal-footer">
                                  <div class="pull-left" style="font-size: 120%;padding: 1%;">发布于 <s:property value="#weekly.year" />-<s:property value="#weekly.month" />-<s:property value="#weekly.day" /></div>
                                  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                  <s:if test='#session.user.id == #weekly.author_id || #session.user.grade == "已毕业"'>
                                    <button type="button" class="btn btn-success" onclick="updateWeekly('userWeekly.wid='+'<s:property value="#weekly.wid" />'+'&userWeekly.content='+CKEDITOR.instances.editor<s:property value="#status.getCount()" />.document.getBody().getHtml().replace(/%/g,'%25').replace(/&/g,'%26'))">修改</button>
                                    <button type="button" class="btn btn-danger" onclick="deleteWeekly(<s:property value="#weekly.wid" />)">删除</button>
                                  </s:if>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                    </div><!-- /col-md-4-->

                  </div><!-- /col-md-4 -->
            </s:else>
            </s:if>
      <s:else>
                  <s:set name="flag" value="0" />
                </div>
              </div>
            </div>
      <h3><i class="fa fa-angle-right"></i> <s:property value="#request.month - #weekly.month" />月前</h3>
      <div class="row mt">
        <div class="col-lg-12">
          <! -- 1st ROW OF PANELS -->
          <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 mb">
              <!-- WHITE PANEL - TOP USER -->
              <div class="content-panel pn">
                <div class="blog-bg"  style="background: url(${pageContext.request.contextPath }/assets/img/news/<s:property value="#status.getCount()%20" />.jpg) no-repeat center top;background-size:100%">

                </div>
                <div class="blog-text text-center">
                  <p style="font-size:150%"><s:property value="#weekly.author_name" /></p>
                  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />">了解更多</button>

                  <div class="modal fade" id="myModal<s:property value="#status.getCount()" />" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="width: 750px">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h4 class="modal-title"><s:property value="#weekly.author_name" /></h4>
                        </div>
                        <div class="modal-body">
                          <img src="assets/img/avatar/<s:property value="#weekly.author_id" />.jpg" class="img-circle" width="60"><h5 class="centered"><s:property value="#weekly.author_name" /></h5>
                          <br />
                          <div class="text-center" style="width:80%;margin:0 auto">
                            <textarea name="userWeekly.content" id="editor<s:property value="#status.getCount()" />" rows="10" cols="80">
                              <s:property value="#weekly.content" />
                            </textarea>
                            <script>
                                // Replace the <textarea id="editor1"> with a CKEditor
                                // instance, using default configuration.
                                CKEDITOR.replace( 'editor<s:property value="#status.getCount()" />', { allowedContent: true} );
                            </script>
                          </div>
                          <br />
                          <div class="modal-footer">
                            <div class="pull-left" style="font-size: 120%;padding: 1%;">发布于 <s:property value="#weekly.year" />-<s:property value="#weekly.month" />-<s:property value="#weekly.day" /></div>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <s:if test='#session.user.id == #weekly.author_id || #session.user.grade == "已毕业"'>
                              <button type="button" class="btn btn-success" onclick="updateWeekly('userWeekly.wid='+'<s:property value="#weekly.wid" />'+'&userWeekly.content='+CKEDITOR.instances.editor<s:property value="#status.getCount()" />.document.getBody().getHtml().replace(/%/g,'%25').replace(/&/g,'%26'))">修改</button>
                              <button type="button" class="btn btn-danger" onclick="deleteWeekly(<s:property value="#weekly.wid" />)">删除</button>
                            </s:if>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div><!-- /col-md-4-->

            </div><!-- /col-md-4 -->
            </s:else>
          </s:if>
        <s:else>
            <s:set name="flag" value="0" />
          </div>
        </div>
      </div>
        <h3><i class="fa fa-angle-right"></i> <s:property value="#request.year - #weekly.year" />年前</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <! -- 1st ROW OF PANELS -->
            <div class="row">
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <!-- WHITE PANEL - TOP USER -->
                <div class="content-panel pn">
                  <div class="blog-bg"  style="background: url(${pageContext.request.contextPath }/assets/img/news/<s:property value="#status.getCount()%20" />.jpg) no-repeat center top;background-size:100%">

                  </div>
                  <div class="blog-text text-center">
                    <p style="font-size:150%"><s:property value="#weekly.author_name" /></p>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal<s:property value="#status.getCount()" />">了解更多</button>

                    <div class="modal fade" id="myModal<s:property value="#status.getCount()" />" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog" style="width: 750px">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><s:property value="#weekly.author_name" /></h4>
                          </div>
                          <div class="modal-body">
                            <img src="assets/img/avatar/<s:property value="#weekly.author_id" />.jpg" class="img-circle" width="60"><h5 class="centered"><s:property value="#weekly.author_name" /></h5>
                            <br />
                            <div class="text-center" style="width:80%;margin:0 auto">
                              <textarea name="userWeekly.content" id="editor<s:property value="#status.getCount()" />" rows="10" cols="80">
                                <s:property value="#weekly.content" />
                              </textarea>
                              <script>
                                  // Replace the <textarea id="editor1"> with a CKEditor
                                  // instance, using default configuration.
                                  CKEDITOR.replace( 'editor<s:property value="#status.getCount()" />' , { allowedContent: true});
                              </script>
                            </div>
                            <br />
                            <div class="modal-footer">
                              <div class="pull-left" style="font-size: 120%;padding: 1%;">发布于 <s:property value="#weekly.year" />-<s:property value="#weekly.month" />-<s:property value="#weekly.day" /></div>
                              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                              <s:if test='#session.user.id == #weekly.author_id || #session.user.grade == "已毕业"'>
                                <button type="button" class="btn btn-success" onclick="updateWeekly('userWeekly.wid='+'<s:property value="#weekly.wid" />'+'&userWeekly.content='+CKEDITOR.instances.editor<s:property value="#status.getCount()" />.document.getBody().getHtml().replace(/%/g,'%25').replace(/&/g,'%26'))">修改</button>
                                <button type="button" class="btn btn-danger" onclick="deleteWeekly(<s:property value="#weekly.wid" />)">删除</button>
                              </s:if>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                </div><!-- /col-md-4-->

              </div><!-- /col-md-4 -->
              </s:else>
            </s:else>
              </s:if>
        </s:iterator>
            </div>
          </div>
        </div>
          </div><! --/END 1ST ROW OF PANELS -->

        </div>
      </div>

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

<!--script for this page-->
<script src="${pageContext.request.contextPath }/assets/js/jquery-ui.js"></script>

<script type="application/javascript">

    function addWeekly(weekly)  {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/userAddWeekly",
            data:weekly,
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
                        window.location.href="${pageContext.request.contextPath }/userWeeklyUI" ;
                    }, 1000);
                }
            },
            error:function () {
                alert("系统异常");
            }
        });
    };

    function updateWeekly(weekly)  {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/userUpdateWeekly",
            data:weekly,
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
                        window.location.href="${pageContext.request.contextPath }/userWeeklyUI" ;
                    }, 1000);
                }
            },
            error:function () {
                alert("系统异常");
            }
        });
    };

    function deleteWeekly(wid)  {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/userDeleteWeekly",
            data:"userWeekly.wid="+wid,
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
                        window.location.href="${pageContext.request.contextPath }/userWeeklyUI" ;
                    }, 1000);
                }
            },
            error:function () {
                alert("系统异常");
            }
        });
    };
    var $modalElement = this.$element;
    $(document).on('focusin.modal', function (e) {
        var $parent = $(e.target.parentNode);
        if ($modalElement[0] !== e.target && !$modalElement.has(e.target).length
            // add whatever conditions you need here:
            &&
            !$parent.hasClass('cke_dialog_ui_input_select') && !$parent.hasClass('cke_dialog_ui_input_text')) {
            $modalElement.focus()
        }
    })
</script>


</body>
</html>
