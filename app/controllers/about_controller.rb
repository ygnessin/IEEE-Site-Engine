class AboutController < ApplicationController

  def information
    if request.url != about_information_url
      redirect_to about_information_url
    end
  end

  def officers
    @execs = {'jeff_tsui.jpg' => ['Jeff Tsui', 'Chair'], 'noel_moldvai.jpg' => ['Noel Moldvai', 'External VP'], 'ayushi_samaddar.jpg' => ['Ayushi Samaddar', 'Internal VP'], 'guillaume_bellegarda.jpg' => ['Guillaume Bellegarda', 'Treasurer'], 'annie_shin.jpg' => ['Annie Shin', 'Secretary']}
    @activities = {'sean_soleyman.jpg'=>'Sean Soleyman', 'alice_lee.jpg'=>'Alice Lee', 'ino_samaras.jpg'=>'Ino Samaras', 'leland_au.jpg'=>'Leland Au', 'michael_chen.jpg'=>'Michael Chen', 'rohan_sachdev.jpg'=>'Rohan Sachdev', 'mano_pagalavan.jpg'=>'Mano Pagalavan'}
    @hope = {'jeff_lievense.jpg'=>'Jeff Lievense', 'andrew_wun.jpg'=>'Andrew Wun', 'milad_bayan.jpg'=>'Milad Bayan', 'rongchang_lei.jpg'=>'Rongchang Lei', 'james_yang.jpg'=>'James Yang'}
    @indrel = {'vikram_iyer.jpg'=>'Vikram Iyer', 'jonathan_hsu.jpg'=>'Jonathan Hsu', 'marion_halim.jpg'=>'Marion Halim', 'kevin_chian.jpg'=>'Kevin Chian', 'jamshed_vesuna.jpg'=>'Jamshed Vesuna', 'harrison_tsai.jpg'=>'Harrison Tsai', 'alton_zheng.jpg'=>"Alton Zheng"}
    @io = {'nate_holland.jpg'=>'Nate Holland', 'lauren_janney.jpg'=>'Lauren Janney', 'flora_dai.jpg'=>'Flora Dai', 'anthony_sutardja.jpg'=>'Anthony Sutardja', 'tabitha_king.jpg'=>'Tabitha King'}
    @prodev = {'skyler_rojas.jpg'=>'Skyler Rojas', 'parul_singh.jpg'=>'Parul Singh', 'michael_romain.jpg'=>'Michael Romain', 'andy_qin.jpg'=>'Andrew Qin', 'yerin_kim.jpg'=>'Yerin Kim'}
    @techops = {'felix_wong.jpg'=>'Felix Wong', 'alex_romano.jpg' => 'Alex Romano', 'william_ku.jpg'=>'William Ku', 'nelson_zhang.jpg'=>'Nelson Zhang', 'eugene_wong.jpg'=>'Eugene Wong'}
    @website = {'kevin_sheng.jpg' =>' Kevin Sheng', 'yuval_gnessin.jpg'=>'Yuval Gnessin', 'tom_mccormick.jpg'=>'Tom McCormick', 'steve_yadlowsky.jpg'=>'Steve Yadlowsky', 'jessika_wu.jpg'=>'Jessika Wu', 'david_su.jpg'=>'David Su'}

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
