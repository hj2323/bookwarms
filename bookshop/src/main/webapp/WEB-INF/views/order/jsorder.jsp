<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>폼을 동기화시키는 스크립트</title>

<script language="javascript" type="text/javascript">

	var name = "";

	var email = false;

	

	function InitValue(frm){

		name = frm.txtName.value;

		email = frm.chkmail.checked;

	}

	function ShipToBill(frm){		

		if(frm.copy.checked){

			InitValue(frm);			//현재 텍스트박스와 체크박스의 상태유지

			document.getElementById("txtDeliveryName").value = document.getElementById("txtName").value;

			frm.chkDeliveryEmail.checked = email;

		}else{						//체크박스를 해제한다면

			frm.txtDeliveryName.value=name;

			frm.chkDeliveryEmail.checked = email;		//폼객체 활용

		}

	} 

</script>

</head>

<body>

<form id="MyForm" action="" method="post">

주문자 정보<br/>

이름 : <input type="text" id="txtName" /><br />

<input type="checkbox" id="chkmail" name="chkmail"/> 배송정보를 메일로 받음



<hr />

<input type="checkbox" id="copy" onclick="ShipToBill(this.form);"/>주문자 정보와 배송지 정보가 같음

<hr />



배송지 정보<br/>

이름 : <input type="text" id="txtDeliveryName" /><br />

<input type="checkbox" id="chkDeliveryEmail" name="chkDeliveryEmail"/> 배송정보를 메일로 받음

</form>

</body>

</html>
