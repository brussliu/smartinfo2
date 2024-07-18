function beginTest(){

    showNumber();

	setContent();

	showWord();

}


function showNumber(){

    var no = $('#hiddenWordNo').val();
    var count = $('#hiddenWordCount').val();

    $('#nospan').html(no + "/" + count);

    if(no == 1){

        $('#btnback').hide();
    }
    if(no == count){

        $('#btnnext').html("完了");
    }
    
}

function setContent(){

    $("#wordCSpan").html($('#hiddenWordC').val());
    $("#wordJSpan").html($('#hiddenWordJ').val());

    $("#sen1CSpan").html($('#hiddenSen1C').val());
    $("#sen1JSpan").html($('#hiddenSen1J').val());

    $("#sen2CSpan").html($('#hiddenSen2C').val());
    $("#sen2JSpan").html($('#hiddenSen2J').val());
}

function nextLetter(obj){
                
    if($(obj).val().length == 1){
        $(obj).next().focus();
    }
    
}

function showWord() {

    var kbn = $("#hiddenWay2").val();

    // 0.全訳英
    // 1.日訳英(音声付き)
    // 2.日訳英(音声無し)
    // 3.音声のみ
    // 4.漢訳英(音声付き)
    // 5.漢訳英(音声無し)


    // 中国語表示
    if(kbn == 0 || kbn == 4 || kbn == 5){

        $("#wordCSpan").show();

    }
    // 日本語表示
    if(kbn == 0 || kbn == 1 || kbn == 2){

        $("#wordJSpan").show();

    }
    // 音声表示
    if(kbn == 0 || kbn == 1 || kbn == 3 || kbn == 4){

        $("#wordIcon").show();

    }

    // if($("#hiddenWay2").val() == "音声"){
    //     $("#wordJSpan").hide();
    //     $("#wordJSpan").next().show();
    // }

    // 中国語表示
    // $("#wordJSpan").html($('#hiddenWordJ').val());

    // if($("#hiddenWay2").val() == "音声"){
    //     $("#wordJSpan").hide();
    //     $("#wordJSpan").next().show();
    // }
    
    // 入力欄表示
    var wordE = $('#hiddenWordE').val();
    var html = "";
    for(var i = 0;i < wordE.length;i ++){
        html = html + "<input type='text' class='inputword' maxlength='1' oninput='nextLetter(this);'/>&nbsp;&nbsp;";
    }

    $("#wordEDiv").html(html);

    $(".inputword").keydown(function(event) {

        var keycode = (event.keyCode ? event.keyCode : event.which);

        console.log(keycode);

        // ENTER
        if(keycode === 13) {
            checkWord();
        }
        if(keycode === 16) {
            playVoice(1,0);
        }
        if(keycode === 17) {
            playVoice(1,1);
        }
        if(keycode === 18) {
            playVoice(1,2);
        }
        // 削除キー
        if(keycode === 8) {
            if ($(":focus").length > 0) {
                if($(":focus").val().length > 0){
                    $(":focus").val("");
                }else{
                    $(":focus").prev().focus();
                }
            }
        }
    });

    $(".inputword").eq(0).focus();

    // liuji
    //study_testword_handwriting_inputdialog.dialog('open');
    
    
}

function showSen1(){

    var kbn = $("#hiddenWay2").val();

    if($('#sen1CSpan').html() != "" || $('#sen1JSpan').html() != ""){

        // 0.全訳英
        // 1.日訳英(音声付き)
        // 2.日訳英(音声無し)
        // 3.音声のみ
        // 4.漢訳英(音声付き)
        // 5.漢訳英(音声無し)


        // 中国語表示
        if(kbn == 0 || kbn == 4 || kbn == 5){

            $("#sen1CSpan").show();

        }
        // 日本語表示
        if(kbn == 0 || kbn == 1 || kbn == 2){

            $("#sen1JSpan").show();

        }
        // 音声表示
        if(kbn == 0 || kbn == 1 || kbn == 3 || kbn == 4){

            $("#sen1Icon").show();

        }

        // // 日本語表示
        // $("#sen1JSpan").html($('#hiddenSen1J').val());

        // if($("#hiddenWay2").val() == "音声"){
        //     $("#sen1JSpan").hide();
        //     $("#sen1JSpan").next().show();
        // }

        $("#inputsentence1").keydown(function(event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            console.log(keycode);
            if(keycode === 13) {
                checkSen1();
            }
            if(keycode === 16) {
                playVoice(2,0);
            
            }
            if(keycode === 17) {
                playVoice(2,1);
                
            }
            if(keycode === 18) {
                playVoice(2,2);
                
            }
        });

        $('#sen1div').show();
    
        $("#inputsentence1").focus();

    }else{
        setTimeout(function(){
            $("#btnnext").focus();
        }, 100);

    }
    
}

function showSen2(){

    var kbn = $("#hiddenWay2").val();

    if($('#sen2CSpan').html() != "" || $('#sen2JSpan').html() != ""){

        // 中国語表示
        if(kbn == 0 || kbn == 4 || kbn == 5){

            $("#sen2CSpan").show();

        }
        // 日本語表示
        if(kbn == 0 || kbn == 1 || kbn == 2){

            $("#sen2JSpan").show();

        }
        // 音声表示
        if(kbn == 0 || kbn == 1 || kbn == 3 || kbn == 4){

            $("#sen2Icon").show();

        }
        // // 日本語表示
        // $("#sen2JSpan").html($('#hiddenSen2J').val());

        // if($("#hiddenWay2").val() == "音声"){
        //     $("#sen2JSpan").hide();
        //     $("#sen2JSpan").next().show();
        // }

        $("#inputsentence2").keydown(function(event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            console.log(keycode);
            if(keycode === 13) {
                checkSen2();
            }
            if(keycode === 16) {
                playVoice(3,0);
                
            }
            if(keycode === 17) {
                playVoice(3,1);
                
            }
            if(keycode === 18) {
                playVoice(3,2);
                
            }

        });

        $('#sen2div').show();

        $("#inputsentence2").focus();
    }else{
        setTimeout(function(){
            $("#btnnext").focus();
        }, 100);

    }
}

function playVoice(no,flg){

    var kbn = $("#hiddenWay2").val();

    // 0.全訳英
    // 1.日訳英(音声付き)
    // 2.日訳英(音声無し)
    // 3.音声のみ
    // 4.漢訳英(音声付き)
    // 5.漢訳英(音声無し)

    // 中国語表示
    if(kbn == 2 || kbn == 5){
    
        wrongVoice();
        return;
    }


    if(flg == 0){
        pronounceA($("#hiddenWordE").val(), no);
    }else if(flg == 1){
        // アメリカ発音
        pronounceB($("#hiddenWordE").val(), no, 0);
    }else if(flg == 2){
        // イギリス発音
        pronounceB($("#hiddenWordE").val(), no, 1);
    }

}

function wrongVoice() {
    var audioElement = document.createElement('audio');
    audioElement.setAttribute('src', './mp3/wrong.mp3');
    audioElement.setAttribute('autoplay', 'autoplay');
}

function checkWord(){

    // 入力内容取得
    var inputword = "";
    $(".inputword").each(function(index, element) {
        inputword = inputword + $(element).val();
    });

    // OKと判定
    if(inputword.trim() == $('#hiddenWordE').val().trim()){

        var time = $('#hiddenWordWrongTime').val();
        if(time == null || time == ""){
            time = 0;
        }
        $('#hiddenWordWrongTime').val(time);

        rightVoice("word");
        overWord("OK");
        showSen1();

    // NGと判定
    }else{

        wrongVoice();

        $('#wordWrongTimeDiv').show();
        
        var time = $('#hiddenWordWrongTime').val();
        if(time == null || time == ""){
            time = 0;
        }
        time = parseInt(time) + 1;
        $('#hiddenWordWrongTime').val(time);
        $('#wordWrongTimeDiv').children().eq(0).html("誤り回数：" + time + "回");

        if(parseInt(time) >= 3){

            // 3回誤りの場合
            overWord("NG");

            showSen1();
        }else{
            return;
        }
        
    }
}

function checkSen1(){

    console.log("checksen1");

    var inputsent1 = $("#inputsentence1").val();

    // OK
    if(inputsent1.trim() == $('#hiddenSen1E').val().trim()){

        var time = $('#hiddenSen1WrongTime').val();
        if(time == null || time == ""){
            time = 0;
        }

        $('#hiddenSen1WrongTime').val(time);

        rightVoice("sen1");
        overSen1("OK");
        showSen2();

    // NG
    }else{

        wrongVoice();

        $('#sen1WrongTimeDiv').show();
        
        var time = $('#hiddenSen1WrongTime').val();
        if(time == null || time == ""){
            time = 0;
        }

        time = parseInt(time) + 1;

        $('#hiddenSen1WrongTime').val(time);
        $('#sen1WrongTimeDiv').children().eq(0).html("誤り回数：" + time + "回");

        if(parseInt(time) >= 3){

            // 3回誤りの場合
            overSen1("NG");

            showSen2();

            return;
        }else{

            return;
        }
    
        
    }
}

function checkSen2(){

    console.log("checksen2");

    var inputsent2 = $("#inputsentence2").val();

    // OK
    if(inputsent2.trim() == $('#hiddenSen2E').val().trim()){

        var time = $('#hiddenSen2WrongTime').val();
        if(time == null || time == ""){
            time = 0;
        }

        $('#hiddenSen2WrongTime').val(time);

        rightVoice("sen2");
        overSen2("OK");

        setTimeout(function(){
            $("#btnnext").focus();
        }, 100);

    // NG
    }else{

        wrongVoice();

        $('#sen2WrongTimeDiv').show();
        
        var time = $('#hiddenSen2WrongTime').val();
        if(time == null || time == ""){
            time = 0;
        }
        time = parseInt(time) + 1;

        $('#hiddenSen2WrongTime').val(time);
        $('#sen2WrongTimeDiv').children().eq(0).html("誤り回数：" + time + "回");

        if(parseInt(time) >= 3){

            // 3回誤りの場合
            overSen2("NG");

            setTimeout(function(){
                $("#btnnext").focus();
            }, 100);

            return;
        }else{


            return;
        }

        
    }
}

function rightVoice(flg) {

    var audioElement = document.createElement('audio');

    if(flg == "word"){
        if($('#hiddenSen1J').val() != "" || $('#hiddenSen2J').val() != ""){
            audioElement.setAttribute('src', './mp3/right1.mp3');
        }else{
            audioElement.setAttribute('src', './mp3/right2.mp3');
        }
    }else if(flg == "sen1"){
        if($('#hiddenSen2J').val() != ""){
            audioElement.setAttribute('src', './mp3/right1.mp3');
        }else{

            if($('#hiddenWordWrongTime').val() > 0){
                audioElement.setAttribute('src', './mp3/right1.mp3');
            }else{
                audioElement.setAttribute('src', './mp3/right2.mp3');
            }
            
        }
    }else if(flg == "sen2"){
        if($('#hiddenWordWrongTime').val() > 0 || $('#hiddenSen1WrongTime').val() > 0){
            audioElement.setAttribute('src', './mp3/right1.mp3');
        }else{
            audioElement.setAttribute('src', './mp3/right2.mp3');
        }
    }
    
    audioElement.setAttribute('autoplay', 'autoplay');
}

function overWord(flg){

    // 単語
    $('#wordEDiv').hide();
    $('.worddiv').eq(0).parent().css('display', 'flex');
    $('.worddiv').eq(0).html($('#hiddenWordE').val());
    if(flg == "OK"){
        $('.worddiv').eq(0).css('color', 'blue');
    }else{
        $('.worddiv').eq(0).css('color', 'red');

        var inputword = "";
        $(".inputword").each(function(index, element) {
            inputword = inputword + $(element).val();
        });
        if(inputword.trim() != ""){
            $('.wrongworddiv').eq(0).html(inputword.trim());
            $('.wrongworddiv').eq(0).parent().css('display', 'flex');

            $('.worddiv').eq(0).css('color', 'blue');
        }
        
    }
}

function overSen1(flg){

    // 単語
    $('#sen1EDiv').hide();
    $('.sen1div').eq(0).parent().css('display', 'flex');
    $('.sen1div').eq(0).html($('#hiddenSen1E').val());
    if(flg == "OK"){
        $('.sen1div').eq(0).css('color', 'blue');
    }else{
        $('.sen1div').eq(0).css('color', 'red');

        if($('#inputsentence1').val() != ""){
            $('.wrongsen1div').eq(0).html($('#inputsentence1').val());
            $('.wrongsen1div').eq(0).parent().css('display', 'flex');

            $('.sen1div').eq(0).css('color', 'blue');
        }
    }

}

function overSen2(flg){

    // 単語
    $('#sen2EDiv').hide();
    $('.sen2div').eq(0).parent().css('display', 'flex');
    $('.sen2div').eq(0).html($('#hiddenSen2E').val());
    if(flg == "OK"){
        $('.sen2div').eq(0).css('color', 'blue');
    }else{
        $('.sen2div').eq(0).css('color', 'red');
        if($('#inputsentence2').val() != ""){
            $('.wrongsen2div').eq(0).html($('#inputsentence2').val());
            $('.wrongsen2div').eq(0).parent().css('display', 'flex');

            $('.sen2div').eq(0).css('color', 'blue');
        }
    }

}

function pronounceA(content, no) {

    let word = content;
    let u = new SpeechSynthesisUtterance();
    u.lang = 'en-US';
    u.text = word;
    speechSynthesis.speak(u);

}

function pronounceB(content , no, type) {

    // 音声ファイルの存在チェック
    var currentURL = window.location.href;

    var currentURL = currentURL.substring(0, currentURL.lastIndexOf("/"));
    console.log(currentURL);

    var pathUrl = "/mp3/" + $("#hiddenBook").val() + "/" + $("#hiddenclassification").val() + "/";

    var fileName = "";
    if(no == 1){
        fileName = $("#hiddenwordseq").val() + "-word-" + type + ".mp3"; 
    }else if(no == 2){
        fileName = $("#hiddenwordseq").val() + "-sen1-" + type + ".mp3"; 
    }else if(no == 3){
        fileName = $("#hiddenwordseq").val() + "-sen2-" + type + ".mp3"; 
    }

    if (checkFileExists(currentURL + pathUrl + fileName)) {

        console.log('File exists.');
        var audioElement = document.createElement('audio');
        audioElement.setAttribute('src', '.' + pathUrl + fileName);
        audioElement.setAttribute('autoplay', 'autoplay');
        
    } else {

        console.log('File does not exist.');
        Efw('study_testword_downloadvoice',{type : type});
        setTimeout(function(){
            pronounceB(content , no, type);
        }, 6000);

    }

}

function checkFileExists(url) {
    var xhr = new XMLHttpRequest();
    xhr.open('HEAD', url, false);
    xhr.send();
    return xhr.status === 200;
}