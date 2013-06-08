module CreationsHelper
	def insert_piece(piece)
    	if (piece.format == "img")
			tag("#{piece.format}",
				:src => "/assets/#{piece.url}",
				:alt => "DAYTES #{piece.id}",
				:class => "hidden feature_#{piece.id} inner_feature",
				data: {featureID: piece.id})
		else
			video_tag("/assets/#{piece.url}",
				:size => "600x400",
				:controls => "false",
				:alt => "DAYTES #{piece.id}",
				:class => "hidden feature_#{piece.id} inner_feature",
				data: {featureID: piece.id})
		end
	end
end

=begin
	    	if (piece.format == "img")
    			tag("#{piece.format}", :src => "/assets/#{piece.url}", :alt => "DAYTES #{piece.id}", :class => "hidden feature_#{piece.id} inner_feature", data: {featureID: piece.id})
    		else
				string = video_tag("/assets/#{piece.url}", :size => "600x400", :controls => "false", :alt => "DAYTES #{piece.id}", :class => "hidden feature_#{piece.id} inner_feature", data: {featureID: piece.id})
				string + "</video>"
			end
=end