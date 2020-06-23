## Projeto de automação de APIs REST

**O projeto possui as seguintes Gems:**

- Cucumber (permite a escrita de testes em uma linguagem muito próxima da natural)
- Faker (usado para gerar dados falsos: nomes, endereços, números de telefone etc)
- Httparty (facilita o consumo de serviços rest)
- Rspec (framework BDD para ruby)

**O projeto possui as seguintes funcionalidades:**
- [x] Cenários outline de testes para criar empregados;
- [x] Cenário de testes para excluir empregados;
- [x] Verificação das mensagens de resposta e status code.
- [x] Possui relatório em formato html, com evidência dos testes (imagens) - Pasta reports
- [x] Configurado para rodar no Jenkins


### Pré requisitos:

- Gerenciador de versões do Ruby;
- Ruby >= 2.6.1;
- Bundler.

**Dicas:**

- [Rbenv] - O Rbenv fornece suporte para trabalhar com versões do Ruby. Comandos linux para instalação:
	- git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	- echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	- echo 'eval "$(rbenv init -)"' >> ~/.bashrc
	- source ~/.bashrc
	- type rbenv
	- git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
- [Ruby] - Comandos linux para instalação:
	- rbenv install -l
	- rbenv install 2.6.1
	- rbenv global 2.6.1
	Para verificar se deu tudo certo, digite o comando:
	- ruby -v
- [Bundler]
	- gem install bundler

*Guia de instalação do Ruby + Devkit + Bundler no Windows:*
	- https://medium.com/qaninja/instalando-ruby-cucumber-e-capybara-no-windows-10-acb1fe833a95


### Executando os testes:

- No terminal, na pasta do projeto, execute o seguinte comando que irá instalar as Gems do projeto:
	- bundle install

- Para rodar todos os testes utilizando o profile de Produção, execute o seguinte comando na pasta do projeto:
	- bundle exec cucumber -p prod

- Para rodar cenários específicos utilize tags:
	- bundle exec cucumber -p prod -t @criar
    - bundle exec cucumber -p prod -t @excluir


### Para rodar os testes no Jenkins:

- Criar um novo Job no Jenkins do tipo Pipeline;
- Nas configurações selecionar "Pipeline script from SCM" e colocar a URL do projeto de testes: https://github.com/bianamello/projeto_api.git

**Inserindo plugin Cucumber reports no Jenkins (O projeto está configurado no Jenkinsfile para gerar o relatório no Jenkins):**
- Clicar em Gerenciar Jenkins/ Gerenciar plugins
- Clicar em Disponíveis e filtrar por "cucumber reports"
- Selecionar e Baixar
- Após baixar, selecionar a opção para reiniciar o Jenkins

**Para rodar os testes no pipeline do Jenkins:**
- Clicar no Job criado e clicar em "Construir agora"

**Para agendar a execução do Job no Jenkins:**
- Nas configurações do Job em "Build Triggers" selecionar "Construir periodicamente"
- Digitar "H 9 * * 1-5" e salvar (configurado para rodar de segunda a sexta às 9h). 