Sitemap::Generator.instance.load host: "http:\\ldvhomes.com" do
    path :root, priority: 1
    path :about, :priority => 0.8
    path :owners, :priority => 0.8
    resources :apartments, :priority => 0.8
    
  end