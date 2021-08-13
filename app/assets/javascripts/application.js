// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require cocoon
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

/* global $ */

// マイページタブメニュー
$(document).on('turbolinks:load', function() {
  const menuItems = document.querySelectorAll('.menu li a');
  const contents = document.querySelectorAll('.content');
  menuItems.forEach(clickedItem => {
    clickedItem.addEventListener('click', e => {
      e.preventDefault();

      menuItems.forEach(item => {
        item.classList.remove('active');
      });
      clickedItem.classList.add('active');

      contents.forEach(content => {
        content.classList.remove('active');
      });
      document.getElementById(clickedItem.dataset.id).classList.add('active');
    });
  });
});


// missionタイマー機能
function showCountdown() {
   // 現在日時を数値(1970-01-01 00:00:00からのミリ秒)に変換
   var nowDate = new Date();
   var dnumNow = nowDate.getTime();

   // 指定日時を数値(1970-01-01 00:00:00からのミリ秒)に変換
   var inputYear  = document.getElementById("userYear").value;
   var inputMonth = document.getElementById("userMonth").value - 1;
   var inputDate  = document.getElementById("userDate").value;
   var inputHour  = document.getElementById("userHour").value;
   var inputMin   = document.getElementById("userMin").value;
   var inputSec   = document.getElementById("userSec").value;
   var targetDate = new Date(inputYear, inputMonth, inputDate, inputHour, inputMin, inputSec);
   var dnumTarget = targetDate.getTime();

   // 引き算して日数(ミリ秒)の差を計算
   var diff2Dates = dnumTarget - dnumNow;
   if( dnumTarget < dnumNow ) {
      // 期限が過ぎた場合は -1 を掛けて正の値に変換
      diff2Dates *= -1;
   }

   // 差のミリ秒を、日数・時間・分・秒に分割
   var dDays  = diff2Dates / ( 1000 * 60 * 60 * 24 );   // 日数
   diff2Dates = diff2Dates % ( 1000 * 60 * 60 * 24 );
   var dHour  = diff2Dates / ( 1000 * 60 * 60 );   // 時間
   diff2Dates = diff2Dates % ( 1000 * 60 * 60 );
   var dMin   = diff2Dates / ( 1000 * 60 );   // 分
   diff2Dates = diff2Dates % ( 1000 * 60 );
   var dSec   = diff2Dates / 1000;   // 秒

   var msg = Math.floor(dDays) + "日"
            + Math.floor(dHour) + "時間"
            + Math.floor(dMin) + "分"
            + Math.floor(dSec) + "秒";

   // 作成した文字列を表示
   document.getElementById("RealtimeCountdownArea").innerHTML = msg;

}
// 1秒ごとに実行
setInterval('showCountdown()',1000);


// Historyアコーディオンパネル

$(document).on('turbolinks:load', function() {
　$('.title').on('click', function() {//タイトル要素をクリックしたら
    let findElm = $(this).next(".box");//直後のアコーディオンを行うエリアを取得し
    $(findElm).slideToggle();
    if($(this).hasClass('open')){//タイトル要素にクラス名closeがあれば
      $(this).removeClass('open');//クラス名を除去し
    }else{//それ以外は
      $(this).addClass('open');//クラス名closeを付与
    }
  });
});