<%@ page import="java.util.*, shop.product.*, javax.servlet.http.HttpSession" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="theLocale" value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale }" scope="session" />
<fmt:setLocale value="${theLocale }"/>
<fmt:setBundle basename="shop.language.labels"/>

<!DOCTYPE HTML>
<html>
<head>
    <meta name="description" content="Shop"/>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="Wojciech" content="Zebrowski" />

	<title> <fmt:message key="label.shop_title" /> </title>
    <link rel="stylesheet" href="Configuration.css" media="screen" type="text/css"/>
</head>

<% 	HttpSession sesja = request.getSession(); 
	String login = (String)sesja.getAttribute("login");
	List<Discount> discount = (List<Discount>) request.getAttribute("DiscountList");
	int size = discount.size();
		%>

<body>
<div id="header">
    <div class="container">
        <div class="flag">
          <a href="MainServletLog?theLocale=en_GB"> <img alt="English" src="img/en_GB_flag.png"/> </a>  
        </div>
        <div class="flag">
            <a href="MainServletLog?theLocale=pl_PL"> <img alt="Polski" src="img/pl_PL_flag.png"/> </a>
        </div>
        
        <div class="strefa_klienta">
            <p>Witaj <%=login %> </p>
            <a href="MainServlet">Wyloguj</a>
        </div>
        <div class="logo">
           <a href="MainServletLog"><img alt="LOGO" src="img/logo.png"/></a>
        </div>
        <div class="menu">
            <ul>
                <li><a href="O_sklepieLog.jsp"> <fmt:message key="label.shop_about"/> </a></li>
                <li><a href="ProductControllerLog"> <fmt:message key="label.products"/> </a></li>
                <li><a href="KontaktLog.jsp"> <fmt:message key="label.contact"/> </a></li>
            </ul>
        </div>
        
        <div class="koszyk">
            <a href="Basket.jsp"> <img alt="KOSZYK" src="img/Koszyk.png"/></a>
        </div>

    </div>
</div>

<div id="content">
    <div class="container">
        
         <ol id="promocja">
         <%for(int i=0; i<size; i++) { %>
                <li class="promocja-produkt">
                    <ul>
                        <li class="opis">
                            <div class="content">
                                <p class="status">
                                    <a href="#"><img alt="Promocja" src="img/promo.png"/></a>
                                </p>
                                <h4> <%=discount.get(i).getNazwa() %> </h4>
                                <p class="cena"> <fmt:message key="label.old_price"/> <%=discount.get(i).getStara_cena() %> zl </p>
                                <p class="cena"> <fmt:message key="label.new_price"/> <%=discount.get(i).getNowa_cena() %> zl </p>
                            </div>
                            <p class="photo">
                                <img alt="Produkt" src="img/produkt.png" />
                            </p>
                        </li>
                        <li class="ilosc">
                            <label> <fmt:message key="label.amount_desc"/> <%=discount.get(i).getIlosc()%> <fmt:message key="label.amount"/> </p></label>
                            <input type="text" name="ilosc"/>
                            <input type="submit" name="ilosc-confirm" value="<fmt:message key="label.addBasketButton"/>"/>
                        </li>
                    </ul>
                </li>
           <% } %>   
            </ol>   
    </div>
</div>

<div id="stopka">
    <div class="container">
        <p>Copyright &copy; 2017 Wojciech Zebrowski</p>
    </div>

</div>
</body>
</html>
