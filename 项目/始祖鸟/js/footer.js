$(function(){
    //����ҳ��.footerƬ��
    $.ajax({
       url:"footer.html",
       type:"get",
       success:function(result){
           //���ص���һ��htmlƬ��
           //console.log(result);
           //��Ƭ�δ����µ�<footer>Ԫ��
           $(result).replaceAll("#footer");
           //���Զ����footer.css��ҳ��
           $(`<link rel="stylesheet" href="../css/footer.css"/>`).appendTo("head");
       }
    })
})