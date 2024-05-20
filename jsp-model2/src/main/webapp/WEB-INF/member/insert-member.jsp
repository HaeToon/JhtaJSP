<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">회원가입</h2>

    <form action="../member/insert-process" method="post">
        <div class="mb-3">
            <label for="userID" class="form-label">User ID</label>
            <input type="text" class="form-control" id="userID" placeholder="User ID" name="userID">
            <button type="button" class="btn btn-dark mt-2" id="btn-duplicate">아이디 중복 체크</button>
        </div>
        <div class="mb-3">
            <label for="userPW" class="form-label">Password</label>
            <input type="password" class="form-control" id="userPW" placeholder="User PW" name="userPW">

        </div>
        <div class="mb-3">
            <div class="mb-3">
                <label for="userPW02" class="form-label">Password Confirm</label>
                <input type="password" class="form-control" id="userPW02" placeholder="User PW">
                <div class="invalid-feedback mt-2"></div>
            </div>
            <div class="mb-3">
                <label for="userName" class="form-label">Name</label>
                <input type="text" class="form-control" id="userName" placeholder="User Name" name="userName">
            </div>
            <div class="mb-3">
                <label for="userBirth" class="form-label">Birth</label>
                <input type="date" class="form-control" id="userBirth" placeholder="User Birth" name="userBirth">
            </div>
            <div class="mb-3">
                <label for="userEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="userEmail" placeholder="Example@example.com"
                       name="userEmail">
            </div>
            <div>
                <label for="postCode" class="form-label">Post Code</label>
            </div>
            <div class="row g-3 align-items-center">
                <div class="mb-3 col-auto">
                    <input type="text" class="form-control  " id="postCode" placeholder="post code" name="postcode">
                </div>
                <div class="mb-3 col-auto">
                    <button type="button" id="btn-postcode" class="btn btn-dark">우편번호찾기</button>
                </div>
            </div>
            <div class="mb-3">
                <label for="adress" class="form-label">Adress</label>
                <input type="text" class="form-control" id="adress" placeholder="Adress" name="adress" readonly>
            </div>
            <div class="mb-3">
                <label for="detailAdress" class="form-label">Detail Adress</label>
                <input type="text" class="form-control" id="detailAdress" placeholder="Datail Adress"
                       name="detailAdress">
            </div>
            <div>
                <button class="btn btn-primary" id="btn-sign">Sign up</button>
                <button type="reset" class="btn btn-outline-primary ">Reset</button>
            </div>
        </div>
    </form>
</div>
<script>
    let isIdChecked = true;
    $("#userPW02").on("keyup", function (e) {
        // console.log("키를 눌렀다 뗏습니다.")
        if ($("#userPW02").val() === $("#userPW").val()) {
            $(".invalid-feedback").text("비밀번호가 일치합니다.")
            $(".invalid-feedback").show()
        } else {
            $(".invalid-feedback").text("비밀번호가 불일치합니다.")
            $(".invalid-feedback").hide()
        }
    })
    $("#btn-sign").on("click", function () {
        if ($("#userID").val().trim() === "") {
            alert("아이디는 필수입력사항입니다.")
            $("#userID").focus();
            return false;
        }
        if ($("#userPW").val().trim() === "") {
            alert("비밀번호는 필수입력사항입니다.")
            $("#userPW").focus();
            return false;
        }
        if ($("#userName").val().trim() === "") {
            alert("이름 필수입력사항입니다.")
            $("#userName").focus();
            return false;
        }
        if ($("#userEmail").val().trim() === "") {
            alert("이메일 필수입력사항입니다.")
            $("#userEmail").focus();
            return false;
        }
        if ($("#postCode").val().trim() === "") {
            alert("우편번호는 필수입력사항입니다.")
            $("#postCode").focus();
            return false;
        }
        if ($("#adress").val().trim() === "") {
            alert("주소는 필수입력사항입니다.")
            $("#adress").focus();
            return false;
        }
        if ($("#userPW").val() !== $("#userPW02").val()) {
            alert("비밀번호가 일치하지 않습니다.")
            $("#userPW02").focus();
            return false;
        }
        if (!isIdChecked) {
            alert("아이디 중복확인 바랍니다.")
            $("#userID").focus();
            return false;
        }
    });
    //ajax - jquery axios fetch
    $("#btn-duplicate").on("click", function () {
        $.ajax({
            url: "id-check-process.jsp",
            data: {
                userID: $("#userID").val()
            },
            method: "post",
            success: function (data) {
                console.log(data);
                if (data.count > 0) {
                    alert("이미 생성되어있는 아이디입니다. 다른아이디를 입력해주세요");
                    $("#userID").val("");
                    $("#userID").focus();
                } else {
                    const used = confirm("생성 가능한 아이디입니다. 사용하시겠습니까?");
                    if (used) {
                        isIdChecked = true;
                        $("#userID").attr("readonly", true);
                    } else {
                        $("#userID").val("");
                        $("#userID").focus();
                    }
                }
            },
            fail: function (error) {
                console.log(error);
            }
        })
    });
    $("#btn-duplicate2").on("click", function (e) { //a href 사용시
        $.ajax({
            url: "id-check-process.jsp",
            data: {
                userID: $("#userID").val()
            },
            method: "post",
            success: function (data) {
                console.log(data);
                if (data.count > 0) {
                    alert("이미 생성되어있는 아이디입니다. 다른아이디를 입력해주세요");
                    $("#userID").val("");
                    $("#userID").focus();
                } else {
                    const used = confirm("생성 가능한 아이디입니다. 사용하시겠습니까?");
                    if (used) {
                        $("#userID").attr("readonly", true);
                    } else {
                        $("#userID").val("");
                        $("#userID").focus();
                    }
                }
            },
            fail: function (error) {
                console.log(error);
            }
        })
        // e.preventDefault(); 새로고침 방지
        return false; //새로고침방지
    });
    $("#btn-postcode").on("click", makePostCode);

    function makePostCode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ""; // 주소 변수
                let extraAddr = ""; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // $("#detail-adress").val(extraAddr);

                } else {
                    // $("#detail-adress").val("");
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#postCode").val(data.zonecode);
                $("#adress").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("#detailAdress").focus();
            }
        }).open();
    }
</script>
<%@include file="../include/footer.jsp" %>
