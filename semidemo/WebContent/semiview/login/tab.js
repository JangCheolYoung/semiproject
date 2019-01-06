	var tab_btn = new Array();

		var tab_disp = new Array();
		var startTab = 1;
		var endTab = 2;
		window.onload = function(){
		init();
		}
		function init(){
		 for(i=startTab;i<=endTab;i++){
		 tab_btn[i] = document.getElementById("tab_btn"+i);
		 tab_disp[i] = document.getElementById("tab_disp"+i);
		}
		tabSwitch(1);
		}
		function tabSwitch(tabNum){
		for(i=startTab;i<=endTab;i++){
		  if(i == tabNum){
		  tab_btn[i].style.background = "#ffd9e0";
		  tab_disp[i].style.display = "block";
		  }else{
		 tab_btn[i].style.background = "#e7e7e7";
		   tab_disp[i].style.display = "none";
		 }
		 }
		}