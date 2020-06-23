# -------------------------------Inclusão-------------------------------
Dado('que eu tenho os seguintes dados:') do |table|
    @empregados = table.rows_hash
end
  
Quando('eu faço uma requisição para o serviço de criação de empregados') do
    endpoint = "#{CONFIG['apis']['base_url']}/create"
    @result = post_empregados(endpoint, @empregados)
end

Então('o código de resposta HTTP deve ser igual a {string}') do |status_code|
    expect(@result.response.code).to eql status_code
end

Então("devo visualizar uma mensagem de {string}") do |message|
    expect(@result['status']).to eql message
end

Então('o empregado deve ser criado corretamente') do
    expect(@result['data']['name']).to eql (@empregados['name'])
    expect(@result['data']['salary']).to eql (@empregados['salary'])
    expect(@result['data']['age']).to eql (@empregados['age'])
    expect(@result['data']['id']).not_to be nil
    puts @result
end

# -------------------------------Exclusão-------------------------------

Dado("que eu tenha empregados cadastrados") do
    @empregados = {"name"=>Faker::Name.first_name, "salary"=>"3000", "age"=>"30"}
    endpoint = "#{CONFIG['apis']['base_url']}/create"
    @empregado_criado = post_empregados(endpoint, @empregados)
    expect(@empregado_criado.response.code).to eql "200"
    puts "Empregado criado: #{@empregado_criado}"
end
  
Quando("eu faço uma requisição para o serviço de exclusão de empregados") do
    endpoint = "#{CONFIG['apis']['base_url']}/delete/#{@empregado_criado['data']['id']}"
    @result = HTTParty.delete(endpoint, headers: {'Content-Type' => 'application/json'})
    puts "Requisição para excluir: #{endpoint}"
    puts "Resposta da API: #{@result}"
end