var menu=document.getElementsByClassName("menu")[0];
var menuTop=document.getElementsByClassName("menu-top")[0];
var menuMid=document.getElementsByClassName("menu-middle")[0];
var menuBom=document.getElementsByClassName("menu-bottom")[0];
console.log(menu);
menu.onclick=function(){
    menuTop.style.transform="45deg";
}