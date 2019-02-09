# frozen_string_literal: true

namespace :user do
  desc 'Cadastro de novo usuário'
  task create: :environment do
    User.destroy_all
    puts "\nCadastrando usuário..."
    User.create!(email: 'example@inovamind.com',
                 password: '111111',
                 password_confirmation: '111111')
    puts "\nSucesso ao cadastrar usuário"
    puts "\nAutentique-se no sistema utilizando"
    puts 'email: example@inovamind.com'
    puts "senha: 111111 \n\n"
  rescue StandardError => e
    puts "\nERRO"
    puts 'Não foi possível cadastrar usuário'
    puts "\nMOTIVO #{e.message}"
  end
end
