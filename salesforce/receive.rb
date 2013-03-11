require 'mail'

Mail.defaults do
	 retriever_method :pop3, :address    => "pop.gmail.com",
                          :port       => 995,
                          :user_name  => 'bpms-build@intalio.com',
                          :password   => 'password',
                          :enable_ssl => true
end
begin
    Mail.all.each do |emails|
      msg = emails.text_part.to_s
     
      if msg.include?'https://ssl.salesforce.com'
          url = msg.scan(/https:\/\/ssl.salesforce.com\/.+/)
	  puts url
	  uri = url.join
	  if uri.include? 'ssl.salesforce.com'
	    index = uri.index('ssl.salesforce.com')+'ssl.salesforce.com'.length
	    param = uri.slice(index+1, uri.length).split(" ")[0]
	    puts param
	  end  
      end
    end  
   
rescue Exception => ex
    puts ex
end  

