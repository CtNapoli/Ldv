Sitemap::Generator.instance.load host: "ldvhomes.com" do
    # path :root, priority: 1
    # path :about, :priority => 0.8
    # path :owners, :priority => 0.8
    # resources :apartments, :priority => 0.8, :change_frequency => "daily"
    
    path :root, priority: 1, loc: "https://ldvhomes.com/"
    path :about, priority: 0.8, loc: "https://ldvhomes.com/about"
    path :owners, priority: 0.8, loc: "https://ldvhomes.com/owners"
    resources :apartments, priority: 0.8
    
end