# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelters = Shelter.create(
  [
    {
      name: 'MaxFund Dog Shelter',
      address: '1005 Galapago Street',
      city: 'Denver',
      state: 'CO',
      zip: '80204-3942'
    },
    {
      name: 'MaxFund Cat Shelter',
      address: '720 W. 10th Avenue',
      city: 'Denver',
      state: 'CO',
      zip: '80204'
    },
    {
      name: 'Denver Dumb Friends League',
      address: '2080 S Quebec St',
      city: 'Denver',
      state: 'CO',
      zip: '80231'
    }
  ]
)
pets = Pet.create(
  [
    {
      image: 'https://cdn.pixabay.com/photo/2016/02/19/11/53/pug-1210025_960_720.jpg',
      name: 'Admiral Muffins, III',
      approximate_age: '2',
      sex: 'M',
      shelter_id: shelters[0][:id],
      description: 'A pug in a rug.',
      adoption_status: 'adoptable'
    },
    {
      image: 'https://cdn.pixabay.com/photo/2017/01/30/23/19/cat-2022341_960_720.jpg',
      name: 'Commodore Poptart, Esq.',
      approximate_age: '6',
      sex: 'F',
      shelter_id: shelters[1][:id],
      description: 'A lil chonker.',
      adoption_status: 'adoptable'
    },
    {
      image: 'https://cdn.pixabay.com/photo/2017/11/15/13/52/bulldog-2952049_960_720.jpg',
      name: 'Banjo, Dutchess of Snortleshire',
      approximate_age: '3',
      sex: 'F',
      shelter_id: shelters[2][:id],
      description: 'MAJESTIC.',
      adoption_status: 'pending adoption'
    }
  ]
)
