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
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bxslider
//= require bootstrap-sprockets
//= require chartkick
//= require Chart.bundle
//= require_tree .

$(document).ready(function(){
  $('.bxslider').bxSlider({
    auto: false,           // 自動スライド
    speed: 500,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 3000,          // 自動スライドの待ち時間
    maxSlides: 1,         // 一度に表示させる最大数
	  randomStart: false,    // 最初に表示するスライドをランダムに設定
    autoHover: true,       // ホバー時に自動スライドを停止
    infiniteLoop: false,
    hideControlOnEnd: true
  });
});