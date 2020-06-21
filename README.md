## Projeto exemplo de API

O objetivo do projeto é automatizar API REST.

**O projeto possui as seguintes Gems:**

- Cucumber (permite a escrita de testes em uma linguagem muito próxima da natural)
- Faker (usado para gerar dados falsos: nomes, endereços, números de telefone etc)
- Httparty (facilita o consumo de serviços rest)
- Rspec (framework BDD para ruby)


### Pré requisitos:

- Gerenciador de versões do Ruby;
- Ruby;
- Bundler.

**Dicas:**

- [Rbenv] - O Rbenv fornece suporte para trabalhar com versões do Ruby
	Comandos para instalação:
	- git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	- echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	- echo 'eval "$(rbenv init -)"' >> ~/.bashrc
	- source ~/.bashrc
	- type rbenv
	- git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

- [Ruby]
	- rbenv install -l
	- rbenv install 2.6.1
	- rbenv global 2.6.1
	Para verificar se deu tudo certo, digite o comando:
	- ruby -v

- [Bundler]
	- gem install bundler


### Executando os testes:

- No terminal, na pasta do projeto, execute o seguinte comando que irá instalar as Gems do projeto:
	- bundle install

- Para rodar todos os testes utilizando o profile de Produção, execute o seguinte comando na pasta do projeto:
	- bundle exec cucumber -p prod

- Para rodar cenários específicos utilize tags:
	- bundle exec cucumber -p prod -t @criar
    - bundle exec cucumber -p prod -t @excluir