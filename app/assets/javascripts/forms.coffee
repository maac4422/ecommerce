$(document).on "ajax:beforeSend", "#emails_form", ()->
	$("#email-info").html "Se esta procesando tu petición."
$(document).on "ajax:success", "#emails_form", (ev,data,state,xhr)->
	$(this).slideUp()
	$("#email-info").html "Ya estas en la fila de invitaciones pendientes."
$(document).on "ajax:error", "#emails_form", (ev,data,state,xhr)->
	$("#email-info").html data.responseJSON.email[0]

