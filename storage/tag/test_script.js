    // const defaulturl = "https://160.16.97.194/api";
    // const tag_id =     "hos_bbb";
    // const redirecturl = "https://fastdoctor.jp/";
          
    // const popupDiv = "<div  id='popupModal' style='background-color:white;  height:10vw ;  width: 46vw;  margin: 20px auto;  display: block; position:fixed; z-index:9999; top:calc(100vh - 14vw); left:50vw; '>" + 
    //     "<div id='popupClose' style='position: relative; display: block;'>"+
    //       "<div  style='color: black; line-height: 1;border-radius: 100%; padding: 5px;  position: absolute; top: -30px;right: -5px;'><?xml version='1.0' ?><!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'><svg enable-background='new 0 0 48 48' height='24px' id='Layer_1' version='1.1' viewBox='0 0 48 48' width='24px' xml:space='preserve' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'><g id='Layer_3'><g><path d='M24,0C10.745,0,0,10.745,0,24s10.745,24,24,24s24-10.745,24-24S37.255,0,24,0z M24,44    C12.954,44,4,35.046,4,24S12.954,4,24,4s20,8.954,20,20S35.046,44,24,44z' fill='#241F20'/><polygon fill='#241F20' points='33.878,12.003 24,21.88 14.123,12.003 12.003,14.125 21.879,24.001 12.003,33.877 14.126,35.997     24,26.123 33.875,35.997 35.997,33.877 26.122,24.001 35.997,14.125   '/></g></g></svg></div>"+
    //     "</div><a id='redirectAtag'><img src='https://shinjuku-home-clinic.com/wp-content/uploads/popup_online.png' width='100%' height='100%' /></a></div>"; 
         
    // window.onload = function() {
    //     console.log("start");
    //     alert("SStart");
    //     document.body.innerHTML += popupDiv;
    //     //console.log("PopupDiv Content:", popupDiv);
    //     const popupModal = document.getElementById("popupModal");
    //     const closeBtn = document.getElementById("popupClose");
    //     const redirectAtag = document.getElementById("redirectAtag");  
    //     closeBtn.addEventListener("click", closePopup);
    //     redirectAtag.addEventListener("click", redirect);            

    //     //popup displayed?  when loading page at first
    //     var url = new URL(defaulturl + "/validPopup?tag_id=" + tag_id); 
    //     console.log("bbURL:", url);

    //     const apiResult = fetch(url, {headers: {mode:'no-cors',
    //         'Content-Type': 'application/json',
    //     }})
    //     .then( response => response.json() )
    //     .then( data => {console.log("bb");
    //         if (data == '1') {
    //             clicked(tag_id, 1);
    //             showPopup();
    //         } else {
    //             closePopup();
    //         }
    //     } )        
    // };

    // function closePopup() {
    //     popupModal.style.visibility = "collapse";
    // };   
    // function showPopup() {
    //     popupModal.style.visibility = "visible";
    // }; 
    // async function clicked(tag_id, click_type) {
    //     var url = new URL(defaulturl + "/popupClicked?tag_id="+tag_id + "&click_type=" + click_type);
    //     const apiResult = await fetch(url, {headers: {mode:'no-cors',
    //         'Content-Type': 'application/json',
    //     }})
    //     .then( response => response.json() )
    //     .then( data => {
    //         if (data == '1') {
    //             return 1;
    //         } else {
    //             return 0;
    //         }
    //     } )  
    // }  

    // function redirect(e) {
    //     e.stopPropagation();
    //     console.log("redirect preparing");
    //     const apiCalled = clicked(tag_id, 2);  console.log(apiCalled);
    //     //location.href = redirecturl;      
    // }  
alert("osn");