<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>菜单管理</title>
		<style type="text/css">
		</style>
	</head>
	<body>
		<html:form action="menuList.do">
			<html:hidden property="deleteIds" />
			<h1>
				菜单列表
			</h1>
			<ul>
				<li>
					菜单名称
					<html:text property="nameQry" />
				</li>
				<li>
					菜单路径
					<html:text property="urlQry" />
				</li>
			</ul>
			<html:submit property="query" value="查询" />
			<html:submit property="del" value="批量删除" style="display:none" />
			<input type="button" value="新增"
				onclick="window.location.href='menuModify.do'" />
			<table border="1" width="80%">
				<thead>
					<tr>
						<th>
							菜单名称
						</th>
						<th>
							菜单路径
						</th>
						<th>
							上级菜单名称
						</th>
						<th width="8%">
							编辑
						</th>
						<th width="8%">
							删除
						</th>
					</tr>
				</thead>
				<c:if test="${not empty menuList}">
					<c:forEach items="${menuList}" var="menu">
						<tr>
							<td>
								<c:out value="${menu.name }" />
							</td>
							<td>
								<c:out value="${menu.url }" />
							</td>
							<td>
								<c:out value="${menu.parentName }" />
							</td>
							<td align="center">
								<a href="menuModify.do?id=${menu.id }">编辑</a>
							</td>
							<td align="center">
								<c:if test="${menu.childrenCount eq 0}">
									<a
										href="javascript:if(confirm('是否确定删除这条记录？')){document.forms[0].deleteIds.value='${menu.id}';document.forms[0].del.click();}">删除</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</html:form>
	</body>
</html>
