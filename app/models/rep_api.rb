class RepAPI
    include HTTParty
    base_uri 'https://www.googleapis.com/civicinfo/v2'
    default_params key: 'AIzaSyCxrHElxAU40UUELB9rq8ByCi4Ldo3tG_k'

    def self.get_reps(path, query)
        results = get(path, query: query)
        officials = results["officials"]
    end

    def self.create_rep_from_api(official, i, current_user)
        rep = Rep.new
        if i == 2 || i == 3
            rep.title = "Senator"
        else
            rep.title = "Congressperson"
        end
        rep.name = official[i]["name"]
        rep.address = official[i]["address"][0].map {|k,v| v}
        rep.address = rep.address.tr('[\"]', '')
        rep.party = official[i]["party"]
        rep.phone = official[i]["phones"][0]
        rep.website = official[i]["urls"][0]
        rep.photo = official[i]["photoUrl"]
        rep.facebook = official[i]["channels"][0]["id"]
        rep.twitter = official[i]["channels"][1]["id"]
        rep.save
        current_user.reps << rep
    end

end