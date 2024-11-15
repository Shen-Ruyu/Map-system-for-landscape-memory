layui.use(['element','layer'],function(){
	var element = layui.element;
	var layer = layui.layer;
	var $ = layui.jquery;
	bodierAutoHeight();
	$(window).resize(function(e){
		bodierAutoHeight();
	});
	//自适应高度
	function bodierAutoHeight(){
		var winHeight = $(window).height(); //浏览器高度
		$('.layui-bodier').height(winHeight-80); //主界面高度
		$('.tabFrame').height(winHeight-200);
	}
	//navTab导航事件
	$('body').on('click','.nav-tab' ,function(e){
		var t = $(this).children('label').text();//标题
		var id = $(this).attr('lay-id');//tab位置
		var url = $(this).attr('lay-href');//数据地址
		var tabFrame = '<iframe src="'+url+'" class="tabFrame" frameborder="0"></iframe>';
		if($(this).attr('data-type')=='tabAdd'){
			tab.tabAdd(t,id,tabFrame);
			$(this).attr('data-type','tabChange');
		} else {
			tab.tabChange(id);	
		}
		bodierAutoHeight();
	});
	//tab触发事件
	var tab = {
		tabAdd: function(t,id,tabFrame){
			//新增一个Tab项
			element.tabAdd('tab', {
				title: t //用于演示
				,content: tabFrame//内容
				,id: id //Tab项唯一ID
			});
			element.tabChange('tab', id);//切换到新增Tab项
		}
		,tabDelete: function(othis){
			//删除指定Tab项
			element.tabDelete('tab', id); //删除：“商品管理”
			othis.addClass('layui-btn-disabled');;
		}
		,tabChange: function(id){
			//切换到指定Tab项
			element.tabChange('tab', id); //切换到：用户管理
		}
	};
	//tab关闭监听事件
	element.on('tabDelete(tab)', function(data){
		var id = $(this).parent().attr('lay-id');//tab位置
		$('.nav-tab[lay-id='+id+']').attr('data-type','tabAdd');//nav位置
	});
	//刷新当前页面
	$('.refresh').on('click',function(){
		var layid = $('.layui-tab .layui-this .layui-tab-close').parent().attr("lay-id");
		$('.layui-tab .layui-this .layui-tab-close').trigger('click');
		$('.layui-nav a[lay-id="'+layid+'"]').trigger('click');
	});
	//安全退出
	$('.logout').on('click',function(){
		layer.confirm('是否确定退出系统？', {icon: 3, title:'系统信息'}, function(index){
			/*$.ajax({
				url:'json/login.json',
				type:'get',
				data:'',
				dataType:"json",
				beforeSend:function(){//console.log(JSON.stringify(data.field));
				},
				success:function(data){//do something
					if(data.code==0){
						layer.msg('安全退出！',{icon:1});
						
					} else {
						layer.alert('抱歉，系统繁忙，请稍后再试！',{icon:2});
					}
				},
				error:function(data){//do something
					layer.msg('与服务器连接失败',{icon: 2});
				}
			});*/
			localStorage.clear();
			window.location.href = 'login.html';
			layer.close(index);
		});
	});
	
	$('.box').on('click', '.flexible', function (event) {
	    if ($('.layui-side').css("width") == '0px') {
	      //此处左侧菜单是显示状态，点击隐藏
	    	$(".layui-side").css("width","220px");
	    	$(".layui-header").css("margin-left","220px");
	    	$(".layui-bodier").css("margin-left","220px");
	      $('.page-content-bg').hide();
	    } else {
	      //此处左侧菜单是隐藏状态，点击显示
	    	$(".layui-side").css("width","0px");
	    	$(".layui-header").css("margin-left","0px");
	    	$(".layui-bodier").css("margin-left","0px");
	      //点击显示后，判断屏幕宽度较小时显示遮罩背景
	      if ($(window).width() < 768) {
	        $('.page-content-bg').show();
	      }
	    }
	  });

});