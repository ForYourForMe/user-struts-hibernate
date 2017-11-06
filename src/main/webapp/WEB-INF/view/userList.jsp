<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="userListPanel">
        <div class="queryUser">
            用户名称：
            <input type="text" name="userName" class="input_200">
            <button type="button" class="button_50">查询</button>
        </div>
        <table class="userlist" cellspacing="0">
            <thead>
                <th width="4%">序号</th>
                <th width="15%">用户名称</th>
                <th>邮箱</th>
                <th width="4%">性别</th>
                <th width="22%">创建时间</th>
                <th width="22%">更新时间</th>
                <th width="10%">操作</th>
            </thead>
            <tbody>
            <c:forEach var="user" items="${page.userList}" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${user.userName}</td>
                    <td>${user.email}</td>
                    <td>${user.gender}</td>
                    <td>${user.createDate}</td>
                    <td>${user.updateDate}</td>
                    <td data-id="${user.id}"><a class="editUser" href="uploadEditUserPage?user.id=${user.id}">编辑</a>&nbsp;<a class="deleteUser">删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div id="page" class="page_div"></div>
    </div>

    <script>
    var pageNumber=parseInt('${page.pageNumber}');
    $(function(){
    	 var $table=$("#userListPanel").find(".userlist");
    	 console.log("${page.pageNumber}");
    	    
    	  	//分页
    		$("#page").paging({
    			pageNo: parseInt('${page.pageNumber}'),
    			totalPage:  parseInt('${page.totalPage}'),
    			totalSize:  parseInt('${page.totalUser}')
    		});
    	  	
    		/** 删除用户 **/
    		$table.find("td").find(".deleteUser").on("click",function(){
    			$this=$(this);
    			var userId=$this.parent().data("id");
    			$.dialog.confirm({content:"确定删除？",callback: "deleteUser("+userId+");"});
    		});
    		
    });
    

    
    /** 删除用户的回掉函数 **/
	function deleteUser(userId){
    	console.log(userId);
		$.ajax({
			url: "deleteUser?user.id="+userId,
			type: "post",
			async: "false",
			dataType: "json",
			success: function(data){
				$.dialog.alert({content:data.message});
				$("#bottomPanel").find(".content-panel").load("loadUserListPage?page.pageNumber="+parseInt('${page.pageNumber}'));
			}
		});
	}
	</script>