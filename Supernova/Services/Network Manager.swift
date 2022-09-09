import Foundation

class NetworkManager {
        
    func getNews(completion: @escaping ([SpaceflightElement]?, Error?) -> Void) {
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/blogs") else {return}
        let session = URLSession.shared
        let task = session .dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([SpaceflightElement].self, from: data)
                completion(result, nil)
            } catch {
                print("Erro ao decodar")
            }
        }
        task.resume()
    }
    
}
