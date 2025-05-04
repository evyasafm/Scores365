import Foundation

public final class APIService {
    private let baseURL = URL(string: "http://demo2170822.mockable.io/")!
    
    public init() {}
    
    public func getAssignment() async throws -> AssignmentResponseDTO {
        let url = baseURL.appendingPathComponent("assignment")
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(AssignmentResponseDTO.self, from: data)
    }
} 