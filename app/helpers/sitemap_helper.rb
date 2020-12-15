module SitemapHelper

    def sitemap_cache_key
      last_apartments_update = Apartment.maximum(:updated_at).try(:utc).try(:to_i)
  
      key = "sitemapV2-#{last_apartments_update}"
      puts "Key is #{key}"
      key
    end
  
end