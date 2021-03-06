<%-- 
    Document   : products
    Created on : May 9, 2019, 5:51:09 PM
    Author     : KiroHikaru
--%>

<%@page import="java.util.List"%>
<%@page import="model.Laptop"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="LaptopPage.css">
        <title>HC Store - Laptop</title>
    </head>
    <body>
        <div class="container">
            <div class="header-unused-1"></div>
            <div class="title-name">
                <span>
                    <a href="HomePage.jsp">
                        HC Store
                    </a>
                </span>
            </div>
            <div class="search">
                <form id="search-form" method="POST" action="Laptop">
                    <input type="text" id="search-text" name="searchText" placeholder="Search.." align="center">
                    <button type="submit" id="search-button" alt="Search">
                        <img src="IMAGE/ICON/Search_25px.png">
                    </button>
                </form>
            </div>
            <div class="category">
                <a href="Laptop" style="text-decoration: none;">
                    <button id="category-button">
                        <img src="IMAGE/ICON/Laptop_25px.png">Laptop
                    </button> 
                </a>
                <a href="Smartphone" style="text-decoration: none;">
                    <button id="category-button" >
                        <img src="IMAGE/ICON/Touchscreen_25px.png">Smartphone
                    </button> 
                </a>
            </div>
            <div class="login">
                <a href="" style="text-decoration: none;">
                    <button id="login-button">
                        <img src="IMAGE/ICON/Login_25px.png">Login
                    </button>
                </a>
            </div>
            <div class="header-unused-2"></div>
            <div class="nav" align="center">
                <form method="POST" action="Laptop">  
                    <b>Sort by &emsp;</b>
                    <select name="sortOption"align="center" style="padding: 0.35% 1.5% 0.35% 1.5%; font-size: 105%;">
                        <option name="sortOption" value="0">(None)</option>
                        <option name="sortOption" value="1">Price (Ascending)</option>
                        <option name="sortOption" value="2">Price (Descending)</option>
                        <option name="sortOption" value="3">Brand (Ascending)</option>
                        <option name="sortOption" value="4">Brand (Descending)</option>
                    </select>
                    <input id="apply-button" type="submit" value="Apply">
                </form>
            </div>
            <div class="side-1" align="center">
                <a href="http://www.saigonco-op.com.vn/?utm_source=VnExpress&utm_medium=statis&utm_campaign=C187335" target="_blank">
                    <img src="IMAGE/AD/banner1.png">
                </a>  
            </div>
            <div class="middle">
                <form>
                    <table align="center" cellpadding="15vh"
                           style="border: 1px; border-collapse: collapse;">
                        <%
                            List<Laptop> laptops = (ArrayList<Laptop>) request.getAttribute("laptops");
                            List<String> columnNames = (ArrayList<String>) request.getAttribute("columnNames");
                            String[] columnValues = new String[columnNames.size()];

                            for (Laptop laptop : laptops) {
                                out.println("<tr cellpadding=\"30\" style=\"border-bottom: 1px solid #ddd;\">");
                                out.println("   <td><img style=\"width: 405px; height: 270px;\"src=\"IMAGE/LAPTOP/" + laptop.getImage() + "\"></td>");
                                out.println("   <td>");
                                out.println("       <table>");
                                out.println("           <tr align=\"center\">");
                                out.println("               <td colspan=\"2\" style=\"font-size: 130%; top: 50%; -ms-transform: translateY(-50%); transform: translateY(-50%);\"><b>" + laptop.getFullName() + "</b></td>");
                                out.println("           </tr>");

                                //Get product's specification
                                columnValues[3] = laptop.getCpuModel();
                                columnValues[4] = laptop.getRam();
                                columnValues[5] = laptop.getGpuModel();
                                columnValues[6] = laptop.getHdd();
                                columnValues[7] = laptop.getSsd();
                                columnValues[8] = laptop.getDisplay();
                                columnValues[9] = laptop.getBattery();
                                columnValues[10] = laptop.getOs();

                                //Display product's specification
                                for (int i = 3; i <= 10; i++) {
                                    if (columnValues[i] != null) {
                                        out.println("<tr>");
                                        out.println("   <th>" + columnNames.get(i - 1).toString() + "&emsp; </th>");
                                        out.println("   <td>" + columnValues[i] + "</td>");
                                        out.println("</tr>");
                                    }
                                }

                                out.println("       </table>");
                                out.println("   </td>");
                                out.println("   <td style=\"font-size: 110%;\"><b>" + laptop.getPrice() + "</b></td>");
                                out.println("   <td><input id=\"buy-button\" type=\"submit\" value=\"Buy Now\"></td>");
                                out.println("</tr>");
                            }
                        %>
                   </table>  
                </form>
            </div>
            <div class="side-2" align="center">
                <a href="https://www.sendo.vn/su-kien/sinh-nhat-sendo?utm_source=eclick&utm_medium=cpm-adnet&utm_campaign=tq_pc-bannersky_event-sinhnhat7tuoi-display_na_na_na_na_na&shortlink=82a4efd7&pid=Display_eclick_cpm-adnet_tq_pc-bannersky_2_event-sinhnhat7tuoi-display_na_na_na_na_na_300519&c=Display_eclick_cpm-adnet_tq_pc-bannersky_2_event-sinhnhat7tuoi-display_na_na_na_na_na_300519&is_retargeting=true" target="_blank">
                    <img src="IMAGE/AD/banner2.png">
                </a>
            </div>
            <div class="footer">
                © Copyright 2019 Anh Huy. All rights reserved. <br>
                https://github.com/HCMIU-CSE-DATABASE2019/Laptop-Store
            </div>
        </div>
    </body>
</html>
