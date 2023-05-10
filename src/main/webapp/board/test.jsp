<%@page import="com.myweb.commons.PageVO"%>
<%@page import="com.myweb.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	for(int i=0;i<300;i++){
		String title = "테스트입니다."+i;
		String wrtier = "글쓴이"+i;
		String content = "테스트내용"+i;
	}
--%>
<%
	int countArticles = BoardDAO.getInstance().countArticles();
	out.print("# 총 게시물 수 : "+countArticles+"개<br>");
	out.print("--------------------------------------<br>");
	
	//끝페이지 번호 계산 테스트
	PageVO paging = new PageVO();
	paging.setPage(98);
	paging.setCpp(10);
	int displayBtn = 30;
	
	int endPage = (int) Math.ceil(paging.getPage() / (double)displayBtn) * displayBtn;
	out.print("끝 페이지 번호:" + endPage +"번 <br>");
	
	// 시작 페이지 번호 계산 테스트
	int beginPage =  (endPage - displayBtn) +1;
	out.print("시작 페이지 번호:" +beginPage +"번 <br>");
	
	// 이전버튼 활성, 비활성 여부
	boolean isPrev = (beginPage == 1)? false : true;
	out.print("이전버튼 활정화 여부:"+ isPrev +"<br>");
	
	// 다음버튼 활성, 비활성 여부
	boolean isNext = (countArticles <= (endPage * paging.getCpp())) ? false : true;
	out.print("다음버튼 활정화 여부:"+ isNext +"<br>");
	
	//끝 페이지 보정
	if (!isNext) { //isNext == false
		endPage = (int) Math.ceil(countArticles / (double) paging.getCpp() ) ;
	}
	
	out.print("보정 후 끝페이지 번호: "+ endPage+"번");
	
	
	
	

%>
</body>
</html>