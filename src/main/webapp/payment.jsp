<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Financial-Payments</title>
<style>
.heading {
	font-size: 35px;
	text-align: center;
}

.container {
	border: 1px solid #111;
	margin: 1% 38%;
	justify-items: center;
	background-color: rgb(19, 131, 216);
	border-radius: 20px;
	padding: 3% 0;
}

label {
	font-size: 17px;
	margin: 25% 0;
}  

input {
	padding: 7px 150px 7px 10px;
	border-radius: 5px;
	border: none;
	margin: 4% 0;
}

button {
	padding: 7px 25px;
	border-radius: 5px;
	border: none;
	background-color: rgb(255, 255, 0);
}
</style>
</head>
<body>
	<div class="heading">
		<h1>Do Assle free Payments Here!.</h1>
	</div>
	<div class="container">
		<h1>Confirm your Payment</h1>
		<form action="payment" method="post">
			<label for="">Card number</label><br> <input type="tel"
				name="cardnumber" placeholder="1234 5678 9012 3456"><br>
			<label for="">Expiry date</label><br> <input type="month"
				name="expirydate"><br> <label for="">CVV</label><br>
			<input type="tel" name="cvv" placeholder="3 digits"><br>
			<label for="">Name on card</label><br> <input type="text"
				name="nameoncard" placeholder="USERNAME"><br>
			<div class="btn">
				<button type="submit">Confirm Payment</button>
				<button type=reset>Cancel</button>
			</div>
		</form>
	</div>
</body>
</html>