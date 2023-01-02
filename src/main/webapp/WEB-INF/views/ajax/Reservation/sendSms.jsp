<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Send Mail</title>
    <script type="text/javascript" src="/scripts/jquery-ui/jquery.min.js"></script>
	<script type="text/javascript" src="/scripts/common/common-ui.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <h1>sms test</h1>
 
    <form action="/space/sms/send" method="post">
        <table>
            <tr class="form-group">
                <td>발송할 번호</td>
                <td>
                    <input type="text" class="form-control" name="to" placeholder="번호입력">
                </td>
            </tr>
            <tr class="form-group">        
                <td>내용</td>
                <td>
                    <textarea class="form-control" name="content" placeholder="내용입력"> </textarea>
                </td>
            </tr>
        </table>
        <button class="btn btn-default">발송</button>
    </form>
 
 </div>
 </body>
 </html>