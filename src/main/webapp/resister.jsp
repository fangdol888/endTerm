<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <link href="css/form.css" rel="stylesheet">
</head>
<body>
 <form id='form' method="post">
        <table>
            <thead>
                <td colspan="2">회원가입</td>
            </thead>
            <tbody>
                <tr>
                    <td>이름: </td>
                    <td><input type="text" id="name"></td>
                </tr>
                <tr>
                    <td>ID: </td>
                    <td><input type="text" id="userID"></td>
                </tr>
                <tr>
                    <td>PW: </td>
                    <td><input type="text" id="pw"></td>
                </tr>
                <tr>
                    <td>재입력: </td>
                    <td><input type="text" id="pwr"></td>
                </tr>
            </tbody>
            <tfoot>
                <td colspan="2"><input type='submit' value='회원가입'></td>
            </tfoot>
        </table>
    </form>
</body>
</html>