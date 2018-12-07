function dosubmit() {
	var form = document.getElementById('modify_form');
	if (form.onsubmit) {
		var result = form.onsubmit.call(form);
	}
	if (result !== false) {
		form.submit();
	}
}

function modify_checkValues() {
	var pw = document.getElementById('user_password').value;
	var c_pw = document.getElementById('user_check_password').value;
	var email = document.getElementById('user_email').value;

	function email_check(email) {
		var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		return (email != '' && email != 'undefined' && regex.test(email));
	}

	console.log(email_check(email));

	if (pw != c_pw) {
		var warningPw = document.getElementById('check_pw_warning');
		warningPw.innerHTML = '<div id="x"><p style="color : red">비밀번호를 확인해주세요!</p></div>';
	} else {
		document.getElementById('check_pw_warning').innerHTML = '';
		if (!email_check(email)) {
			alert('올바른E-mail형식을 입력해주세요.');
		} else if (pw.value == c_pw.value && email_check(email) == true) {
			//성공 로직
			dosubmit();
		}
	}


}