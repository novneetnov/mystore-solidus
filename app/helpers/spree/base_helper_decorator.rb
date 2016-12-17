module Spree
	module BaseHelper
		def logo(image_path = Spree::Config[:logo], img_options = {})
			link_to image_tag(image_path, img_options), spree.root_path
		end

		def nav_tree(root_taxon, current_taxon, max_level = 1)
			return '' if max_level < 1 || root_taxon.children.empty?
			taxons = root_taxon.children.map do |taxon|
				content_tag :div, class: "col-md-4 header-navigation-col" do
					link_to(taxon_header(:h4, taxon), seo_url(taxon)) + 
					taxons_tree(taxon, current_taxon, max_level - 1)
				end
			end
			safe_join(taxons, "\n")
		end

		def taxon_header(tag, taxon)
			content_tag tag.to_sym, taxon.name
		end

	end
end
