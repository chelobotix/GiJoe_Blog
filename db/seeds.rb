require 'faker'

# Categories
category_names = %w[Bio Toys Comics Weapons Movies FanArt Events News G.I\ Joe Cobra]


category_names.each do |category|
  Category.create!(name: category)
end

# Users
User.create!(username: "Admin", email: "admin@gijoeblog.com", password: '1234', faction: "Cobra", avatar: Faker::Avatar.image)

20.times do |n|

  random = rand(2..3)
  if random.even?
    faction = "G.I. Joe"
  else
    faction = "Cobra"
  end
  User.create!(username: Faker::Internet.username, email: Faker::Internet.email, password: '1234', faction: faction, avatar: Faker::Avatar.image)
end

# Articles
article1 = Article.create!(title: "Destro: From Industrialist to Cobra Arms Dealer",
description: "Laird James McCullen Destro XXIV, the iron-fisted leader of the Iron Grenadiers and founder of M.A.R.S. Industries, wasn't always a villain. He started as a wealthy and ambitious Scottish industrialist, obsessed with weapons and technological innovation.

His path to Cobra began with a shared vision of global domination. Cobra Commander, recognizing Destro's immense military potential, offered him a lucrative partnership: M.A.R.S. would become Cobra's primary weapons supplier, and Destro would gain access to Cobra's vast resources and manpower to fuel his technological ambitions.

Destro, tempted by power and the opportunity to unleash his creations upon the world, readily agreed. He became one of Cobra's most valuable assets, his arsenal of cutting-edge weaponry giving Cobra a significant edge over G.I. Joe.

From reluctant partner to true believer, Destro's loyalty to Cobra has never wavered. He may clash with the Commander, but their shared thirst for power binds them together. Destro remains a formidable foe for G.I. Joe, his iron will and technological prowess making him a constant threat to world peace.

", user_id: 1, category_ids: [1,10], photo: 'destro.jpg')


article2 = Article.create!(title: "Crimson Twins: Tomax and Xamot - A Dance of Shadows in Cobra's Heart",
description: "In the viper-infested shadows of Cobra, where ruthless ambition dances with cold logic, the Crimson Twins reign supreme. Tomax and Xamot, mirror images with eyes like glacial flames, have woven a legacy of cunning and calculated chaos throughout G.I. Joe history. But their story is not simply one of shared villainy; it's a saga of fraternal rivalry, psychic whispers, and an endless quest for ultimate control.

Their origins shrouded in whispers of Corsican intrigue, the twins rose through the ranks of Cobra with a potent blend of intellect and ruthlessness. Tomax, the elder by mere minutes, wielded the mind of a strategist, meticulously crafting elaborate schemes and savoring the elegance of flawless execution. Xamot, the fiery counterpoint, reveled in the thrill of the fight, relishing audacious maneuvers that left even Cobra Commander breathless with a mix of fury and grudging respect.

Bound by an eerie telepathic link, the Crimson Twins could sense each other's thoughts, anticipate moves, and share strategies on an almost mystical level. This connection saved them from countless scrapes, making them a two-headed Hydra on the battlefield. Yet, within this unity simmered a constant friction. Tomax craved control, viewing Xamot's impulsiveness as a dangerous chink in their crimson armor. Xamot, in turn, chafed under Tomax's calculating rigidity, yearning for the freedom to unleash his inner inferno.

Their rivalry played out across countless battles. From infiltrating Fort Knox to manipulating global markets, the Twins orchestrated schemes that threatened to tip the balance of power. They clashed with G.I. Joe legends like Hawk and Duke, leaving a trail of scorched earth and shattered dreams in their wake.

Even when foiled, the Twins vanished with a sardonic smirk, already plotting their next move. Their wealth, amassed through shrewd investments and Cobra's ill-gotten gains, fueled their operations and ensured their loyalty remained tenuous at best. They were Cobra's most valuable assets, yes, but also serpents poised to strike at the very heart of the organization.

Tomax and Xamot are more than just villains; they are a fascinating study in power dynamics, ambition, and the ever-shifting loyalties within Cobra. They are a constant reminder that in a world shrouded in shadows, the greatest threat often lurks within, veiled in the cold crimson gaze of a brother.

So, the next time you hear the hiss of a Cobra attack, remember the shadows that lurk behind. For somewhere in that viper's nest, the Crimson Twins are plotting their next move, forever poised to dance on the precipice of power, forever united, yet forever locked in a bitter waltz of ambition.", user_id: 1, category_ids: [1,10], photo: 'tomaxandxamot.jpg')
