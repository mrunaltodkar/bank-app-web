<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Update Account</title>
</head>

<body>
	<form action="updateBank.do" method="post">

		<label for="Account_Id"><b>Account Id</b></label> <input type="text"
			placeholder="Account_Id" name="account_id" readonly="readonly"
			value="${accounts.accountId}" required><br> <label
			for="Customer_name"><b>Account HolderName</b></label> <input
			type="text" placeholder="Enter Account Holder Name"
			name="customer_name" value="${accounts.accountHolderName}" required><br>

		<label for="Customer_account"><b>CustomerAccount</b></label> <select
			name="account_type">
			<option value="${accounts.accountType}">Savings</option>
			<option value="${accounts.accountType}">Current</option>
		</select> <br> <br> <label for="Customer_balance"><b>Account
				Balance</b></label> <input type="text" placeholder="Enter Account Balance"
			name="account_balance" value="${accounts.accountBalance}"
			readonly="readonly" required> <br> <br> <br> <input
			type="submit" value="Update BankAccount">

	</form>
</body>