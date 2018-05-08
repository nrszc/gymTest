//弹窗
function modaldemo(){
	$("#modal-demo").modal("show");
}

$(function(){
	$(".input-text,.textarea").Huifocusblur();
	
	//幻灯片
	jQuery("#slider-3 .slider").slide({mainCell:".bd ul",titCell:".hd li",trigger:"click",effect:"leftLoop",autoPlay:true,delayTime:700,interTime:3000,pnLoop:false,titOnClassName:"active"});
	
	$(".panel").Huifold({
		titCell:'.panel-header',
		mainCell:'.panel-body',
		type:1,
		trigger:'click',
		className:"selected",
		speed:"first",
	});
	
	//邮箱提示	
	$("#email").emailsuggest();
	
	//checkbox 美化
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//日期插件
	$("#datetimepicker").datetimepicker({
    	format: 'yyyy-mm-dd',
		minView: "month",
		todayBtn:  1,
		autoclose: 1,
		endDate : new Date()
	}).on('hide',function(e) {
		//此处可以触发日期校验。
	});
	
	/*+1 -1效果*/
	$("#spinner-demo").Huispinner({
		value:1,
		minValue:1,
		maxValue:99,
		dis:1
	});
	
	$(".textarea").Huitextarealength({
		minlength:10,
		maxlength:200.
	});
	
	$("#demoform").validate({
		rules:{
			email:{
				required:true,
				email:true,
			},
			username:{
				required:true,
				minlength:4,
				maxlength:16
			},
			telephone:{
				required:true,
				isMobile:true,
			},
			password1:{
				required:true,
				isPwd:true,
			},
			password2:{
				required:true,
				equalTo: "#password1"
			},
			sex:{
				required:true,
			},
			datetimepicker:{
				required:true,	
			},
			checkbox2:{
				required:true,
			},
			city:{
				required:true,
			},
			website:{
				required:true,
				url:true,
			},
			beizhu:{
				maxlength:500,
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$("#modal-shenqing-success").modal("show");
			$(form).ajaxSubmit();
		}
	});

	//选项卡
	$("#HuiTab-demo1").Huitab({
		index:0
	});
	
	$("#Huitags-demo1").Huitags();
	
	
	//hover效果
	$('.maskWraper').Huihover();
	
	//星级评价
	$("#star-1").raty({
		hints: ['1','2', '3', '4', '5'],//自定义分数
		starOff: 'iconpic-star-S-default.png',//默认灰色星星
		starOn: 'iconpic-star-S.png',//黄色星星
		path: 'static/h-ui/images/star',//可以是相对路径
		number: 5,//星星数量，要和hints数组对应
		showHalf: true,
		targetKeep : true,
		click: function (score, evt) {//点击事件
			//第一种方式：直接取值
			$("#result-1").html('你的评分是'+score+'分');
		}
	});

	$( ".ui-sortable" ).sortable({
		//connectWith: ".panel",
		items:".panel",
		handle: ".panel-header",
		//delay: 300, //时间延迟
		//distance: 15, //距离延迟
		placeholder: "ui-state-highlight", //占位符样式
		update: function(event, ui){
			
		}
	}).disableSelection();

 	var _bodyHeight = $(window).height();
	var _doch = $(document).height();
	$(".containBox").height(_bodyHeight);

	/*左右滑动菜单*/
    $(".JS-nav-toggle").click(function() {
		$("body").addClass('sideBox-open');
        $(".containBox-bg").height(_bodyHeight).show();
    });
    $(".containBox-bg").click(function() {
		$(this).hide();
		$("body").removeClass('sideBox-open');
    });
});