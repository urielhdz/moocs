// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('ready page:load',function(){
	$(".alert").alert();
	if($('#wy_editor').length){
		var editor = new wysihtml5.Editor("wy_editor", {
  			toolbar:      "wysihtml5-toolbar", 
  			parserRules:  wysihtml5ParserRules,
  			stylesheets:  '../assets/z.css'
		});	
	}
	$('#agregar_amigo').on('click',function(e){
		e.preventDefault();
		$(this).parent().slideUp();
		var cID= $('#friend_id').val();
		var AUTOK = window._token;

		$.ajax({
			type:'POST',
			data:{"friend_id":cID,"authenticity_token":AUTOK},
			dataType: 'JSON',
			url: '/friendships/addFriend',
			success: function(d){
				$('#agregar-amigo').slideUp('slow');
				console.log(d);
			},
			error: function(e){
				console.log(e);
			}
		});
	});
	$('#agregar_curso').on('click',function(e){
		e.preventDefault();
		$(this).parent().slideUp();
		var cID= $('#curso_id').val();
		var sID= $('#student_id').val();
		var AUTOK = window._token;

		$.ajax({
			type:'POST',
			data:{"course_id":cID, "student_id":sID,"authenticity_token":AUTOK},
			dataType: 'JSON',
			url: '/my_courses/addCourse',
			success: function(d){
				console.log(d);
			},
			error: function(e){
				console.log(e);
			}
		});
	});
	$('.display_object').toggleClick(
		function(){
			var object_to_display = $(this).data('object');
			$(''+object_to_display).slideDown();
			$(this).text($(this).text().replace('Mostrar','Ocultar'));
		},function(){
			var object_to_display = $(this).data('object');
			$(''+object_to_display).slideUp();
			$(this).text($(this).text().replace('Ocultar','Mostrar'));
	});
});

$.fn.toggleClick = function(){
    var methods = arguments, // store the passed arguments for future reference
        count = methods.length; // cache the number of methods 

    //use return this to maintain jQuery chainability
    return this.each(function(i, item){
        // for each element you bind to
        var index = 0; // create a local counter for that element
        $(item).click(function(){ // bind a click handler to that element
            return methods[index++ % count].apply(this,arguments); // that when called will apply the 'index'th method to that element
            // the index % count means that we constrain our iterator between 0 and (count-1)
        });
    });
};