IEEE Website Documentation
==

###Table of Contents:
1. Setting up your work station
2. Developing with Git
3. Deploying to Production
4. For n00bs: Web Development Primer
5. Rails info


SETTING UP YOUR WORK STATION
==

1. Download and install ruby, rails, bundler, and git. Alternatively, you could try to use RailsInstaller which downloads and installs all those things plus some other stuff. If you're using Windows, I highly recommend you also install the git bash tool, or "Git for Windows". Also, make sure you add ruby to your command path (you can check this by going to the command line and typing `irb` which opens the interactive ruby interpreter. Type `exit` to exit).

2. If you don't have a github.com account, make one. Then, go to our main repository at https://github.com/IEEEBerkeley/IEEE-Site-Engine and click the "Fork" button near the top right (The new repository is https://github.com/IEEEBerkeley/blue_raspberry). Once this is done, go back to your profile and there you should have your own copy of the repo, titled YOURGITHUB/IEEE-Site-Engine. Your fork of the repo is what we will refer to as "remote" or "origin", while the original IEEEBerkeley one is called "upstream".

3. Generate an SSH Key and add it to your Github using the instructions on this page: https://help.github.com/articles/generating-ssh-keys

4. In your command line (or git bash tool, for Windows users) navigate to the directory that you want to work in using the `cd FOLDER-NAME` command. Then, go to the github page of your remote repository and copy the HTTP URL that is displayed on that page (It should look something like https://github.com/YOURGITHUB/IEEE-Site-Engine.git). Then, in the command line, enter `git clone COPIED-URL`.

5. Once the repository is finished cloning, you should have copies of all of our website stuff on your own machine! We will refer to this as the "local" or "master" repository. Now, cd into the main folder of the repo you just cloned and add an "upstream" repository by running "git remote add upstream https://github.com/IEEEBerkeley/IEEE-Site-Engine".

6. While still in the main folder of you repo, enter `bundle install`. This should install all of the ruby gems required by our app, which are described in the Gemfile in the home folder (a Ruby gem is equivalent to a Java JAR or a Python egg, which is a package or collection of classes used to add certain functionality to a program). If you encounter problems, try `bundle install --without production`. Enter `rails --version` to make sure Rails is installed correctly. Then, enter `rake db:test:prepare` followed by `rake db:migrate` to set up your local database. Enter `rake db:seed` to populate it with test data.

7. After your gems finish installing, while still in the main folder, enter `rails server` or `rails s`. This will start up a Ruby on Rails webserver right on your own machine! Wait for the server to finish booting, which can take up to a minute on some computers (you'll know it's done when it prints 3 timestamped lines). Then, open your favorite web browser and type "http://localhost:3000/" in the URL bar. It might take a while the first time, but you will see a local copy of our website displayed in your browser. Awesome! Also, in the command line window, you can see all the HTTP requests being sent and received, such as GET and POST. When you're done, shut down the server with Ctrl-C.

8. If you're really having trouble getting all this to work (especially if you're on Windows), and you've already exhausted online resources such as google and stackoverflow.com then as a last resort you may consider installing the saasbook Virtual Machine from http://beta.saasbook.info/bookware-vm-instructions under "Downloading and Installing the Courseware". It's an Ubuntu VM already set up with Rails, designed for CS169. If you use it you can probably start from step 2.


DEVELOPING WITH GIT
==

1. Whenever you begin developing, make sure your local repository is up-to-date:

    ```
    cd IEEE-Site-Engine               // change directory
    git pull origin master            // pull your own changes to this machine
    git pull upstream master          // pull everyone's changes
    ```

2. If you're starting work on a new feature, create a branch and then checkout that branch:

    ```
    git branch *new-branch-name*      // iff making new branch
    git checkout *new-branch-name*    // e.g. *new-branch-name* = new-officers-page
    ```

    If you're resuming work on a feature you haven't yet finished, then only run the checkout command.

3. Write your code. Whenever you finish a working chunk, commit it. Good practice is to commit early and often, but try to only commit code that works.

    ```
    git status                        // see what you've changed
    git add *filename*                // add modified files you want to commit
    git status                        // make sure everything is correct
    git commit -m "your message"      // IMPORTANT: write a descriptive commit message
    ```

4. When you're done working on your feature (probably after several commits), it's time to rebase and merge your branch back into your master branch:

    ```
    git checkout master               // check out your master branch
    git pull --rebase upstream master // just in case someone else pushed code
    git rebase *new-branch-name*      // http://git-scm.com/book/en/Git-Branching-Rebasing
    git push origin master            // push your commits to your remote repo
    ```

5. Finally, if you think that your changes are ready to go live on our website, navigate to your repository on Github and click the button that says "Pull Request". Your changes will await approval by the Website Director. Following this, do NOT rebase.

    If you have access to the IEEEBerkeley group, then instead you can simply do:
	```
    git push upstream master
	```

6. Occasionally while developing you may encounter merge conflicts. If the conflicts are with another developer's code that you don't fully understand, it is important to get in touch when resolving the conflict to make sure you don't mess up each other's code. For basic explanations on branching, merging, and conflict resolution: http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging

7. If and only if you are simply making a small one- or two-line change, then there's no need to make a new branch. Skip step 2, and instead of step 4 simply pull and then do a "git push origin master"


DEPLOYING TO PRODUCTION
==

Make sure you are a user that has access to the deployer user on ieee.berkeley.edu. If not, talk to the website director to have him add your public RSA ssh key to the `.ssh/authorized_keys` server file on deployer. Note that if you are using PuTTY on Windows then you'll have to do a bit more for this to work: open `puttygen.exe` (find it by typing 'puttygen' into the Start search window). Then, if you don't yet have a public/private key pair (step 3 from Setting Up Your Workstation) simply click Generate; if you already have keys, click Conversions->Import Key and select the file `~/.ssh/id_rsa`. Change the comment if appropriate and add a passphrase if you want, then click Save Private Key. Then, in PuTTY, go to Connection/SSH/Auth and under "Private key file for authentication" put the .ppk file you just created.

Go to your copy of the website on your own machine. Make sure you are up-to-date by running bundle install just to be safe. When you are ready to derploy, run `bundle exec cap deploy`. Wait for it to finish. If there are a couple of red lines, don't be too concerned. Read through them. If they are about assets pipeline or something like that, then just make sure the website looks correct once it finishes. If there are any stack traces, then read through them and see what happened. Last resort, c+p it into an email to ieee-website@lists.berkeley.edu

If something comes up and you need to get in and can't, ssh into your personal user, and then `sudo su - deployer` to get into the deployer user. To give a user sudo permissions, add them to the wheel group using `sudo usermod -a -G wheel {username}`

###How Deployments Work (for the curious)
We are using capistrano, an ssh management tool. You can see its configs in Capfile and `config/deploy.rb`. Mostly the latter. It will ssh in to the deployer user and fork the repo into `/tmp`. It will then copy that folder into a new folder in `/srv/ieee-main/releases`. All the folders in there are labeled by date and a unique number to identify the release. The newest release is symlinked to `/srv/ieee-main/current`. All the shared resources that don't need to be rewritten every release are in `/srv/ieee-main/shared` and are symlinked by capistrano on deployment. The stripe keys are in a file at `/etc/thin/set-secret-keys.sh` and they are sourced in before thin is restarted. The specific commands for the restart are in `config/deploy.rb`. Only other important thing to note is that the file in the thin restart line is the thin config file, which tells how many servers and all that to create. Right now we have 3 processes and nginx load-balances between them.

That brings up the last topic, nginx. We use this to do magic SSL verification and load blanacing (to a minor degree -- speed isn't a huge issue for us). There is a nginx settings file in `/etc/nginx/nginx.conf` that sets up the SSL certs and the servers, as well as separates out static assets to be served by nginx instead of making ruby do that work. Any request it can't handle on its own gets passed down to the thin processes that do the dirty work.


FOR N00BS: WEB DEVELOPMENT PRIMER
==

#####Ruby
A dynamic, reflective, object-orientated programming language similar to Python, Perl, and Lisp. It fuels Ruby on Rails.

#####Ruby on Rails
A Ruby framework designed for web development. This is our back-end: it accesses our database, and generates HTML web content using ruby code. It uses the Model-View-Controller paradigm, which you may want to read up on. Rails abstracts all the nitty-gritty stuff like database manipulation, cookies, http requests, etc. Learn more in the Rails Info section below.

#####HTML
A markup language for web CONTENT. Should not be used for styling (that's CSS). Similarly, HTML styling tags such as `<b>` for bold are a thing of the past and should never be used. Our website uses HAML (file extension `.html.haml`), which is really just syntactic sugar over HTML, and nothing more. http://haml.info/about.html

#####CSS
For web STYLING. Should be kept separate from content (HTML). In-line CSS is bad practice, instead it should be in separate stylesheet files. Our website uses Sass (file extension `.scss`), which is just an extended form of CSS that provides more functionality. Regular CSS should work as usual. http://sass-lang.com/

#####Javascript
A programming language that web browsers can interpret. Used for dynamically altering web pages AFTER they're loaded. If you've ever been on a webpage and seen it change after the browser already loads it, that's javascript. Like CSS, in-line JS is bad practice; it should be kept strictly in separate `.js` files if possible.

#####Database
A system that stores an application's data. It's optimized for fast retrieval of data, known as a query. The database we use is called PostgreSQL.

It's important that all these facets be kept as separate as possible, e.g. HTML/HAML, CSS, and Javascript being in separate files. Additionally, although inevitably sometimes ruby code needs to go in our HAML views, whenever possible it should be in the Controller or Model ruby files (`.rb`) instead.


RAILS INFO
==

Rails is a web-application framework that includes everything needed to create
database-backed web applications according to the Model-View-Control pattern.

This pattern splits the view (also called the presentation) into "dumb"
templates that are primarily responsible for inserting pre-built data in between
HTML tags. The model contains the "smart" domain objects (such as Account,
Product, Person, Post) that holds all the business logic and knows how to
persist themselves to a database. The controller handles the incoming requests
(such as Save New Account, Update Product, Show Post) by manipulating the model
and directing data to the view.

In Rails, the model is handled by what's called an object-relational mapping
layer entitled Active Record. This layer allows you to present the data from
database rows as objects and embellish these data objects with business logic
methods. You can read more about Active Record in
link:files/vendor/rails/activerecord/README.html.

The controller and view are handled by the Action Pack, which handles both
layers by its two parts: Action View and Action Controller. These two layers
are bundled in a single package due to their heavy interdependence. This is
unlike the relationship between the Active Record and Action Pack that is much
more separate. Each of these packages can be used independently outside of
Rails. You can read more about Action Pack in
link:files/vendor/rails/actionpack/README.html.


###Anatomy of a Rails app

The default directory structure of a generated Ruby on Rails application:
```
  |-- app
  |   |-- controllers
  |   |-- helpers
  |   |-- mailers
  |   |-- models
  |   `-- views
  |       `-- layouts
  |-- config
  |   |-- environments
  |   |-- initializers
  |   `-- locales
  |-- db
  |-- doc
  |-- lib
  |   `-- tasks
  |-- log
  |-- public
  |   |-- images
  |   |-- javascripts
  |   `-- stylesheets
  |-- script
  |-- test
  |   |-- fixtures
  |   |-- functional
  |   |-- integration
  |   |-- performance
  |   `-- unit
  |-- tmp
  |   |-- cache
  |   |-- pids
  |   |-- sessions
  |   `-- sockets
  `-- vendor
      `-- plugins
```
#####app     
  Holds all the code that's specific to this particular application.

#####app/controllers    
  Holds controllers that should be named like weblogs_controller.rb for
  automated URL mapping. All controllers should descend from
  ApplicationController which itself descends from ActionController::Base.

#####app/models    
  Holds models that should be named like post.rb. Models descend from
  ActiveRecord::Base by default.

#####app/views    
  Holds the template files for the view that should be named like
  weblogs/index.html.erb for the WeblogsController#index action. All views use
  eRuby syntax by default.

#####app/views/layouts    
  Holds the template files for layouts to be used with views. This models the
  common header/footer method of wrapping views. In your views, define a layout
  using the <tt>layout :default</tt> and create a file named default.html.erb.
  Inside default.html.erb, call <% yield %> to render the view using this
  layout.

#####app/helpers    
  Holds view helpers that should be named like weblogs_helper.rb. These are
  generated for you automatically when using generators for controllers.
  Helpers can be used to wrap functionality for your views into methods.

#####config    
  Configuration files for the Rails environment, the routing map, the database,
  and other dependencies.

#####db    
  Contains the database schema in schema.rb. db/migrate contains all the
  sequence of Migrations for your schema.

#####doc    
  This directory is where your application documentation will be stored when
  generated using <tt>rake doc:app</tt>

#####lib    
  Application specific libraries. Basically, any kind of custom code that
  doesn't belong under controllers, models, or helpers. This directory is in
  the load path.

#####public    
  The directory available for the web server. Contains subdirectories for
  images, stylesheets, and javascripts. Also contains the dispatchers and the
  default HTML files. This should be set as the DOCUMENT_ROOT of your web
  server.

#####script    
  Helper scripts for automation and generation.

#####test    
  Unit and functional tests along with fixtures. When using the rails generate
  command, template test files will be generated for you and placed in this
  directory.

#####vendor    
  External libraries that the application depends on. Also includes the plugins
  subdirectory. If the app has frozen rails, those gems also go here, under
  vendor/rails/. This directory is in the load path.
  

###Debugging Rails

Sometimes your application goes wrong. Fortunately there are a lot of tools that
will help you debug it and get it back on the rails.

First area to check is the application log files. Have "tail -f" commands
running on the server.log and development.log. Rails will automatically display
debugging and runtime information to these files. Debugging info will also be
shown in the browser on requests from 127.0.0.1.

You can also log your own messages directly into the log file from your code
using the Ruby logger class from inside your controllers. Example:
```ruby
  class WeblogController < ActionController::Base
    def destroy
      @weblog = Weblog.find(params[:id])
      @weblog.destroy
      logger.info("#{Time.now} Destroyed Weblog ID ##{@weblog.id}!")
    end
  end
```
The result will be a message in your log file along the lines of:
```
  Mon Oct 08 14:22:29 +1000 2007 Destroyed Weblog ID #1!
```
More information on how to use the logger is at http://www.ruby-doc.org/core/

Also, Ruby documentation can be found at http://www.ruby-lang.org/. There are
several books available online as well:

* Programming Ruby: http://www.ruby-doc.org/docs/ProgrammingRuby/ (Pickaxe)
* Learn to Program: http://pine.fm/LearnToProgram/ (a beginners guide)

These two books will bring you up to speed on the Ruby language and also on
programming in general.


###Rails Console 

The console is a Ruby shell, which allows you to interact with your
application's domain model. Here you'll have all parts of the application
configured, just like it is when the application is running. You can inspect
domain models, change values, and save to the database. Starting the script
without arguments will launch it in the development environment.

To start the console, run <tt>rails console</tt> from the application
directory.

Options:

* Passing the <tt>-s, --sandbox</tt> argument will rollback any modifications
  made to the database.
* Passing an environment name as an argument will load the corresponding
  environment. Example: <tt>rails console production</tt>.

To reload your controllers and models after launching the console run
<tt>reload!</tt>

More information about irb can be found at:
link:http://www.rubycentral.com/pickaxe/irb.html


###dbconsole

You can go to the command line of your database directly through <tt>rails
dbconsole</tt>. You would be connected to the database with the credentials
defined in database.yml. Starting the script without arguments will connect you
to the development database. Passing an argument will connect you to a different
database, like <tt>rails dbconsole production</tt>. Currently works for MySQL,
PostgreSQL and SQLite 3.


###Debugger

Debugger support is available through the debugger command when you start your
Mongrel or WEBrick server with --debugger. This means that you can break out of
execution at any point in the code, investigate and change the model, and then,
resume execution! You need to install ruby-debug to run the server in debugging
mode. With gems, use <tt>sudo gem install ruby-debug</tt>. Example:

```ruby
  class WeblogController < ActionController::Base
    def index
      @posts = Post.find(:all)
      debugger
    end
  end
````

So the controller will accept the action, run the first line, then present you
with a IRB prompt in the server window. Here you can do things like:
```ruby
  >> @posts.inspect
  => "[#<Post:0x14a6be8
          @attributes={"title"=>nil, "body"=>nil, "id"=>"1"}>,
       #<Post:0x14a6620
          @attributes={"title"=>"Rails", "body"=>"Only ten..", "id"=>"2"}>]"
  >> @posts.first.title = "hello from a debugger"
  => "hello from a debugger"
```
...and even better, you can examine how your runtime objects actually work:
```ruby
  >> f = @posts.first
  => #<Post:0x13630c4 @attributes={"title"=>nil, "body"=>nil, "id"=>"1"}>
  >> f.
  Display all 152 possibilities? (y or n)
```
Finally, when you're ready to resume execution, you can enter "cont".
  
  
###Local Test Data
Test data is generated from `db/seeds.rb`   
5 users, 5 locations, 5 posts.         
Each user has an associated post and event.

**username:** user{num}    
**email:** user{num}@gmail.com    
**password:** user{num}pass 

**Creating test data**
```
rake db:migrate
rake db:seed
```

**Dropping the database:** `rake db:drop`

----
