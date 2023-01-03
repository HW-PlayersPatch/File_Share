base_research = nil 
base_research = {

-- // balance mod not compatible with single player, this space temporarily left blank // GBX_Cole
}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 