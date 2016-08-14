var is_mouse_on_theme_color = false; 
$(document).ready(function(){
	$('.themeBtn').mouseover(function(){
		is_mouse_on_theme_color = true;
		$( "#colors" ).slideDown();
	});
	
	$('.themeBtn').mouseout(function(e){
		is_mouse_on_theme_color = false;
	});
	
	$('.themeDiv').mouseover(function(){
		is_mouse_on_theme_color = true;
	});
	
	$('.themeDiv').mouseout(function(){
		is_mouse_on_theme_color = false;
	});
	
	$("body").mouseover(function(){
		if(!is_mouse_on_theme_color) {
			$( "#colors" ).slideUp();
		}
	});
	
	$('#theme1').click(function(){
		$('#themeDiv').attr("class", 'theme1');
	});
	
	$('#theme2').click(function(){
		$('#themeDiv').attr("class", 'theme2');
		$('.bgImage').attr("src", "/HuddleBoard/images/theme2.png");
		$('.hb').attr("src", "/HuddleBoard/images/theme2_hb.png");
		$('.expColl').attr('src', '/HuddleBoard/images/theme2_collapse.png');
		$('.newAdd').attr('src', '/HuddleBoard/images/theme2_new.png');
	});
	
	$(document).mousemove(function(event){
		var posY = event.pageY;
		var posX = event.pageX;
		var documentWidth = $(this).width();
		
		if(posY>=0 && posY<= 27) {
			var currentScrollValue = $(this).scrollTop();
			$('.pageHeader').css("margin-top",currentScrollValue);
			$('.pageHeader').slideDown('slow');
		} else {
			$('.pageHeader').slideUp('slow');
			
		}
	});
});

function showThemes(obj) {
	$(obj).hide();
	// Set the effect type
    var effect = 'slide';
 
    // Set the options for the effect type chosen
    var options = { direction: 'right' };
 
    // Set the duration (default: 400 milliseconds)
    var duration = 700;
 
    $('.themeContent').toggle(effect, options, duration);
	//$('.themeContent').slideDown('slow');
}

function hideThemes() {
	// Set the effect type
    var effect = 'slide';
 
    // Set the options for the effect type chosen
    var options = { direction: 'right', 
    		complete: function(){
    			$('.themeBtn img').show();
    		}};
 
    // Set the duration (default: 400 milliseconds)
    var duration = 700;
 
    $('.themeContent').toggle(effect, options, duration);
	//$('.themeContent').slideDown('slow');
    
}
