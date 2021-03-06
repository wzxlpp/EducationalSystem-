<%@ page contentType="text/html;charset=UTF-8" %>
<%--<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>--%>
<%--<%@ include file="/WEB-INF/views/include/taglib.jsp"%>--%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="evalue" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>燕京理工学院教务处管理系统</title>
	<link rel="icon" href="http://www.yit.edu.cn/skin/default/1505lanb/images/logo.ico" mce_href="/skin/default/1505lanb/images/logo.ico" type="image/x-icon">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1">
	<link href="${ctxStatic}/evalue/css/index.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${ctxStatic}/evalue/css/login.css" rel="stylesheet" type="text/css" />
	<script src="${ctxStatic}/evalue/js/jquery.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/evalue/js/all.js" type="text/javascript"></script>
	<script src="${ctxStatic}/evalue/js/veriString.js" type="text/javascript"></script>
	<script language="JavaScript">

        function refresh(obj) {
            obj.src = "/index/verifyCode.html?"+Math.random();

        }
	</script>
</head>
<body>
<div class="bg_br color_bai">
	<div class="logo "><div class="logo_img">
		<div class="logoi"></div></div>
		<strong>燕京理工学院教务处系统</strong>
	</div>

	<form action="${ctx}/index/dologin.html" method="post" id="loginForm">
		<div class="denglu_i text-center">
			<h1>用户登录</h1>

			<%--<input type="hidden" name="systemdesc" value="${systemdesc}" />--%>
			<input class="denglu_input denglu_input1" data-u="denglu_input1" name="username"  id="username" value="${username}"type="text" placeholder="请输入用户名">

			<input class="denglu_input denglu_input2" data-u="denglu_input2"  name="password" id="password"  type="password" placeholder="请输入密码">
			<br>
			<div class="input validate" id="validate">
				<div>
					<p>验证码:
						<input type="text" id="adminvaliDate" name="code" style="width: 100px;height: 40px"/>
						<img style="height: 40px" class="value" title="点击更换" onclick="javascript:refresh(this);"  src="/index/verifyCode.html">
					</p>
				</div>
			</div>
			<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}" style="color: #ccc;font-size: 20px;margin-bottom: -30px"><button data-dismiss="alert" class="close">×</button>
				<label id="loginError" class="error">${message}</label>
			</div>

			<div class="danxuank " style="margin-top: -20px"><label><input name="usertype" type="radio" value="student" ><div class="radio"></div><span><img src="${ctxStatic}/evalue/images/r1.png" ></span>
			</label>
				<label><input name="usertype" type="radio" value="teacher" checked="checked"><div class="radio"></div><span><img src="${ctxStatic}/evalue/images/r2.png" ></span></label>
				<label><input name="usertype" type="radio" value="admin" ><div class="radio"></div><span><img src="${ctxStatic}/evalue/images/r3.png" ></span></label>
			</div>

			<input class="shou" name="" type="button"  onclick="login()" style="height: 40px; background-image:url('${ctxStatic}/evalue/images/login2.png');background-size:117px 38px;background-repeat:no-repeat;background-color: #ff6d00">
			<%--<div  >--%>
				<%--<button   type="button" onclick="login()" style="background-image:url('${ctxStatic}/evalue/images/login.png')">登录</button>--%>
			<%--</div>--%>
		</div>
	</form>
	<script type="text/javascript">
        function login() {
            var username=document.getElementById("username").value;
            var userpwd=document.getElementById("password").value;
            var adminvaliDate=document.getElementById("adminvaliDate").value;
            if (!checkEmpty(username)){
                alert("用户名不能为空！！");
                return;
            }
            if(!checkEmpty(userpwd)){
                alert("密码不能为空！！");
                return;
            }
            if (!checkLength(username,10,3)){
                alert("用户名格式有问题！！");
                return;
            }
            if(!checkEmpty(adminvaliDate)){
                alert("验证码不能为空！！");
                return;
            }
            document.getElementById("loginForm").submit();
        }
        // 如果在框架或在对话框中，则弹出提示并跳转到首页
        if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
            alert('未登录或登录超时。请重新登录，谢谢！');
            top.location = "${ctx}";
        }
	</script>

</div>
</body>
</html>