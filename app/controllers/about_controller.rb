class AboutController < ApplicationController

  def information
    if request.url != about_information_url
      redirect_to about_information_url
    end
  end

  def officers
    require 'pathname'
    
    @execs = [['Jeff Tsui', 'Chair'], ['Noel Moldvai', 'External VP'], ['Ayushi Samaddar', 'Internal VP'], ['Guillaume Bellegarda', 'Treasurer'], ['Annie Shin', 'Secretary']]
    @activities = ['Alice Lee', 'Rohan Sachdev', 'Ino Samaras', 'Lori Krakirian', 'William Ku', 'Leland Au', 'Krishna Parashar']
    @hope = ['Jeff Lievense', 'James Yang', 'Gokul Ramesh', 'Rongchang Lei', 'Ronald Lee', 'Rishi Sharma', 'Andrew Wun']
    @indrel = ['Vikram Iyer', 'Harrison Tsai', 'Marion Halim', 'Jamshed Vesuna', 'Luca Zuccarini', 'Kevin Chian', 'Jonathan Hsu']
    @io = ['Flora Dai', 'Lauren Janney', 'Tabitha King', 'Ingrid Hong', 'Sarah Kim', 'Dorothy Jung']
    @prodev = ['Skyler Rojas', 'Michael Romain', 'Parul Singh', 'Paymon Payamipour', 'Nate Holland', 'Colin Elder']
    @techops = ['Eugene Wong', 'Harish Shanker', 'Eric Wu', 'Tom McCormick', 'Alex Romano', 'Felix Wong', 'Preetum Nakkiran']
    @website = ['Yuval Gnessin', 'Kevin Sheng', 'David Su', 'Anuvind Menon', 'Eleane Jao', 'Jimmy Wu', 'Pranava Adduri']
  end

  def advisor
  end

  def contact
  end

end
