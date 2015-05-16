# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8

Product.delete_all
Product.create!(title: 'First Product',
  description: 
    %{
        Added manually, then added to seeds.
      },
  image_url:   'NotAvailable.bmp',
  price: 1.00)

Product.create!(title: 'CoffeeScript',
  description: 
    %{
        CoffeeScript is JavaScript done right. 
      },
  image_url:   'cs.gif',
  price: 36.00)

# . . .
Product.create!(title: 'Programming Ruby 1.9 & 2.0',
  description:
    %{
        Ruby is the fastest growing and most exciting dynamic language
        out there. 
      },
  image_url: 'ruby.gif',
  price: 49.95)
# . . .

Product.create!(title: 'Rails Test Prescriptions',
  description: 
    %{
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). 
      },
  image_url: 'rtp.gif',
  price: 34.95)