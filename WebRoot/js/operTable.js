
function deld(){  
	if(confirm("确定删除选中行?"))
    {//确定
		//$("table tr th input[type=checkbox]:checked").parent().parent().remove();
		 
		 $("table tr  th input[type=checkbox]:checked").each(function (index){
			 //alert($(this).parent().parent().index());
			 $("table tr:even").css("background-color","#ECE9D8");
			 $("table tr:odd").css("background-color","#FFFFFF");
			 //alert($(this).attr("value"));
			 location.href="../buildingInfoServlet?id="+$(this).attr("value")+"";
			 $(this).parent().parent().remove();
			 //window.location.href="../buildingInfoServlet";
		 });
		 //alert($("table tr th input[type=checkbox]:checked").parent().parent().index());
		 //window.location.href="buildingInfo_servlet?method=delete";
    }
    else
    {//
       
    }
		
};
	 
	 