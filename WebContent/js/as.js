function keyup(){  
    var quantity = document.getElementById("quantity").value;  
    if(isNaN(quantity) ||  parseInt(quantity)!=quantity || parseInt(quantity)<1){  
        quantity = 1;  
        return;  
    }  
    if(quantity>=10){  
        document.getElementById("quantity").value=quantity.substring(0,quantity.length-1);  
        alert("商品数量不能大于10");  
    }  
}  
  
/*商品数量+1*/  
function numAdd(){  
    var quantity = document.getElementById("quantity").value;  
    var num_add = parseInt(quantity)+1;  
    var price=document.getElementById("price").value;  
    if(quantity==""){  
        num_add = 1;  
    }  
    if(num_add>=10){  
        document.getElementById("quantity").value=num_add-1;  
        alert("商品数量不能大于10");  
    }else{  
        document.getElementById("quantity").value=num_add;  
        var Num=price*num_add;  
        document.getElementById("totalPrice").innerHTML=Num.toFixed(2);  
    }  
}  
/*商品数量-1*/  
function numDec(){  
    var quantity = document.getElementById("quantity").value;  
    var price=document.getElementById("price").value;  
    var num_dec = parseInt(quantity)-1;  
    if(num_dec>0){  
        document.getElementById("quantity").value=num_dec;  
        var Num=price*num_dec;  
         document.getElementById("totalPrice").innerHTML=Num.toFixed(2);  
    }  
}  
function show()  
{  
    document.getElementById("totalPrice").innerHTML=3.25*3;  
}  