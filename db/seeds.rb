# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Campaign.destroy_all

c1 = Campaign.new(
    title: "Reforma da Cozinha",
    description: "Ajude a reformar a cozinha da Amparando. Precisamos de novos
                  eletrodomésticos para servir comida de qualidade às crianças
                  Vamos dobrar a quantidade de refeições servidas por dia.
                  Sua ajuda é muito importante para nós!",
    photo: "https://res.cloudinary.com/dib2nyadi/image/upload/v1544719851/Amparando/child.jpg"
  )


c2 = Campaign.new(
    title: "Passeio na Praia",
    description: "Nos ajude a levar as crianças para a praia do Recreio no
                  próximo final de semana! Contamos com você",
    photo: "https://res.cloudinary.com/dib2nyadi/image/upload/v1544719851/Amparando/child.jpg"
  )

c1.save
c2.save
