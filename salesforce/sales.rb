require 'databasedotcom'
client = Databasedotcom::Client.new :client_id => "3MVG9WQsPp5nH_ErUDhSrf92kGyKu3SRdcOVqIVEn0c2h.vsTxJueRdXpdTVxpHO27GPnowkGyBGp9cK53MIO", :client_secret => "624866986872091882"
client.client_id      #=> sponge
client.client_secret  #=> bob
client.authenticate :token => "00D00000000hbrp!AQYAQHW.27Y.ligXJfmrInl6HNC3wVKJqGDVxW2KqkPj06hlStTl.972lqAgA2vNTNPzQuEWmdTdqQ_pfK8EfF7fJZ2RA.B0" , :instance_url => "http://na0-api.salesforce.com"  #=> "my-oauth-token"
#puts client.list_sobjects
# puts client.list_sobjects.sort.join "\n"  
client.materialize("Contract")
client.materialize("Account")
client.materialize("Contact")
puts "====================================================\n"
#puts Contract.methods.sort.join "\n"
contract= Contract.find("800000000003pfk") 
account= Account.find(contract.AccountId.to_s)
contact= Contact.find(contract.CustomerSignedId.to_s)
puts 'Contract Number > '+contract.ContractNumber.to_s
puts 'End Date > '+contract.EndDate.to_s
puts 'Contract Id > '+contract.Id.to_s
puts 'Account Id > '+contract.AccountId.to_s
puts 'Account > '+account.Name.to_s
puts 'Number of Employees > '+ account.NumberOfEmployees.to_s
puts 'Phone > '+account.Phone.to_s
#puts contract.OwnerId.to_s
puts 'Contact Name > '+ contact.Name.to_s
puts 'Contact Email > '+ contact.Email.to_s
puts 'Contact Mobile > '+ contact.MobilePhone.to_s
puts 'Contact Phone > ' + contact.Phone.to_s
puts "====================================================\n"

#users= Contact.all           
#users.each { |x| puts  x.Phone.to_s }
  
