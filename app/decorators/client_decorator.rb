class ClientDecorator < SimpleDelegator
	def have_profile(client)
		return 'clients/partial2' if client.nil? || client.profile.nil? 
		'clients/partial1'
	end
end