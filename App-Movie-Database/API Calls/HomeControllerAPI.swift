//
//  HomeControllerAPI.swift
//  App-Movie-Database
//
//  Created by Immanuel Matthews-Feemster on 2/9/24.
//

import Foundation

class APIClient {
    var movieResults: [Movie] = []
    let headers = [
      "accept": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZjQ0NTM3N2UxZGJiZTkyYzliZDI5NjA1YjRjNTNlOSIsInN1YiI6IjY1OTgwNzhhZDdhNzBhMTFjNzZhZmQwMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iITTrM0u6cCX54mwUrNZa0pLgz3wvLHcsaKoS6oeVQw"
    ]
    
    let url = URL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc")!
    
    func fetchMovies() {
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Handle the response data here
            if let data = data {
                // Process the data (e.g., parse JSON)
                print("Received data: \(data)")
            }
            
            if let jsonData = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedMovies = try decoder.decode(MovieResponse.self, from: jsonData)
                    self.movieResults = decodedMovies.results
                    print("Decoded User: \(decodedMovies.results)")
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        dataTask.resume()
        
        
    }
    
    
}
