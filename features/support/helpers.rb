def post_empregados(endpoint, empregados)
    result = HTTParty.post(
        endpoint,
        headers: {'Content-Type' => 'application/json'},
        body: {
            "name": empregados['name'],
            "salary": empregados['salary'],
            "age": empregados['age']
        }.to_json
    )
end