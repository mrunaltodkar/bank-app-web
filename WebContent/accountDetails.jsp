<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <style>
            
            table, th, td {
                           border: 1px solid black;
                          border-collapse: collapse;
                          }
                
                </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Account Details</title>
</head>
<body background="bank_card.jpg">
        <form action="getAccountdetails.do" method="post">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    
                  <ul class="nav navbar-nav">
                      <br><br><br>
                    <li class="active"><a href="index.html">index</a></li>
                    <li><a href="New_account.html">New_account</a></li>
                    <li><a href="withdraw.html">withdraw</a></li>
                    <li><a href="deposit.html">deposit</a></li>
                    <li><a href="fund_transfer.html">fund_transfer</a></li>
                    <li><a href ="search_account.html">search_account</a></li>
                    <li><a href="delete_account.html">delete_account</a></li>
                    <li><a href="Check_balance.html">Check_balance</a></li>
                    <li><a href="updateBankAccount.html">Update_bank_account</a></li>
                    
                  </ul>
                </div>
              </nav>
                <div class="container">

                        
                                <div class="jumbotron" align="center">
                                  <h1>Account Details</h1> 
                                 
                              </div>
                    <br><br><br><br><br>
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
                            <c:forEach var="account" items="${accounts}">
                              <tr>
                                <td>${account.accountId}</td>
                                <td>${account.accountHolderName}</td>
                                <td>${account.accountType}</td>
                                <td>${account.accountBalance}</td>
                              </tr>                     
                            </c:forEach>
                              
                            </tbody>
                          </table>
                          
                          
                               
                </div>
              </form>
              
             
</body>
</html>