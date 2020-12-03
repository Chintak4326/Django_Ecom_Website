
$(document).ready(function(){
	
	$('input[type=checkbox],input[type=radio],input[type=file]').uniform();
	
	$('select').select2();
	
	// Form Validation
    $("#basic_validate").validate({
		rules:{
			required:{
				required:true
			},
			email:{
				required:true,
				email: true
			},
			date:{
				required:true,
				date: true
			},
			url:{
				required:true,
				url: true
			}
		},
		errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
	});
	
	$("#number_validate").validate({
		rules:{
			min:{
				required: true,
				min:10
			},
			max:{
				required:true,
				max:24
			},
			number:{
				required:true,
				number:true
			}
		},
		errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
	});
	
	$("#password_validate").validate({
		rules:{
			pwd:{
				required: true,
				minlength:6,
				maxlength:20
			},
			pwd2:{
				required:true,
				minlength:6,
				maxlength:20,
				equalTo:"#pwd"
			}
		},
		errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
	});
});

// Add Category Validation
$("#add_categories").validate({
	rules:{
		name:{required:true},
		url:{required:true}
	},
	errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
});

var x=1;
function addattr()
{
  var maxField = 5; //Input fields increment limitation
  var addButton = $('.add_button'); //Add button selector
  var wrapper = $('.field_wrapper'); //Input field wrapper
  var fieldHTML = '<div><label class="control-label"></label><input type="text" name="ram" id="ram" placeholder="RAM" style="width:120px; margin-right:3px; margin-top:10px;margin-left:20px;margin-bottom:10px;"><input type="text" name="rom" id="storage" placeholder="Storage" style="width:120px;margin-right:3px; margin-top:3px;"><input type="text" name="color" id="color" placeholder="Color" style="width:120px;margin-right:3px;margin-top:3px;"><input type="text" name="price" id="price" placeholder="Price" style="width:120px; margin-right:3px; margin-top:3px;" onkeypress="return event.charCode>=48 && event.charCode<=57;"><input type="text" name="stock" id="stock" placeholder="Stock" style="width:120px; margin-right:3px; margin-top:3px;" onkeypress="return event.charCode>=48 && event.charCode<=57;"><a href="javascript:void(0);" class="remove_button">Remove</a></div>'; //New input field html 
   //Initial field counter is 1
  if(x < maxField){ 
      x++; //Increment field counter
      $(wrapper).append(fieldHTML); //Add field html
    }
  
  //Once remove button is clicked
  $(wrapper).on('click', '.remove_button', function(e){
    e.preventDefault();
    $(this).parent('div').remove(); //Remove field html
    x--; //Decrement field counter
  });
}