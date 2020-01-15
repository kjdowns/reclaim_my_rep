class RepAPI
    include HTTParty
    base_uri 'https://www.googleapis.com/civicinfo/v2'
    default_params key: 'AIzaSyCxrHElxAU40UUELB9rq8ByCi4Ldo3tG_k'

    def self.get_reps(path, query)
        results = get(path, query: query)
        officials = results["officials"]
    end
end