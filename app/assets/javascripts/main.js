$(document).ready(function(){

	$(document).on("keypress", '.item_search_input', function(){
	  $('.item_search').click();
	});

	$(document).on("change", '.item_category_search_input', function(){
	  $('.item_search').click();
	});

	$(document).on("keypress", '.customer_search_input', function(){
	  $('.customer_search').click();
	});

	$(document).on("keypress", '.funcionario_search_input', function(){
	  $('.funcionario_search').click();
	});

	$(document).on("change", "#sale_comments_comments", function(){
		$('.sale_comments').click();
	});


	$(document).on("change", "#line_item_price", function(){
		$.ajax({
      type: "POST",
      url: '/sales/override_price', //sumbits it to the given url of the form
      data: {override_price: { price: $(this).val(), line_item_sku: $(this).parent().parent().find('.line_item_sku').val(), sale_id: $(document).find('.sale_id').html() }},
      dataType: "script",
      success: function() {
      	console.log('price updated');
      }
    });
  	// alert('price');
	});

	$(document).on("change", "#sale_discount", function(){
		$.ajax({
      type: "POST",
      url: '/sales/sale_discount', //sumbits it to the given url of the form
      data: {sale_discount: { discount: $(this).val(), sale_id: $(document).find('.sale_id').html() }},
      dataType: "script",
      success: function() {
      	console.log('sale discounted');
      }
    });
  	// alert('price');
	});


	// Jquery form validations
	$(".form_custom_item").validate({
		rules: {	
			"custom_item[name]": {required: true },
			"custom_item[price]": {required: true, number: true},
			"custom_item[stock_amount]": {required: true, number: true}
		}
	});

	$(".edit_sale").validate({
		rules: {
			"line_item[price]": {required: true, number: true }
		}
	});

	$("#new_item").validate({
		rules: {
			"item[sku]": {required: true },
			"item[name]": {required: true, maxlength: 100 },
			"item[price]": {required: true, number: true, min: 0.01 },
			"item[stock_amount]": {required: true, number: true, min: 1 },
			"item[cost_price]": {required: true, number: true, min: 0.01 }
		}
	});

	$("#new_item_category").validate({
		rules: {
			
			"item_category[name]": {required: true, maxlength: 20 },
			"item_category[description]": {maxlength: 100}
		}
	});

	$("#new_user").validate({
		rules: {
			"user[email]": {required: true, email: true },
			"user[username]": {required: true },
			"user[password]": {required: true }
		}
	});

	$("#new_customer").validate({
		rules: {
			"customer[nome]": {required: true, maxlength: 20 },
			"customer[sobrenome]": {required: true, maxlength: 50 },
			"customer[address]": {maxlength: 50},
			"customer[city]": {maxlength: 20},
			"customer[email_address]": {email: true }
		}
	});

	$("#new_fornecedor").validate({
		rules: {
			"fornecedor[empresa]": {required: true, maxlength: 50 },
			"fornecedor[email]": {email: true },
			"fornecedor[endereco]": {maxlength: 50 },
			"fornecedor[cidade]": {maxlength: 20 }
		}
	});

	$("#new_funcionario").validate({
		rules: {
			"funcionario[nome]": {required: true, maxlength: 50 },
			"funcionario[data_nascimento]": {required: true, date: true },
			"funcionario[endereco]": {required: true, maxlength: 50 },
			"funcionario[cidade]": {required: true, maxlength: 20 },
			"funcionario[estado]": {required: true },
			"funcionario[cep]": {required: true },
			"funcionario[telefone]": {required: true },
			"funcionario[admissao]": {required: true, date: true },
			"funcionario[cargo]": {required: true },
			"funcionario[cpf]": {required: true },
			"funcionario[identidade]": {required: true }
		}
	});


	$("#create_custom_customer").validate({
		rules: {
			"custom_customer[first_name]": {required: true },
			"custom_customer[last_name]": {required: true },
			"custom_customer[email_address]": {email: true }
		}
	});

});
