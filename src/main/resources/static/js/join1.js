$(document).ready(function(){
    $("#idCheckBtn").click(function(){
        if($("#name").val()==""){
            $("#msg").html("<strong style='color:red'> 아이디를 입력해주세요. </strong>");
            $("#name").focus();
            return;
        }
        let name = { name : $("#name").val() };

        $.ajax({
            url:"/idCheck",	//아이디가 전송되어질 곳
            type:"post",		//전송방식
            data:JSON.stringify(name),
            dataType:"json",
            contentType: "application/json",
            success:function(result){
                console.log("성공");
                console.log(result);
                var idChk = result;	//true 또는 false를 받음
                if(idChk==false){	//사용할 수 없는 아이디
                    $("#idCheck").val("false");
                    $("#msg").html("<strong style='color:red'>기존에 사용되고 있는 아이디 입니다. 다시 입력하시기 바랍니다.</strong>");
                    $("#id").focus();
                } else if(idChk==true){	//사용 가능한 아이디
                    $("#idCheck").val("true");
                    $("#msg").html("<strong style='color:blue'>사용가능한 아이디 입니다.</strong>");
                } else if(idChk==""){
                    $("#msg").html("<strong>아이디가 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
                }
            },
            error: function(err) {
                console.log("실패");
                console.log(err);
            }
        });
    });
    $("#emailCheckBtn").click(function(){
        if($("#email").val()==""){
            alert("이메일을 입력하지 않으셨습니다.");
            $("#email").focus();
            return;
        }
        var params = {	email : $("#email").val()	} //전송되어질 데이터를 객체로 묶음
        $.ajax({
            url:"/emailCheck",	//아이디가 전송되어질 곳
            type:"post",		//전송방식
            dataType:"json",	//데이터 반환 방식
            data:params,		//전송방식이 post인 경우 객체로 묶어서 전송
            success:function(result){
                console.log(result);
                var emailChk = result;	//true 또는 false를 받음
                if(emailChk==false){	//사용할 수 없는 이메일
                    $("#emailCheck").val("false");
                    $("#msg2").html("<strong style='color:red'>기존에 사용되고 있는 이메일 입니다. 다시 입력하시기 바랍니다.</strong>");
                    $("#email").focus();
                } else if(emailChk==true){	//사용 가능한 이메일
                    $("#emailCheck").val("true");
                    $("#msg2").html("<strong style='color:blue'>사용가능한 이메일입니다.</strong>");
                } else if(emailChk==""){
                    $("#msg2").html("<strong>이메일이 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
                }
            }
        });
    });
});





function joinConfirm(f){
    if(f.password.value!=f.password2.value){
        alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
        f.password.focus();
        return false;
    }
    if(f.idCheck.value!="true"){
        alert("아이디 중복 체크를 하지 않으셨습니다.");
        return false;
    }
    if(f.emailCheck.value!="true"){
        alert("아이디 중복 체크를 하지 않으셨습니다.");
        return false;
    }
}

function findAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            console.log(data);
            var roadAddr = data.roadAddress;
            var jibunAddr = data.jibunAddress;
            document.getElementById("postcode").value = data.zonecode;
            if(roadAddr !== '') {
                document.getElementById("addr1").value = roadAddr;
            } else if(jibunAddr !== ''){
                document.getElementById("addr1").value = jibunAddr;
            }
            document.getElementById("addr2").focus();
        }
    }).open();
}