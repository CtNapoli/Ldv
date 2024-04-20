Sitemap::Generator.instance.load host: "ldvhomes.com" do
    path :root, priority: 1
    path :about, :priority => 0.8
    path :owners, :priority => 0.8
    # Aggiungi le risorse da includere nella sitemap
    Apartment.find_each do |apartment|
        add apartment_path(apartment), priority: 0.6, lastmod: apartment.updated_at
    end
    
end

SitemapGenerator::Sitemap.ping_search_engines