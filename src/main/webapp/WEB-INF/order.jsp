<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@page import = "woorigym.user.model.vo.UserTable" %>
    <%
    UserTable user = (UserTable)session.getAttribute("user_id");
  %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리짐 결제페이지</title>
    <!-- 부트스트랩 CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <!-- 헤더 CSS -->
     
    <style>
        /* reset */
        * {
            margin:0; 
            padding:0;
        }
         /* 공통헤더에 있던 부분인데 css로 따로 빼면 적용이 안되서 reset에 포함 */
        #main_tnb2 {
            position: absolute;
            top: 10px;
            bottom: 10px;
            right: 30px;
            margin: 10px;
            overflow: hidden;
            width: 500px;
            height: 100px;
        }
		
        #main_tnb2>ul>li {
            display: inline-block;
            padding: 5px;
        }
        /* 로그인 전: 로그인 | 최근본상품 */
        /* 로그인 후: OOO님 | 로그아웃 | 마이페이지 | 장바구니 | 최근본상품 */
        #main_tnb2 li::after {
            padding-left: 10px;
            content: "|";
        }
        #main_tnb2 li:last-child::after {
            padding-left: 10px;
            content: "";
        }
         /* 공통헤더~reset에 포함  끝*/
        </style>
        <style>
            /* content */
            section {
                width: 1200px;
                padding: 30px 0 30px 0;
            }
        
            #main_bnb {
                text-align: center;
            }
        
            #main_bnb li {
                display: inline-block;
            }

        /* 신상품 | 인기상품 | 타임세일 */
            #main_bnb li::after{
                padding: 10px;
                content: "|";
            }
            #main_bnb li:last-child::after{
                padding: 15px;
                content: "";
            }

          #main_img {
              position: relative;
              left: 20px;
              box-sizing: content-box;
            }
            #main_img a{
                display: inline-block;
                padding: 15px;
                /* position: relative; */
                
            }
            #main_img img{
            /* vertical-align: middle; */
              /* display: inline-block; */
              width: 250px;
          }
            </style>
            <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/orderpage.css"/>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    // cart 와 product 불러와서 상품 정보 불러오는 js
    var totalpro = "";
    $(document).ready(function () {
        //해당하는 상품정보 불러오기
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
            type: "post",
            url: "orderproduct",
            async: false,
            data: { user_id: "<%=user.getUser_id() %>" },
            dataType: "json", // 전달받을 객체는 JSON 이다.
            success: function (data) {
                var product = data;
                console.log(product);
                var ptext = "";
                var p = 0;
                for (var i in product) {
                    let pricecomma = comma(product[i].price);
                    console.log(pricecomma);
                    ptext += "<tr><td>" + (p + 1) + "<td>" + product[i].productName + "</td><td id=product" + p + ">" + pricecomma + "<td></tr>";
                    p++;
                }
                $("#productinfo").append(ptext);
            }
        });
        //카트에서 상품 수량 가져오기
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
            type: "post",
            url: "order",
            async: false,
            data: { user_id: "<%=user.getUser_id() %>" },
            dataType: "json", // 전달받을 객체는 JSON 이다.
            success: function (data) {
                var cart = data;
                console.log(cart);
                var ctext = "";

                var p = 0;
                var producttotal = 0;
                for (var i in cart) {
                    let priceXquant = ((1 * cart[i].cartQuantity) * (1 * minusComma($('#product' + p).text())));
                    ctext += "<tr><td>" + cart[i].cartQuantity + "</td><td>" + comma(priceXquant) + "원" + "</td><td>" + comma(priceXquant * 0.05) + "원</td><td><button>삭제</button></td><tr>";
                    producttotal += priceXquant;
                    p++;
                }
                $("#cartinfo").append(ctext);
                $("#producttotal").append(comma(producttotal) + "원");
                $("#totalprice").text(comma(producttotal) + "원");
            }
            //error : function(request,status,error) {
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+
            //"\n"+"error:"+error);
            //}
        });
    }); // ready
    //콤마 제거
    function minusComma(value) {
        value = value.replace(/[^\d]+/g, "");
        return value;
    }

    //콤마 추가
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

</script>

<script type="text/javascript">
    //주문자정보 불러오기
    $(document).ready(function () {
        //해당하는 상품정보 불러오기
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
            type: "post",
            url: "orderuserinfo",
            data: { user_id: "<%=user.getUser_id() %>" },
            dataType: "json", // 전달받을 객체는 JSON 이다.
            success: function (data) {
                console.log("주문자 정보 호출 성공");
                var userinfo = data[0];
                console.log(userinfo);
                $("#uname").text(userinfo.user_name);
                $("#uphone").text(userinfo.phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3"));
                $("#availmile").val(userinfo.mileage);
                $("#insertmile").on("propertychange change keyup paste input", function () {
                    $("#availmile").val(userinfo.mileage - (1 * $("#insertmile").val()));
                });
            }
        });
    }); // ready
</script>

<script type="text/javascript">
    // 배송지 정보 불러오기
    $(document).ready(function () {
        //해당하는 상품정보 불러오기
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
            type: "post",
            url: "orderaddress",
            data: { user_id: "<%=user.getUser_id() %>" },
            dataType: "json", // 전달받을 객체는 JSON 이다.
            success: function (data) {
                console.log("주소지 정보 호출 성공");
                var addressinfo = data;
                console.log(addressinfo);
                $("#postcode").val(addressinfo[0].postcode);
                $("#baiscaddr").val(addressinfo[0].basic_address);
                $("#detailaddr").val(addressinfo[0].detail_address);
                var p = 1;
                for (p in addressinfo) {
                    var seladdr = " <option>" + addressinfo[0].postcode + " // " + addressinfo[p].basic_address + " // " + addressinfo[p].detail_address + " </option>";
                    $("#selectaddress").append(seladdr);
                    p++;
                }
            }
        });
    }); // ready
    function chageaddrSelect() {
        if ($("#selectaddress option:selected")) {
            if ($("#selectaddress option:selected").val() != "배송지 목록에서 선택") {
                var addr = $("#selectaddress option:selected").val().split(" // ");
                $("#postcode").val(addr[0]);
                $("#baiscaddr").val(addr[1]);
                $("#detailaddr").val(addr[2]);
            }
        };
    }

</script>

<script type="text/javascript">
// 결제 정보 js

    $(document).ready(function () {
        //쿠폰불러오기
        $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
            type: "post",
            url: "ordercoupon",
            data: { user_id: "<%=user.getUser_id() %>" },
            dataType: "json", // 전달받을 객체는 JSON 이다.
            success: function (data) {
                console.log("쿠폰 정보 호출 성공");
                var couponinfo = data;
                // console.log(couponinfo[0].c_discount);
                var p = 0;
                for (p in couponinfo) {
                    var selcoun = " <option id='c_name" + p + "'>" + couponinfo[p].c_name + " </option>";
                    var selcoup = " <span id='c_name" + p + "dis' style='display:none'>" + couponinfo[p].c_discount + " </span>";
                    $("#couponselect").append(selcoun);
                    $("#payinfo").append(selcoup);
                    p++;
                }
            }
        });

        var totalnum = 1 * $("#totalprice").text().replace(/[^0-9]/g, '');
        console.log("확인 : " + totalnum);

        if (totalnum >= 100000) {
            $("#shippingpay").val(0);
        } else {
            $("#shippingpay").val(2500);
        }

        setInterval(function () {
            var finalpay = totalnum - (1 * $("#insertmile").val()) - (1 * $("#coudiscount").val()) + (1 * $("#shippingpay").text())
            $("#finalpay").val(finalpay);

        }, 10);
    }); //ready
    function chageacouSelect() {
        if ($("#couponselect option:selected")) {
            if ($("#couponselect option:selected").val() != "쿠폰 선택") {
                var couid = $("#couponselect option:selected").attr("id");
                var coudis = "#" + couid + "dis";
                console.log("쿠폰 선택");
                console.log($(coudis).text());
                $("#coudiscount").val($(coudis).text());
            } else if ($("#couponselect option:selected").val() == "쿠폰 선택") {
                $("#coudiscount").val(0);
            }
        };
    }
</script>
    
    </head>
<body>
		<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
 	<aside>
    <div id="side-menu">
        <ul>
            <li>마이페이지</li>
            <li><a href="#">주문/배송조회</a></li>
            <li><a href="#">취소/교환/반품</a></li>
            <li><a href="#">상품 후기</a></li>
            <li><a href="#">쿠폰 관리</a></li>
            <li><a href="#">상품 문의(Q&A)</a></li>
        </ul>
    </div>
</aside>


<section>
  <div class="orderform">
        ⦁ 주문 상품 정보 <br>
        <table id="productinfo" style=" float: left;">
            <tr>
                <th>번호</th>
                <th>상품 이름</th>
                <th>가격</th>
            </tr>
            <tr id="productinfotd">
            </tr>
        </table>
        <table id="cartinfo">
            <tr>
                <th>수량</th>
                <th>총 가격</th>
                <th>적립금</th>
            </tr>
        </table>

        <span id="producttotal">▸ 총 결제 예상 금액 : </span>
    </div>  
     <div class="orderform">
            ⦁ 주문자 정보 <br>
            <table id="userinfo">
                <tr>
                    <th> 이름 </th>
                    <td id="uname"></td>
                </tr>
                <tr>
                    <th> 연락처 </th>
                    <td id="uphone"> <input type="text" id="phone1" size="2"> - <input type="text" id="phone2" size="2"> - <input
                            type="text" id="phone3" size="2"></td>
                </tr>
            </table>
        </div>
 
 <div class="orderform">
            ⦁ 배송지 정보 입력
            <table id="addressuinfo">
                <tr>
                    <th>배송지 선택</th>
                    <td>기본 주소 선택 <input type="radio" name="addrtype" checked="checked"> 배송주소록에서 선택 <input type="radio" name="addrtype"><select id="selectaddress" onchange="chageaddrSelect()">
        <option>배송지 목록에서 선택</option> 
</select> 새 주소 입력 <input type="radio" name="addrtype"></td>
                </tr>
                <tr>
                    <th rowspan="2">주소</th>
                    <td><input type="text" id="postcode"> <button>우편번호 찾기</button></td>
                </tr>
                <tr>
                    <td><input type="text" id="baiscaddr"></td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td><input type="text" id="detailaddr"></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>나중에 구현</td>
                </tr>
                <tr>
                    <th>요청사항</th>
                    <td><textarea  cols="30" rows="5" style="resize: none;"></textarea></td>
                </tr>
            </table>
        </div>
 <div class="orderform">
            ⦁ 결제 정보 입력
            <table id="payinfo">
                <tr><th>총 상품 가격 </th><td id="totalprice"></td></tr>
                <tr><th>적립금 사용 </th><td id="usemile"><input type="text" placeholder="0" id="insertmile">현재 금액 : <input type="text" id="availmile"></td></tr>
                <tr><th>쿠폰 사용 </th><td id="usecoupon"><select id="couponselect" onchange="chageacouSelect()"><option>쿠폰 선택</option></select>적용 금액 : <input id="coudiscount" readonly></td></tr>
                <tr><th>배송비 </th><td> <input type="text"  id="shippingpay" readonly> </td></tr>
                <tr><th>총 결제 금액</th><td><input type="text" id="finalpay" readonly> </td></tr>
                <tr><th>결제 수단</th><td>신용카드 <input type="radio" name="paymethod">무통장입금 <input type="radio" name="paymethod"></td></tr>
            </table>
        </div>
</section>
  <p>
            <input type="submit" value="결제 완료">  
        </p>

    <footer></footer>
</body>


</html>