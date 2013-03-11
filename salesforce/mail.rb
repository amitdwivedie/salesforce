require 'mail'
begin
	options = {             :address              => "smtp.gmail.com",
				:port                 => 587,
				:domain               => 'gmail.com',
				:user_name            => 'bpms-build@intalio.com',
				:password             => 'password',
				:authentication       => 'plain',
				:enable_starttls_auto => true  }


    
	Mail.defaults do
		delivery_method :smtp, options
		
	end
rescue Exception => ex
	puts ex
		
end
begin
	mail = Mail.deliver do
			to 'dwivedi@intalio.com'
			from 'bpms-build@intalio.com'
			subject 'testing sendmail'
			body 'testing sendmail'
		
		
	end
	
rescue Exception => ex
    puts ex

end