module UserdetailsHelper

	def checked(area)
		@userdetail.interests.nil? ? false : @userdetail.interests.match(area)
	end
end
