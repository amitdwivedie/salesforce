require 'databasedotcom'
client = Databasedotcom::Client.new :client_id => "3MVG9WQsPp5nH_ErUDhSrf92kGyKu3SRdcOVqIVEn0c2h.vsTxJueRdXpdTVxpHO27GPnowkGyBGp9cK53MIO", :client_secret => "624866986872091882"
client.client_id      #=> sponge
client.client_secret  #=> bob
client.authenticate :token => "00D00000000hbrp!AQYAQHW.27Y.ligXJfmrInl6HNC3wVKJqGDVxW2KqkPj06hlStTl.972lqAgA2vNTNPzQuEWmdTdqQ_pfK8EfF7fJZ2RA.B0" , :instance_url => "http://na0-api.salesforce.com"  #=> "my-oauth-token"
#client.list_sobjects
# puts client.list_sobjects.sort.join "\n"  
client.materialize("Contract")
puts "=====================\n"
#puts Contract.methods.sort.join "\n"
contracts= Contract.find_all_by_Status("Activated")           
contracts.each { |x| puts  x.Service_Level__c.to_s + " , " + x.ExpirationServerEE__c.to_s + " , " + x.EndDate.to_s + " , " + x.OwnerId.to_s + " , " + x.ContractNumber.to_s }
  
