<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- subString EL�±׷� ����ϱ� -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" onclick="login()">LOG
					IN</button>
				<button type="button" class="togglebtn" onclick="register()">REGISTER</button>
			</div>
			 <!-- <div class="social-icons">
				<img src="img/fb.png" alt="facebook"> <img src="img/tw.png"
					alt="twitter"> <img src="img/gl.png" alt="google">
			</div> -->
			<form id="login" action="memberLogin.do" method="post"
				class="input-group">
				<input type="text" class="input-field" name="id"
					placeholder="User ID" required> <input type="password"
					class="input-field" name="pw" placeholder="User Password" required>
				<input type="checkbox" class="checkbox"><span>Remember
					Password</span>
				<button class="submit">Login</button>
			</form>
			<form id="register" action="memberInsert.do" method="post"
				class="input-group">
				<input type="text" name="id" class="input-field"
					placeholder="User ID" required> <input type="text"
					name="pw" class="input-field" placeholder="User Password" required>
				<input type="text" name="name" class="input-field"
					placeholder="User Name" required> <input type="text"
					name="nickName" class="input-field" placeholder="User NickName"
					required> <input type="tel" name="tel" class="input-field"
					placeholder="User phonenumber (000-0000-0000)" required> <input
					type="email" name="email" class="input-field"
					placeholder="User email" required> <input type="text"
					name="addr" class="input-field" placeholder="User address" required>
				<select onchange="categoryChange(this)" class="select-field"
					required>
					<option>User category1</option>
					<option value="cho">��/��/��</option>
					<option value="dae">����(��)</option>
					<option value="gong">������</option>
					<option value="jeon">������</option>
					<option value="gi">��Ÿ</option>
				</select> <select name="ctgry" id="ctgry" class="select-field">
					<option>User category2</option>
				</select> <select name="gender" class="select-field" required>
					<option value="M">Man</option>
					<option value="F">Woman</option>
				</select> <br><br>
				<button class="submit">REGISTER</button>
			</form>
		</div>
	</div>
	
	<script type="module" src="app.js"></script>
    <script src="login.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pixi.js/5.1.3/pixi.min.js"></script>
    <script type="text/javascript">
    function categoryChange(e) {
		var ctgry_cho = [ "�ʵ��б�", "���б� 1�г�", "���б� 2�г�", "���б� 3�г�",
				"����б� 1�г�", "����б� 2�г�", "����б�3, N����" ];
		var ctgry_dae = [ "���л�", "�Ϲ�/�л� ����", "PEET", "MEET", "LEET",
				"�ν����", "�Ǵ�/������", "���п���" ];
		var ctgry_gong = [ "������", "�ӿ� ����", "�ӿ� �ʵ�", "�ӿ� �ߵ�", "�ӿ� Ư��" ];
		var ctgry_jeon = [ "�����߰���", "ȸ���", "������", "������", "������", "�빫��",
				"�����򰡻�", "������" ];
		var ctgry_gi = [ "���", "���", "����", "����", "�ڰ���", "��Ÿ" ];
		var target = document.getElementById("ctgry");

		if (e.value == "cho") {
			var category = ctgry_cho;
		} else if (e.value == "dae") {
			var category = ctgry_dae;
		} else if (e.value == "gong") {
			var category = ctgry_gong;
		} else if (e.value == "jeon") {
			var category = ctgry_jeon;
		} else if (e.value == "gi") {
			var category = ctgry_gi;
		}

		target.options.length = 0;

		for (x in category) {
			var opt = document.createElement("option");
			opt.value = category[x];
			opt.innerHTML = category[x];
			target.appendChild(opt);
		}
	}
    </script>
</body>

</html>