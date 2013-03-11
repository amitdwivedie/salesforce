require 'databasedotcom'
require 'mail'
client = Databasedotcom::Client.new :client_id => "3MVG9WQsPp5nH_ErUDhSrf92kGyKu3SRdcOVqIVEn0c2h.vsTxJueRdXpdTVxpHO27GPnowkGyBGp9cK53MIO", 						    :client_secret => "624866986872091882"
client.client_id      #=> sponge
client.client_secret  #=> bob
client.authenticate :token =>"00D00000000hbrp!AQYAQM_7r2Mm97mx4G9tCDQB6uYDci3osLFdeEyw._uy2o8DbIC02.j8AD7AB5W0cBItM1rFCnPX9e_6G4OQdsIjntIqyUEo", 		    :instance_url => "http://na0-api.salesforce.com"  #=> "my-oauth-token"

client.materialize("Contract")
client.materialize("Account")
client.materialize("Contact")

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
	    contract= Contract.find(param.to_s)
	    account= Account.find(contract.AccountId.to_s)
	    contact= Contact.find(contract.CustomerSignedId.to_s)
	    puts "====================================================\n"
	    puts 'Contract Number > '+contract.ContractNumber.to_s
	    puts 'End Date > '+contract.EndDate.to_s
	    puts 'Contract Id > '+contract.Id.to_s
	    puts 'Account Id > '+contract.AccountId.to_s
	    puts 'Account > '+account.Name.to_s
	    puts 'Contact Name > '+ contact.Name.to_s
	    puts 'Contact Email > '+ contact.Email.to_s
	    puts 'Contact Mobile > '+ contact.MobilePhone.to_s
	    puts 'Contact Phone > ' + contact.Phone.to_s
	    puts "====================================================\n"
	    
	  end  
      end
    end  
   
rescue Exception => ex
    puts ex
end  