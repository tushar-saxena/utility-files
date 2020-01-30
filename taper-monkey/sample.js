// ==UserScript==
// @name         New Userscript
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.jeevansathi.com/inbox/*
// @grant        none
// ==/UserScript==
// @require http://code.jquery.com/jquery-3.4.1.min.js

(function() {
    'use strict';
    //$('#ccPaginationNext').attr('id', 'ccPaginationNext1');
$('body').append('<a href="#" id="CP">CUSTOM BUTTON</a>')
$("#CP").css("position", "fixed").css("top", 0).css("left", 0);
//$("#CP").addClass();
    // Your code here...
    //var button = document.createElement("Button");
    //<i class="disp_ib sprite2 pgnxt cursp" id="ccPaginationNext"></i>
    //button.classList.add("disp_ib sprite2 pgnxt cursp");
//button.innerHTML = "CUSTOM BUTTON";
  //  button.id = "ccPaginationNext";
   // $("#CP").addClass("pgnxt");
   // $("#CP").addClass("disp_ib");
   // $("#CP").addClass("sprite2");
    //$("#CP").addClass("cursp");
    //$("#CP").addClass("upasna");
//button.style = "top:50px;right:440px;position:absolute;z-index: 9999"
//document.body.appendChild(button);

    $(document).on('click','#CP',function(){
        console.log("i called");
        $('#ccPaginationNext').trigger('click');
                   });
})();