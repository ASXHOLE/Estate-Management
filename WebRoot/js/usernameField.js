$(function() {

	$("input[type=text]").click(function() {
		if ($(this).val() == "输入账号") {
			var nulltext = "";
			$(this).val(nulltext);
			$(this).blur(function() {
				if ($(this).val() == nulltext) {
					$(this).val("输入账号");
					
				}

			});
		}

	});

});