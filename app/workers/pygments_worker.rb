class PygmentsWorker
	include Sidekiq::Worker
	
	def perform(snippet_id)
		snippet = Snippet.find_by_id(snippet_id)
    uri = URI.parse("http://pygments.simplabs.com/")
    req = Net::HTTP.post_form(uri, lang: snippet.language, code: snippet.code)

  	snippet.update_attribute(:highlighted, req.body)
	end
end