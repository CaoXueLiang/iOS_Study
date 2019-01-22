<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<form id="dataForm" method="post" class="hide" action="#">
	    <input id="partner" name="partner" type="partner" value="${resultMap.data.partner }" />
	    <input id="seller_id" name="seller_id" type="hidden" value="${resultMap.data.seller_id }" />
	    <input id="out_trade_no" name="out_trade_no" type="hidden" value="${resultMap.data.out_trade_no }" />
	    <input id="subject" name="subject" type="hidden" value="${resultMap.data.subject }" />
	    <input id="body" name="body" type="hidden" value="${resultMap.data.body }" />
	    <%--  <c:choose>
			<c:when test="${'CNY'==resultMap.data.currency}">
				<input id="rmb_fee" name="rmb_fee" type="hidden" value="${resultMap.data.rmb_fee }" />
			</c:when>
			<c:otherwise>
				<input id="total_fee" name="total_fee" type="hidden" value="${resultMap.data.total_fee }" />
			</c:otherwise>   
	    </c:choose> --%>
	    <input id="total_fee" name="total_fee" type="hidden" value="${resultMap.data.total_fee }" />
	    
	    <input id="notify_url" name="notify_url" type="hidden" value="${resultMap.data.notify_url }" />
	    <input id="service" name="service" type="hidden" value="${resultMap.data.service }" />
	    <input id="payment_type" name="payment_type" type="hidden" value="${resultMap.data.payment_type }" />
	    <input id="_input_charset" name="_input_charset" type="hidden" value="${resultMap.data._input_charset }" />
	    <input id="it_b_pay" name="it_b_pay" type="hidden" value="${resultMap.data.it_b_pay }" />
	    <input id="return_url" name="return_url" type="hidden" value="${resultMap.data.return_url }" />
	    <input id="currency" name="currency" type="hidden" value="${resultMap.data.currency }" />
	    <input id="forex_biz" name="forex_biz" type="hidden" value='${resultMap.data.forex_biz }' />
	    <input id="product_code" name="product_code" type="hidden" value='${resultMap.data.product_code }' />
	    <input id="sign" name="sign" type="hidden" value='${resultMap.data.sign }' />
	    <input id="sign_type" name="sign_type" type="hidden" value='${resultMap.data.sign_type }' />
	    
	</form>
	
	<form id="sendForm" method="post" class="hide" action="#">
	    <input id="bankId" name="bankId" type="hidden" value="${resultMap.data.bankId }" />
	    <input id="merchantId" name="merchantId" type="hidden" value="${resultMap.data.merchantId }" />
	    <input id="bankCardNO" name="bankCardNO" type="hidden" value="${resultMap.data.bankCardNO }" />
	    <input id="userPhoneNO" name="userPhoneNO" type="hidden" value="${resultMap.data.userPhoneNO }" />
	    <input id="userName" name="userName" type="hidden" value="${resultMap.data.userName }" />
	    <input id="orderId" name="orderId" type="hidden" value="${resultMap.data.orderId }" />
	    <input id="orderAmount" name="orderAmount" type="hidden" value="${resultMap.data.orderAmount }" />
	    <input id="orderDate" name="orderDate" type="hidden" value="${resultMap.data.orderDate }" />
	    <input id="returnUrl" name="returnUrl" type="hidden" value="${resultMap.data.returnUrl }" />
	    <input id="notifyUrl" name="notifyUrl" type="hidden" value="${resultMap.data.notifyUrl }" />
	    <input id="orderRemark" name="orderRemark" type="hidden" value='${resultMap.data.orderRemark }' />
	    
	    <input id="tunnelMerchantId" name="tunnelMerchantId" type="hidden" value='${resultMap.data.merchantId}' />
	    <input id="payTunnelId" name="payTunnelId" type="hidden" value='${pay.payTunnelId }' />
	    <input id="bizAmount" name="bizAmount" type="hidden" value='${pay.bizAmount }' />
	    <input id="payTp" name="payTp" type="hidden" value='${pay.payTp }' />
	   
	    <input id="returnCode" name="returnCode" type="hidden" value='${resultMap.data.returnCode }' />
	    <input id="returnMsg" name="returnMsg" type="hidden" value='${resultMap.data.returnMsg }' />
	    <input id="subCode" name="subCode" type="hidden" value='${resultMap.data.subCode }' />
	    <input id="subMsg" name="subMsg" type="hidden" value='${resultMap.data.subMsg }' />
	    <input id="txnId" name="txnId" type="hidden" value='${resultMap.data.txnId }' />
	    <input id="bizId" name="bizId" type="hidden" value='${resultMap.data.bizId }' />
	    <input id="state" name="state" type="hidden" value='${resultMap.data.state }' />
	    
	    <input id="payInfo" name="payInfo" type="hidden" />
	
	</form>
	
	<script type="text/javascript">
	$(document).ready(function() {
		var values = {};    
		var valuesend = {};    
	    var a = $("#dataForm").serializeArray();
	    var payTp = $("#payTp").val();
	    $.each(a, function() {    
	        if (values[this.name] !== undefined) {    
	            if (!values[this.name].push) {    
	            	values[this.name] = [ values[this.name] ];    
	            }    
	            values[this.name].push(this.value || '');    
	        } else {    
	        	values[this.name] = this.value || '';    
	        }    
	    }); 
	    $("#payInfo").val(JSON.stringify(values));
	    
	    var b = $("#sendForm").serializeArray();
	    $.each(b, function() {    
	        if (valuesend[this.name] !== undefined) {    
	            if (!valuesend[this.name].push) {    
	            	valuesend[this.name] = [ valuesend[this.name] ];    
	            }    
	            valuesend[this.name].push(this.value || '');    
	        } else {    
	        	valuesend[this.name] = this.value || '';    
	        }    
	    }); 
	    
	    $("#sendForm").attr("action","${resultMap.data.payUrl }");
	   
	    var json = JSON.stringify(valuesend);
		if("96" == payTp){
			test.callAppback(json);
			callAppback(json);
	    }else{
	    	$("#sendForm").submit();
	    }
	});
	</script>
</body>
</html>