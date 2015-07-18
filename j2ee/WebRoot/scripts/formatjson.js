$(function() {
	$("#formatjson,#compressjson").bind("click", function() {
		if ($("#formatjsons").val().length < 2) {
			showInfo("请输入需要处理的字符！");
			return;
		}

		var id = $(this).attr("id");
		var type = id == "formatjson" ? "format" : "compress";

		$.post(location.href, {
			data : $("#formatjsons").val(),
			type : type,
			beforeSend : function() {
				$("#formatinfo").html('');
				$("#formatjsond").val('');
				showInfo("处理中...");
			}
		}, function(data) {
			var dom = $.parseJSON(data);
			if(!dom.data[0])
			{
				alert("请检查Json字串格式\r\n 正确格式：{\"a\":1,\"b\":2}\r\n 属性名称用双引号！");
				return ;
			}
			var b = dom.data[0];
			b=b.replace(/\\u([0-9a-fA-F]{4})/g,function($0,$1) {return String.fromCharCode('0x'+$1);});
			$("#formatjsond").val(b);
			
			if (type == "compress")
				$("#formatinfo").html("\t原始大小:" + dom.data[1] + "\t压缩后：" + dom.data[2] + "\t压缩比：" + dom.data[3]);
		});
	});

	/**清理*/
	$(".formatjson a.ui-icon-close[forid]").bind('click', function() {
		$('#' + $(this).attr('forid')).val('');
		showInfo("清理完成！");
	});
	
	/**复制*/
	$(".formatjson a.ui-icon-transferthick-e-w[forid]").bind('click', function() {
		var d = $('#' + $(this).attr('forid')).val();
		if(d.length<1) return;
		$('#' + $(this).attr('toid')).val(d);
		showInfo("将输出结果填到输入！！");
	});

	/*复制*/
	$(".formatjson a.ui-icon-copy[forid]").each(function() {
		var id = "#" + $(this).attr('forid');

		var clip = new ZeroClipboard.Client();
		clip.setHandCursor(true);
		clip.addEventListener('mouseOver', function(client) {
			clip.setText($(id).val());
		});

		clip.addEventListener('complete', function(client, text) {
			showInfo("复制成功!");
		});

		clip.glue(this);
	});
});
