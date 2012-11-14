# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#Quick Tutorial
# To get user schema's run '.schema model' in dbconsole
# Check models to see what values are automatically created
# rake routes to find the controllers that create the models

(1..5).each do |num|
#User schema 
#<User id: nil, email: nil, password_hash: nil, password_salt: nil, created_at: nil,
#          updated_at: nil, name: nil, year: nil, position: nil>

  #user auto_generate
  fake_str = "user#{num}"
  fake_email="user#{num}@gmail.com"
  fake_pass="user#{num}pass"
  fake_year="2012"
  fake_position="test"
  User.create({:name => fake_str,
               :email => fake_email,
               :password => fake_pass, 
               :position => fake_position, 
               :year => fake_year})

#Events schema
#CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "location" varchar(255), 
#"description" varchar(255), "event_start" datetime, "event_end" datetime, "created_at" datetime, 
#"updated_at" datetime, "author_id" integer);

  #events auto_generate
  fake_title = "Fake Event #{num}"
  fake_location = "Fake Location #{num}"
  fake_description = "Fake Description #{num} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean pellentesque blandit metus eu elementum. Nulla facilisi. In hac habitasse platea dictumst. In sit amet nulla at leo placerat aliquet lacinia et tortor. Nullam eget eros quam, quis vulputate nisi. Aliquam vulputate semper odio, vitae commodo sem sodales non. Aliquam bibendum consequat lacus, vitae rutrum est convallis eget. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean pulvinar aliquam nisl vitae iaculis. Fusce vulputate arcu eget nibh iaculis id placerat ligula ultricies. Fusce lacinia cursus leo at consequat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ut erat risus. Proin lorem odio, dictum quis mollis et, bibendum a urna. Integer non sodales mi."
# Event.create({:title=>"title",:location=>"test",:author_id=>1,:description=>"abcd",
# :event_start=>DateTime.now+1.hours,:event_end=>DateTime.now+5.hours})
  fake_author_id = num
  fake_event_start = DateTime.now + num.days
  fake_event_end = fake_event_start + num.hours
  Event.create({:title => fake_title,
                :location => fake_location,
                :author_id => fake_author_id,
                :description => fake_description,
                :event_start => fake_event_start,
                :event_end => fake_event_end})

  #<Post id: nil, title: nil, content: nil, created_at: nil,
  #updated_at: nil, author_id : nil>
  fake_post_title = "Fake Post #{num}"
  fake_post_content = "Fake Content #{num} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean pellentesque blandit metus eu elementum. Nulla facilisi. In hac habitasse platea dictumst. In sit amet nulla at leo placerat aliquet lacinia et tortor. Nullam eget eros quam, quis vulputate nisi. Aliquam vulputate semper odio, vitae commodo sem sodales non. Aliquam bibendum consequat lacus, vitae rutrum est convallis eget. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean pulvinar aliquam nisl vitae iaculis. Fusce vulputate arcu eget nibh iaculis id placerat ligula ultricies. Fusce lacinia cursus leo at consequat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ut erat risus. Proin lorem odio, dictum quis mollis et, bibendum a urna. Integer non sodales mi."
  Post.create({:title => fake_post_title,
               :content => fake_post_content,
               :author_id => fake_author_id,
              })
end

