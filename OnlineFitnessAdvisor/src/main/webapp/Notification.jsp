
<%@page import="org.unibl.etf.models.beans.Notification"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<div id="universalNotification" class="alert alert-dismissible fade show position-fixed top-0 end-0 m-3 d-none" role="alert" >
        <span id="notificationMessage" class="fw-semibold"></span>
        <button type="button" class="btn-close" aria-label="Close" onclick="closeNotification()"></button>
    </div>
    
    <script>
    function showNotification(message, isSuccess) {
        const notification = document.getElementById('universalNotification');
        const notificationMessage = document.getElementById('notificationMessage');
        let tmp="";
        if(isSuccess)
        	tmp='Success!';
        else
        	tmp='Error!';
        notificationMessage.innerHTML = '<strong>'+tmp+'</strong> '+message+'.';
        notification.classList.remove('d-none');

        if (isSuccess) {
            notification.classList.add('alert-success');
        } else {
            notification.classList.add('alert-danger');
        }

        setTimeout(() => {
            notification.classList.add('d-none');
        }, 3000);
    }

    function closeNotification() {
        const notification = document.getElementById('universalNotification');
        notification.classList.add('d-none');
    }
    <%if(session.getAttribute("notification")!=null){%>
    	showNotification('<%=((Notification)session.getAttribute("notification")).getMessage()%>',true);
   <%} %>
   
    
    </script>