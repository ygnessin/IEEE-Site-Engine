class AboutController < ApplicationController

  def information
    if request.url != about_information_url
      redirect_to about_information_url
    end
  end

  def officers
    @execs = {'Jeff.jpg' => ['Jeff Tsui', 'Chair'], 'Noel.jpg' => ['Noel Moldvai', 'External VP'], 'Ayushi.jpg' => ['Ayushi Samaddar', 'Internal VP'], 'Guillaume.jpg' => ['Guillaume Bellegarda', 'Treasurer'], 'Annie.jpg' => ['Annie Shin', 'Secretary']}
    @activities = {'default.jpg'=>'Sean Soleyman', 'Alice.jpg'=>'Alice Lee', 'Ino.jpg'=>'Ino Samaras', 'Leland.jpg'=>'Leland Au', 'Michael_Chen.jpg'=>'Michael Chen', 'Rohan.jpg'=>'Rohan Sachdev', 'default.jpg'=>'Mano Pagalavan'}
    @hope = {'Jeff_Lievense.jpg'=>'Jeff Lievense', 'default.jpg'=>'Andrew Wun', 'default.jpg'=>'Milad Bayan', 'Rongchang.jpg'=>'Rongchang Lei', 'default.jpg'=>'James Yang'}
    @indrel = {'default.jpg'=>'Vikram Iyer', 'default.jpg'=>'Jonathan Hsu', 'Marion.jpg'=>'Marion Halim', 'default.jpg'=>'Kevin Chian', 'default.jpg'=>'Jamshed Vesuna', 'Harrison.jpg'=>'Harrison Tsai', 'default.jpg'=>"Alton Zheng"}
    @io = {'Nate.jpg'=>'Nate Holland', 'Lauren.jpg'=>'Lauren Janney', 'Flora.jpg'=>'Flora Dai', 'Anthony.jpg'=>'Anthony Sutardja', 'Tabitha.jpg'=>'Tabitha King'}
    @prodev = {'Skyler.jpg'=>'Skyler Rojas', 'Parul.jpg'=>'Parul Singh', 'Michael.jpg'=>'Michael Romain', 'default.jpg'=>'Andrew Qin', 'Yerin'=>'Yerin Kim'}
    @techops = {'Mark Hettick', 'Felix.jpg'=>'Felix Wong', 'default.jpg'=>'Chris Meredith', 'Alex.jpg' => 'Alex Romano', 'William.jpg'=>'William Ku', 'default.jpg'=>'Nelson Zhang', 'Eugene.jpg'=>'Eugene Wong'}
    @website = {'Kevin.jpg' =>' Kevin Sheng', 'Yuval.jpg'=>'Yuval Gnessin', 'Tom.jpg'=>'Tom McCormick', 'default.jpg'=>'Steve Yadlowsky', 'Jessika.jpg'=>'Jessika Wu', 'David.jpg'=>'David Su'}

#    @execs = [['Tianbo Xu', 'Chair'], ['Pranava Adduri', 'External VP'], ['Mark Hettick', 'Internal VP'], ['Gabe Fierro', 'Secretary'], ['Jeff Tsui', 'Treasurer']]
#    @activities = ['Leland Au', 'Alice Lee', 'Amanda Ren', 'Annie Shin', 'Edward Wu']
#    @hope = ['Sean Soleyman', 'Oliver Zhu', 'Andrew Wun']
#    @indrel = ['Mihir Joshi', 'Benjamin Lui', 'Noel Moldvai', 'Amudhan Venkatesan', 'Mano Pagalavan']
#    @io = ['Jaclyn Louie', 'Navin Eluthesen', 'Ayushi Samaddar', 'Jessika Wu', 'Muller Zhang']
#    @prodev = ['Owen Lin', 'Deirdre Chen', 'Aime Ngongang', 'Jeremy Williams']
#    @techops = ['Felix Wong', 'Guillaume Bellegarda', 'Sergio Hidalgo', 'Jonathan Hsu', 'William Ku', 'Sam Whitlock']
#    @website = ['Kristine Chen', 'Jian P. Chen', 'Stephanie Chou', 'Yuval Gnessin', 'Kevin Sheng', 'David Su']
  end

  def advisor
  end  
  
  def contact
  end

end
