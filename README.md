# README

## Inss Discount

### Tecnologias utilizadas

* Ruby 3.5
* Rails 7.2
* Nodejs 20
* Bootstrap 5
* Chartjs 4.4
* Postgres 16
* Docker 27.3


### Como executar

Se estiver em um ambiente Unix, basta executar o script:

```sh
./scripts/setup
```
Para construir as imagens docker e levantar o servidor da aplicação.

Se não estiver em um ambiente Unix, será necessário utilizar os comandos do Docker diretamente:

```sh
docker compose up -d

docker compose exec app rails db:prepare
```

Para acessar a aplicação, é só ir para o endereço: [localhost:3000](localhost:3000)

Usuário de acesso:

    email: admin@email.com
    senha: 123123


### Considerações

* Não achei necessário o uso de Sidekiq para esse desafio

* Foi utilizado o plugin do rubocop que vem por padrão nas novas versões do Rails [Rubocop Rails Omakase](https://github.com/rails/rubocop-rails-omakase)
