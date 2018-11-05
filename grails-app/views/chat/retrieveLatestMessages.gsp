<%@ page import="com.amordemascotas.User" %>
<g:each in="${messages}" var="message">
    <div>
        <g:if test="${User.findByUsername(sec.username()).name == message.nickname}">
            <b><font style="font-size: 10px;color: #00a1b9">${message.date.format('dd/mm/YYYY HH:mm:ss')}</font>:</b> <font style="color:#22abd7;font-size: 16px">${message.message}</font>
        </g:if>
        <g:else>
            <b><font style="font-size: 10px;color: #78bf7a">${message.date.format('dd/mm/YYYY HH:mm:ss')} </font></b>- <font style="size: 12px;color: #82bf84">${message.nickname.split(' ')[0]}<b>: </b></font></b><font style="color:#5f9a61;font-size: 16px">${message.message}</font>
        </g:else>
    </div>

</g:each>