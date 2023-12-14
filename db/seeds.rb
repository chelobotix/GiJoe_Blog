# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Article.create!(title: "Destro: From Industrialist to Cobra Arms Dealer",
description: "Laird James McCullen Destro XXIV, the iron-fisted leader of the Iron Grenadiers and founder of M.A.R.S. Industries, wasn't always a villain. He started as a wealthy and ambitious Scottish industrialist, obsessed with weapons and technological innovation.

His path to Cobra began with a shared vision of global domination. Cobra Commander, recognizing Destro's immense military potential, offered him a lucrative partnership: M.A.R.S. would become Cobra's primary weapons supplier, and Destro would gain access to Cobra's vast resources and manpower to fuel his technological ambitions.

Destro, tempted by power and the opportunity to unleash his creations upon the world, readily agreed. He became one of Cobra's most valuable assets, his arsenal of cutting-edge weaponry giving Cobra a significant edge over G.I. Joe.

From reluctant partner to true believer, Destro's loyalty to Cobra has never wavered. He may clash with the Commander, but their shared thirst for power binds them together. Destro remains a formidable foe for G.I. Joe, his iron will and technological prowess making him a constant threat to world peace.

", user_id: 1)
