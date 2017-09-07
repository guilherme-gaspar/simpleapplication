namespace :utils do
  desc "TODO"
  task seed: :environment do
    puts "Gerando os contatos!"
      10.times do |i| 
        Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          kind: Kind.all.sample,
          rmk: LeroleroGenerator.sentence([1,2].sample)
        )
      end
    puts "Gerando os contatos! [...] OK"

    puts "Gerando os endereços!"
      Contact.all.each do |ctt|
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: ctt
        )
      end
    puts "Gerando os endereços! [...] OK"

    puts "Gerando os telefones!"
      Contact.all.each do |ctt|
        Random.rand(1..5).times do |i|
          Phone.create!(
            phone: Faker::PhoneNumber.phone_number, 
            contact: ctt
          )
        end
      end
    puts "Gerando os telefones! [...] OK"


  end
end
