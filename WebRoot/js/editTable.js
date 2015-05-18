$(function() {
		 
		 $("tbody tr th #modifi ").click(function(){
			 //alert($(this).parent().parent().index());
			 //alert($(this).parent().parent().find("th:eq(1)").text());
			 //alert($(this).parent().parent().find("td:eq(0)").text());
			 var bid=$(this).parent().parent().find("th:eq(1)").text();
			 var bname=$(this).parent().parent().find("td:eq(0)").text();
			 var baddr=$(this).parent().parent().find("td:eq(1)").text();
			 var bpostcode=$(this).parent().parent().find("td:eq(2)").text();
			 var bstorey=$(this).parent().parent().find("td:eq(3)").text();
			 var brooms=$(this).parent().parent().find("td:eq(4)").text();
			 var belevator=$(this).parent().parent().find("td:eq(5)").text();
			 location.href="../buildingInfoServlet?method=updatebuilding&bid="+bid+"&bname="+bname+"&baddr="+baddr+"&bpostcode="+bpostcode+"&bstorey="+bstorey+"&brooms="+brooms+"&belevator="+belevator;
			 
			 
			 });
	 });



$(function () {  
	//找到表格的内容区域中所有的奇数行  
    $("tbody tr:even").css("background-color","#ECE9D8");  
    //找到所有的单元格  
    var name = $("tbody td");  
    //给这些单元格注册鼠标点击事件  
    name.click(function () { 
    	//找到当前鼠标单击的td  
        var tdObj = $(this);  
        //保存原来的文本  
        var oldText = $(this).text();  
        //创建一个文本框  
        var inputObj = $("<input type='text' value='" + oldText + "'/>");  
        //去掉文本框的边框  
        //inputObj.css("border-width", 0);  
        inputObj.click(function () {  
            return false;  
        });  
        //使文本框的宽度和td的宽度相同  
        inputObj.width(tdObj.width());  
        inputObj.height(tdObj.height());  
        //去掉文本框的外边距  
        inputObj.css("margin", 0);  
        inputObj.css("padding", 0);  
        inputObj.css("text-align", "center");  
        inputObj.css("font-size", "16px");  
        inputObj.css("background-color", tdObj.css("background-color"));  
        //把文本框放到td中  
        tdObj.html(inputObj);  
        //文本框失去焦点的时候变为文本  
        inputObj.blur(function () {   
            var newText = $(this).val();  
            tdObj.html(newText);          
        });  
        //点击光标在文本框开头  
          inputObj.trigger("focus");  
    });  
    //处理文本框上回车和esc按键的操作  
    inputobj.keyup(function(event){  
        //获取当前按下键盘的键值  
        var keycode = event.which;  
        //处理回车键  
        if(keycode == 13){  
            //获取当当前文本框中的内容  
            var inputvalue = $(this).val();  
            tdobj.val(inputvalue); 
        }  
        //处理esc按键  
        if(keycode == 27){  
            //将td中的内容还原成text  
        	var newText = $(this).val();  
            tdobj.html(tdtext);  
        }  
    });  
  
});  