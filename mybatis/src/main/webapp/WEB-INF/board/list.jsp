<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-30
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">LIST</h2>
    <form action="/board/search">
        <div class="row g-3 align-items-center text-end">
            <div class="col-auto">
                <select class="form-select" aria-label="Default select example" name="search">
                    <option value="subject" ${search eq "subject"?"selected":""}>제목</option>
                    <option value="content" ${search eq "content"?"selected":""}>내용</option>
                    <option value="all" ${search eq "all"?"selected":""}>제목+내용</option>
                    <option value="username" ${search eq "username"?"selected":""}>작성자</option>
                </select>
            </div>
            <div class="col-auto">
                <input type="text" name="searchWord" class="form-control">
            </div>
            <div class="col-auto">
                <button class="btn btn-outline-primary">검색</button>
                <a href="/board/content-list" class="btn btn-outline-primary">목록</a>
            </div>

        </div>
    </form>
    <h2 class="mt-5 mb-5">LIST</h2>
    <form action="/board/delete-all" method="post" id="formDeleteAll">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>No</th>
                <th>Subject</th>
                <th>Name</th>
                <th>Hit</th>
                <th>Date</th>
                <th>Regroup</th>
                <th>Relevel</th>
                <th>Restep</th>
                <th>Available</th>
                <th>전체삭제<input type="checkbox" id="check-all" value="yes"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${boardList}" var="boardDto" varStatus="loop">
                <tr>
                    <td>${total-boardDto.num+1}</td>
                    <c:choose>
                        <c:when test="${boardDto.relevel>1}">
                            <td><a href="../board/view?no=${boardDto.no}&num=${boardDto.num}"
                                   class="step step${boardDto.relevel}"><i
                                    class="bi bi-arrow-return-right"></i>${boardDto.subject}</a></td>
                        </c:when>
                        <c:otherwise>
                            <td><a href="../board/view?no=${boardDto.no}&num=${boardDto.num}">${boardDto.subject}</a>
                            </td>
                        </c:otherwise>
                    </c:choose>
                    <td>${boardDto.userName}</td>
                    <td>${boardDto.hit}</td>
                    <td>${boardDto.regdate}</td>
                    <td>${boardDto.regroup}</td>
                    <td>${boardDto.relevel}</td>
                    <td>${boardDto.restep}</td>
                    <td>${boardDto.available}</td>
                    <td>삭제하기<input type="checkbox" class="check" name="check" value="${boardDto.no}"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="mt-5 mb-5 ">
            <a href="/board/write" class="btn btn-outline-primary">글쓰기</a>
            <button class="btn btn-danger" id="deleteAll">삭제하기</button>
        </div>
    </form>
</div>
<%@include file="../include/footer.jsp" %>
<script>
    $("#check-all").change(function (){
        if($("#check-all").is(":checked")){
            $(".check").prop("checked",true)
        }else {
            $(".check").prop("checked",false)
        }
    })
    $("#deleteAll").on("click",function (){
        const deleteAll = confirm("삭제하시겠습니까?")
        if(deleteAll){
            $("#formDeleteAll").submit()
        }else {
            return false;
        }
    })
</script>
