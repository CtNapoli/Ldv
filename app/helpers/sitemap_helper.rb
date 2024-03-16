module SitemapHelper

  def sitemap_cache_key
    last_apartments_update = Apartment.maximum(:updated_at)&.utc&.to_i
    key = "sitemapV2-#{last_apartments_update}"
    puts "Key is #{key}" if Rails.env.development? # Stampa la chiave solo in ambiente di sviluppo
    key
  end
    
end