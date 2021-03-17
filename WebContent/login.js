		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");

		function login() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}

		function register() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}
		function openPopUp(url, name) {

			var url = 'category.jsp';
			var name = 'ctgry';
			var options = 'width=550, height=800, top=30, left=30, resizable=no, scrollbars=no, location=no';

			window.open(url, name, options);

		}
		