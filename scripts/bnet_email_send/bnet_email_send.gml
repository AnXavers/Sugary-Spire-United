/// @function bnet_email_send(smtpHost, smtpPort, senderEmail, senderPassword, reciEmail, subject, body, fname)
function bnet_email_send(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	/*  @description							Attempt to send an email to a recipent's email.	
											
												Note you must first enable email process on java server by entering 'email' 'start'.
	*/

	/// @param {string} smtpHost				Simple Mail Transfer Protocol Host Id.
	/// @param {string} smtpPort				Simple Mail Transfer Protocol Host port.
	/// @param {string} senderEmail				Sender's email.
	/// @param {string} senderPassword			Sender's password.
	/// @param {string} reciEmail				Recipient's email.
	/// @param {string} subject					Email subject text.
	/// @param {string} body					Email body Html1 message.
	/// @param {string} fname					Previously created file name thats to be sent. Enter "" to send none.

	/// @call-back								email sent

	/// @error-codes							"700"		

#region Examples
	/*
		Some popular smtp info.
			Gmail :		"smtp.gmail.com" 			"465"
			OutLook:	"smtp-mail.outlook.com"		"587"
			Yahoo:		"smtp.mail.yahoo.com"		"465"
		
		Note for Gmail you must enable less secure app: https://myaccount.google.com/lesssecureapps
		
		Send a email using Gmail's smtp.
			bnet_email_send("smtp.gmail.com", "465", "bnetnetworkdemo@gmail.com","bnetdemo12345", "test@gmail.com", "testMessage", "<h1>Hey this a test message.</h1>", "");
		
		Send a email using Outlook's smtp adding an attachment file.
			bnet_email_send("smtp-mail.outlook.com", "587", "bnetnetworkdemo@gmail.com","bnetdemo12345", "test@gmail.com", "testMessage", "<h1>Hey this a test message.</h1>", "test.txt", "");
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		var __bnet_filename	= argument7;
	
		buffer_seek(_bnet_write_buffer,  buffer_seek_start, 0);
	
		buffer_write(_bnet_write_buffer, buffer_u8,		7);
		buffer_write(_bnet_write_buffer, buffer_string, argument0);
		buffer_write(_bnet_write_buffer, buffer_string, argument1);
		buffer_write(_bnet_write_buffer, buffer_string, argument2);
		buffer_write(_bnet_write_buffer, buffer_string, argument3);
		buffer_write(_bnet_write_buffer, buffer_string, argument4);
		buffer_write(_bnet_write_buffer, buffer_string, argument5);
		buffer_write(_bnet_write_buffer, buffer_string, argument6);
		buffer_write(_bnet_write_buffer, buffer_string, __bnet_filename);
	
		if(__bnet_filename != ""){
		
			if(!file_exists(__bnet_filename)){
			
				show_error("File doesnt exists", true);
			
				exit;
			}
		
			var 
			__bnet_file	= file_bin_open(__bnet_filename, 0),
			__bnet_size	= file_bin_size(__bnet_file);
		
			buffer_write(_bnet_write_buffer, buffer_u16, __bnet_size);
		
			repeat(__bnet_size) buffer_write(_bnet_write_buffer, buffer_u8, file_bin_read_byte(__bnet_file));
		
			file_bin_close(__bnet_file);
		}else buffer_write(_bnet_write_buffer, buffer_u16, 0);
	
		_bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
	
		_bnet_logger("EMAIL REQUEST SENT");
	}


}
