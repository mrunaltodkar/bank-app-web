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
<title>Account Details</title>
</head>

<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">

			<ul class="nav navbar-nav">
				<br>
				<br>
				<br>
				<li class="active"><a href="index.html">index</a></li>
				<li><a href="New_account.html">New_account</a></li>
				<li><a href="withdraw.html">withdraw</a></li>
				<li><a href="fund_transfer.html">fund_transfer</a></li>
				<li><a href="search_account.do">search_account</a></li>
				<li><a href="Check_balance.html">Check_balance</a></li>
				<li><a href="Account_details.do">Account_details</a></li>
				<li><a href="delete_account.html">delete_account</a></li>
				<li><a href="Update_bank_account.do">Update_bank_account</a></li>
			</ul>
		</div>
	</nav>

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Account Number</th>
				<th scope="col">Customer Name</th>
				<th scope="col">Account Type</th>
				<th scope="col">Account Balance</th>
			</tr>
		</thead>
		<tbody>

			<tr>
				<td>${accounts.accountId}</td>
				<!-- this statement internally calls getter method -->
				<td>${accounts.accountHolderName}</td>
				<td>${accounts.accountType}</td>
				<td>${accounts.accountBalance}</td>
			</tr>


		</tbody>
	</table>


</body>