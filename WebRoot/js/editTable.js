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
	//�ҵ������������������е�������  
    $("tbody tr:even").css("background-color","#ECE9D8");  
    //�ҵ����еĵ�Ԫ��  
    var name = $("tbody td");  
    //����Щ��Ԫ��ע��������¼�  
    name.click(function () { 
    	//�ҵ���ǰ��굥����td  
        var tdObj = $(this);  
        //����ԭ�����ı�  
        var oldText = $(this).text();  
        //����һ���ı���  
        var inputObj = $("<input type='text' value='" + oldText + "'/>");  
        //ȥ���ı���ı߿�  
        //inputObj.css("border-width", 0);  
        inputObj.click(function () {  
            return false;  
        });  
        //ʹ�ı���Ŀ�Ⱥ�td�Ŀ����ͬ  
        inputObj.width(tdObj.width());  
        inputObj.height(tdObj.height());  
        //ȥ���ı������߾�  
        inputObj.css("margin", 0);  
        inputObj.css("padding", 0);  
        inputObj.css("text-align", "center");  
        inputObj.css("font-size", "16px");  
        inputObj.css("background-color", tdObj.css("background-color"));  
        //���ı���ŵ�td��  
        tdObj.html(inputObj);  
        //�ı���ʧȥ�����ʱ���Ϊ�ı�  
        inputObj.blur(function () {   
            var newText = $(this).val();  
            tdObj.html(newText);          
        });  
        //���������ı���ͷ  
          inputObj.trigger("focus");  
    });  
    //�����ı����ϻس���esc�����Ĳ���  
    inputobj.keyup(function(event){  
        //��ȡ��ǰ���¼��̵ļ�ֵ  
        var keycode = event.which;  
        //����س���  
        if(keycode == 13){  
            //��ȡ����ǰ�ı����е�����  
            var inputvalue = $(this).val();  
            tdobj.val(inputvalue); 
        }  
        //����esc����  
        if(keycode == 27){  
            //��td�е����ݻ�ԭ��text  
        	var newText = $(this).val();  
            tdobj.html(tdtext);  
        }  
    });  
  
});  