const tag_id='example_CCC';
const defaulturl = "https://fd-clinicconnect.net/api";
var redirecturl = "https://fastdoctor.jp/";
var isPC = true;      
const popupWangDiv = "<div  id='popupWangModal' style='background-color:white;  height:10vw ;  width: 46vw;  margin: 20px auto;  display: block; position:fixed; z-index:9999; top:calc(100vh - 14vw); left:50vw; '>" + 
    "<div id='popupWangClose' style='position: relative; display: block;'>"+
      "<div  style='color: black; line-height: 1;border-radius: 100%; padding: 5px;  position: absolute; top: -30px;right: -5px;'><?xml version='1.0' ?><!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'><svg enable-background='new 0 0 48 48' height='24px' id='Layer_1' version='1.1' viewBox='0 0 48 48' width='24px' xml:space='preserve' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'><g id='Layer_3'><g><path d='M24,0C10.745,0,0,10.745,0,24s10.745,24,24,24s24-10.745,24-24S37.255,0,24,0z M24,44    C12.954,44,4,35.046,4,24S12.954,4,24,4s20,8.954,20,20S35.046,44,24,44z' fill='#241F20'/><polygon fill='#241F20' points='33.878,12.003 24,21.88 14.123,12.003 12.003,14.125 21.879,24.001 12.003,33.877 14.126,35.997     24,26.123 33.875,35.997 35.997,33.877 26.122,24.001 35.997,14.125   '/></g></g></svg></div>"+
    "</div><a id='wangAtag' href='javascript:redirect(1);'><img src='https://fd-clinicconnect.net/tag/popup_wang.png' width='100%' height='100%' /></a></div>"; 
const popupOnlineDiv = "<div  id='popupOnlineModal' style='background-color:white;  height:10vw ;  width: 46vw;  margin: 20px auto;  display: block; position:fixed; z-index:9999; top:calc(100vh - 14vw); left:50vw; '>" + 
    "<div id='popupOnlineClose' style='position: relative; display: block;'>"+
      "<div  style='color: black; line-height: 1;border-radius: 100%; padding: 5px;  position: absolute; top: -30px;right: -5px;'><?xml version='1.0' ?><!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'><svg enable-background='new 0 0 48 48' height='24px' id='Layer_1' version='1.1' viewBox='0 0 48 48' width='24px' xml:space='preserve' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'><g id='Layer_3'><g><path d='M24,0C10.745,0,0,10.745,0,24s10.745,24,24,24s24-10.745,24-24S37.255,0,24,0z M24,44    C12.954,44,4,35.046,4,24S12.954,4,24,4s20,8.954,20,20S35.046,44,24,44z' fill='#241F20'/><polygon fill='#241F20' points='33.878,12.003 24,21.88 14.123,12.003 12.003,14.125 21.879,24.001 12.003,33.877 14.126,35.997     24,26.123 33.875,35.997 35.997,33.877 26.122,24.001 35.997,14.125   '/></g></g></svg></div>"+
    "</div><a id='onlineAtag' href='javascript:redirect(2);'><img src='https://fd-clinicconnect.net/tag/popup_online.png' width='100%' height='100%' /></a></div>"; 

var popupWangModal;
var popupOnlineModal;
var closeWangBtn;
var closeOnlineBtn;
var click_type;
var wangAtag;
var onlineAtag;
var url = "";

function designChange() {
    popupWangModal.style.removeProperty('height');
    popupWangModal.style.removeProperty('top');
    popupWangModal.style.removeProperty('left');
    popupWangModal.style.removeProperty('margin');
    popupWangModal.style.bottom = "0";
    popupWangModal.style.width = "100%";
    closeWangBtn.style.visibility = "collapse";

    popupOnlineModal.style.removeProperty('height');
    popupOnlineModal.style.removeProperty('top');
    popupOnlineModal.style.removeProperty('left');
    popupOnlineModal.style.removeProperty('margin');
    popupOnlineModal.style.bottom = "0";
    popupOnlineModal.style.width = "100%";
    closeOnlineBtn.style.visibility = "collapse";
}

window.onload = function() {
    console.log("start");    
    document.body.innerHTML += popupWangDiv;
    document.body.innerHTML += popupOnlineDiv;
    popupWangModal = document.getElementById("popupWangModal");
    popupOnlineModal = document.getElementById("popupOnlineModal");
    closeWangBtn = document.getElementById("popupWangClose");
    closeOnlineBtn = document.getElementById("popupOnlineClose");
    wangTag = document.getElementById("wangAtag");  
    onlineTag = document.getElementById("onlineAtag"); 

    if (screen.width >= 768) {
        isPC = true;
        click_type = 1;
        url = new URL(defaulturl + "/validPopup?tag_id=" + tag_id + "&click_type=1"); 
    }
    else {        
        isPC = false;
        click_type = 2;
        url = new URL(defaulturl + "/validPopup?tag_id=" + tag_id + "&click_type=3"); 
        designChange();
    } 
    
    closeWangBtn.addEventListener("click", closePopup);
    closeOnlineBtn.addEventListener("click", closePopup);
    closePopup();

    //popup displayed?  when loading page at first
    const apiResult = fetch(url, {headers: {mode:'no-cors',
        'Content-Type': 'application/json',
    }})
    .then( response => response.json() )
    .then( data => {
        if (data != '0') {
            showPopup(data);
        } else {
            closePopup();
        }
    } )        
};

function closePopup() {console.log("closePOPup");
    popupWangModal.style.visibility = "collapse";
    popupOnlineModal.style.visibility = "collapse";
};   
function showPopup(type) {
    if (type == '1') {
        popupWangModal.style.visibility = "visible";
    } else {console.log("online__");
        popupOnlineModal.style.visibility = "visible";
    }
}; 
// function clicked(tag_id, click_type) {    
//     return apiResult;
// }  

function redirect(type) {
    // event.stopPropagation();
    console.log("click_type, type", click_type, type);
    var url = new URL(defaulturl + "/popupClicked?tag_id="+tag_id + "&click_type=" + 2*click_type + "&type=" + type);
    const apiResult = fetch(url, {headers: {mode:'no-cors',
        'Content-Type': 'application/json',
    }})
    .then( response => response.json() )
    .then( data => {
        redirecturl = data['url']; console.log("redirectUrl", redirecturl);
        if (redirecturl != '') {
            window.open(
                redirecturl,
                '_blank' // <- This is what makes it open in a new window.
            );             
        }            
    } )     
}  