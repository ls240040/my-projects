$(function(){
    //请求页头html片段
    $.ajax({
        url:"header.html",
        type:"get",
        success:function(result){
            //返回的是一个html片段
            //console.log(result);
            //用片段创建新的<header>元素，替换现有的<header id="header">元素
            $(result).replaceAll("#header");
            //并自动添加header.css到页面
            $(`<link rel="stylesheet" href="../css/header.css">`).appendTo("head");
        }
    });
})