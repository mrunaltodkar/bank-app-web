package com.capgemini.bankapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.capgemini.bankapp.exception.AccountNotFoundException;
import com.capgemini.bankapp.exception.LowBalanceException;
import com.capgemini.bankapp.model.BankAccount;
import com.capgemini.bankapp.service.BankAccountService;
import com.capgemini.bankapp.service.impl.BankAccountServiceImpl;

@WebServlet(urlPatterns = { "*.do" }, loadOnStartup = 1)
public class BankAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BankAccountService bankService;

	public BankAccountController() {
		bankService = new BankAccountServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String path = request.getServletPath();
		System.out.println(path);

		if (path.equals("/New_account.do")) {
			String accountHolderName = request.getParameter("customer_name");
			String accountType = request.getParameter("account_type");
			double balance = Double.parseDouble(request.getParameter("account_balance"));

			BankAccount account = new BankAccount(accountHolderName, accountType, balance);
			if (bankService.addNewBankAccount(account)) {
				out.println("<h2> Bank account created successfully </h2>");
				out.println("<h2><a href='index.html'>|Home|</h2>");
				out.close();
			}
		}

		if (path.equals("/withdraw.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));
			double amount = Double.parseDouble(request.getParameter("account_balance"));

			try {
				double result = bankService.withdraw(accountId, amount);
				out.println("<h2>Transaction successful!!! " + "Remaining Balance is: " + result + "</h2>");
				out.println("<h2><a href='index.html'>|Home|</h2>");
				out.close();
			} catch (LowBalanceException | AccountNotFoundException e) {
				out.println("<h2>" + e.getMessage() + "</h2>");
				out.println("<h2><a href='withdraw.html'>|Back|</h2>");

			}
		}

		if (path.equals("/deposit.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));
			double amount = Double.parseDouble(request.getParameter("account_balance"));

			try {
				double result = bankService.deposit(accountId, amount);
				out.println("<h2>Transaction successful!!! " + "Your current Balance is: " + result + "</h2>");
				out.println("<h2><a href='index.html'>|Home|</h2>");
				out.close();
			} catch (AccountNotFoundException e) {
				out.println("<h2>" + e.getMessage() + "</h2>");
				out.println("<h2><a href='deposit.html'>|Back|</h2>");

			}

		}

		if (path.equals("/fund_transfer.do")) {
			long fromAccount = Long.parseLong(request.getParameter("account_id"));
			long toAccount = Long.parseLong(request.getParameter("account_id"));
			double amount = Double.parseDouble(request.getParameter("account_balance"));

			try {
				double result = bankService.fundTransfer(fromAccount, toAccount, amount);
				out.println("<h2>Transaction successful!!! " + "Your current Balance is: " + result + "</h2>");
				out.println("<h2><a href='index.html'>|Home|</h2>");
				out.close();
			} catch (LowBalanceException | AccountNotFoundException e) {
				out.println("<h2>" + e.getMessage() + "</h2>");
				out.println("<h2><a href='fund_transfer.html'>|Back|</h2>");

			}

		}

		if (path.equals("/delete_account.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));

			try {
				boolean result = bankService.deleteBankAccount(accountId);

				out.println("<h2> Account Deleted: </h2>");
				out.println("<h2><a href='index.html'>|Home|</h2>");
				out.close();
			} catch (AccountNotFoundException e) {
				out.println("<h2>" + e.getMessage() + "</h2>");
				out.println("<h2><a href='delete_account.html'>|Back|</h2>");

			}

		}
		
		if (path.equals("/Check_balance.do")) {
			long accountId = Long.parseLong(request.getParameter("account_id"));

			try {
				double result = bankService.checkBalance(accountId);

				out.println("<h2> Your Balance is :" + result + " </h2>");
				out.println("<h2><a href='index.html'>|Home|</h2>");
				out.close();
			} catch (AccountNotFoundException e) {
				out.println("<h2>" + e.getMessage() + "</h2>");
				out.println("<h2><a href='Check_balance.html'>|Back|</h2>");

			}

		}
	}

}
