<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/admin.css">

<Script type="text/javascript">
	function insert() {
		location.href = "clubInsert.ad";
	}
</Script>

<div class="bodyPart content" align="center">

	<h2 align="center">동아리 목록</h2>
	<div class="input-group ">
		<Form action="clubList.ad" method="get" style="margin: auto">
			<div class="input-group-prepend">
				<select name="whatColumn" class="custom-select selectMinBox">
					<option value="all">선택</option>
					<option value="name">동아리명</option>
					<option value="cdate">생성일</option>
				</select> <input type="text" class="form-control adminTopInput"
					name="keyword"> <input
					class="btn btn-outline-dark logBtn adminTopInput" type="submit"
					value="검색">
			</div>
		</Form>
	</div>

	<div class="conDiv">
		<table class="table table-bordered table-hover mainboard">
			<tr>
				<td colspan="5" align="right"><input
					class="btn btn-outline-dark logBtn" type="button" value="동아리 추가"
					onclick="insert()"></td>
			</tr>
			<tr>
				<th>동아리번호</th>
				<th>동아리명</th>
				<th>생성일</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
			<c:forEach var="club" items="${lists}">

				<tr>
					<td>${club.num }</td>
					<td><a href="clubDetail.ad?num=${club.num}&pageNumber=${pageInfo.pageNumber}">${club.name }</a></td>
					<td><fmt:parseDate value="${club.cdate }" pattern="yyyy-MM-dd"
							var="RegDate" /> <fmt:formatDate value="${RegDate}"
							pattern="yyyy-MM-dd" var="RegDate" /> ${RegDate}</td>
					<td><a
						href="clubDelete.ad?num=${club.num}&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
					<td><a
						href="clubUpdate.ad?num=${club.num}&pageNumber=${pageInfo.pageNumber}">수정</a></td>

				</tr>
			</c:forEach>

		</table>

		${pageInfo.pagingHtml }
	</div>
</div>
<%@ include file="../concert/footer.jsp"%>