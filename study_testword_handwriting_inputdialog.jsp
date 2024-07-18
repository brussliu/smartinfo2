<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="dialog" id="study_testword_handwriting_inputdialog" style="display:block;background-color: rgb(255,255,240);overflow:hidden;">
    <script>
        var study_testword_handwriting_inputdialog = null;
        $(function () {
            study_testword_handwriting_inputdialog = $("#study_testword_handwriting_inputdialog").dialog({
                title: "単語手書き",
                autoOpen: false,
                resizable: true,
                height: 800,
                width: 1200,
                modal: true,
                open: function () {
                    setTimeout(function () { });
                },
                close: function () {
                    setTimeout(function () { });
                },
            });

        });
    </script>
    <style>
        .from_list{
            width: 100%;
            color: #353535;
            line-height: 1rem;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            display: -webkit-flex;
            align-items: center;
            -webkit-align-items: center;
            justify-content: space-between;
            -webkit-justify-content: space-between;
        }

        .sign_box {
            margin-top: 2px;
            padding: 2px 2px 5px 5px;
        }
        .sign_content {
            border: 1px solid red;
            background: rgb(255,255,240);
            width: 1160px;
            height: 700px;
        }
        canvas {
            width: 100% !important;
            height: 100% !important;
        }
    </style>

    <div class="from_list">
        <div>単語手書き</div>
        <div>
            <button type="button" id="reset_btn" style="width: 100px;">クリア</button>
            <button type="button" id="submit_btn" style="width: 100px;">提交</button>
            &nbsp;
        </div>

    </div>
    <div class="sign_box">
        <div class="sign_content" id="canvas_box">
        </div>
    </div>
    <input type="hidden" id="signContent">
    <input type="hidden" id="signContent_tb">

</div>
<script>

    // *********电子签名功能*********
    let canvas_box = $("#canvas_box");    // 获取canvas标签
    canvas_box.jSignature({lineWidth:'10'}); // 初始化签名画板，初始化之后就可以进行操作
    let signImgSrc = "";   // 提交后台的图片路径
    // 监听手动签名滑动开始、移动、释放时，执行输入框失去焦点的功能，解决签名时触发软键盘的问题
    $("#canvas_box").on("touchstart mousemove touchend",function () {
        // console.log("走签名-mousemove事件");
        $("input,textarea").blur();
    });

     // 重置按钮，生成图片之后，可重置画板，并清空图片
    $("#reset_btn").on("click",function (e) {

        canvas_box.jSignature("reset");
        signImgSrc = "";
        e.preventDefault();
    });

    //提交签名
    $("#submit_btn").on("click",function (e) {
    	// 获取签名长度
    	let signLen = canvas_box.jSignature("getData","native").length; 
  		//签名判断，长度为0，提示客户签名
    	if(signLen==0){	
    		alert("入力していません！");
    	}else{
    		//当有商户签字时，赋值签字的base64码
    		let datapair = canvas_box.jSignature("getData","image");    // 获取签名的“base64”数据
            //console.log("datapair",datapair);
            // 拼接完整的base64转码,根绝接口说明，传递。
            signImgSrc = 'data:' + datapair[0] + "," + datapair[1];

            $("#signContent").val(signImgSrc);

            $("#signContent_tb").val(signImgSrc);
            //console.log('确认后的base64路径=',signImgSrc);

            Efw("study_testword_savehandwriting");
    	}
    });

</script>