function logout(){  
	if(confirm("您真的要退出？"))
    {//
		window.location.href="./mainServlet?method=logout";
		
    }
    else
    {//
       
    }
};