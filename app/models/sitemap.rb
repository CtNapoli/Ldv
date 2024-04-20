# Sitemap::Generator.instance.load host: "ldvhomes.com" do
#     path :root, priority: 1
#     path :about, :priority => 0.8
#     path :owners, :priority => 0.8
#     resources :apartments, :priority => 0.8, changefreq: 'daily'
    
#   end

SitemapGenerator::Sitemap.default_host = "https://ldvhomes.com"
SitemapGenerator::Sitemap.create do
  # Esempio di risorse da includere nella sitemap
  add root_path, priority: 1.0, changefreq: 'daily'
  add faq_path, priority: 0.8
  add about_path, priority: 0.7

  # Aggiungi le risorse da includere nella sitemap
  Apartment.find_each do |apartment|
    add apartment_path(apartment), priority: 0.6, lastmod: apartment.updated_at
  end
end

# Salva la sitemap nel server
SitemapGenerator::Sitemap.ping_search_engines