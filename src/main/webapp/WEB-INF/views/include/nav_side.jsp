<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
		    <li>
                <a href="/entity/class/class_list" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i>클래스</a>
            </li>
           <c:if test="${login.user_role =='student'}">
             <li>
                <a href="/attendance/${login.user_idx}" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i>출결</a>
            </li>
            </c:if>
            <c:if test="${login.user_role =='teacher'}">
             <li>
                <a href="/attendance" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i>출결</a>
            </li>
            </c:if>
            <c:if test="${login.user_role =='student'}">
            <li>
                <a href="/scheduler/st" class="waves-effect waves-dark"><i class="fa fa-desktop"></i>일정</a>
            </li>
            </c:if>
            <c:if test="${login.user_role =='teacher'}">
            <li>
                <a href="/scheduler/tch" class="waves-effect waves-dark"><i class="fa fa-desktop"></i>일정</a>
            </li>
            </c:if>
      		<li>
                <a href="#" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i>성적</a>
            </li>
            <li>
                <a href="#" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i>과제</a>
            </li>
            <li>
                <a href="/openboard" class="waves-effect waves-dark"><i class="fa fa-table"></i>자유게시판</a>
            </li>
            <li>
                <a href="/referenceboard" class="waves-effect waves-dark"><i class="fa fa-edit"></i>자료실</a>
            </li>
            <li>
                <a href="/userList/listAll" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i>수강학생목록</a>
            </li>
        </ul>
    </div>
</nav>