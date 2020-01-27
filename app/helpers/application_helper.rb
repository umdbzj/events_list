module ApplicationHelper

#returns full title depending upon page information

def full_title(page_title = '')
	base_title = "Events List"
	if page_title.empty?
		base_title
	else
		page_title = page_title + " | " + base_title
	end	
end

end
