# README

**Uses postgresql in development and production.**

Setup

* git clone git@github.com:maxcobmara/infinitask.git
* bundle install
* update config/database.yml with your local credentials
* $ rails db:setup
* $ ./bin/dev to start with foreman



Original Build Tasks

  * asdf plugin update ruby
  * asdf install ruby 3.4.1gem install rails -v8.0.1
  * asdf global ruby 3.4.1
  * rails new infinitask --css=bootstrap -j=esbuild
  * cd infinitask
  * git initialize and push
  * rails generate scaffold task title:string description:text completed:boolean


**Part B: Security Questions**

1. *What steps would you take to prevent mass assignment vulnerabilities in Rails?*
<br/>`attr_protected` will blacklist named coloumns to protect from mass assignment.
<br/>`attr_accessible` will whitelist named coloumns
<br/>`config.active_record.whitelist_attributes = true` would provide global protection from mass assignment, with coloumns permitted only by the attr_ methods above.
  
2. *How would you handle session security in a Rails app to protect against session hijacking?*
<br/>Ensure `config.force_ssl = true` and youre running on `https://`
<br/>Ensure users logout after session of automatically logout users after short period of inactivity to expire sessions.
<br/>Don't overload session cookies, store in db
<br/>`reset_session` in Sessions Controller to prevent session fixation

3. *How does Rails protect against SQL injection attacks by default, and what additional steps might you take for more complex queries*
<br/> Ruby on Rails has a built-in filter for special SQL characters, which will escape ’ , " , NULL character and line breaks.
<br/>For more complex queries you could use prepared statements that seperate the query from the parameters ensuring input is treated as data and not query logic, oh and never use `delet_all`.

4. *How would you mitigate the risk of XSS in a Rails application when rendering user input in views?
*<br/> In most cases Rails handles XSS protection, however do ensure no unnecessary use of `raw` and `.html_safe`.  However to sanitize user input, especially so if used in vulnerable helpers such as `link_to` 

5. *How does Rails protect against CSRF attacks, and what would you do if you had a custom API endpoint that needed protection?*
<br/>Rails uses CSFR Tokens that are generated when rendering a form and compares it on submission.
<br/>For custom APIs you could store the Token in a httpOnly cookie and the API can resubmit as a `X-CSFR-Token` header.  However this should be only available for Users already authenticated.

6. *What strategies would you use to securely store passwords in a Rails application?*
<br/> Rails 8 now allows `encrypt :coloumn` in the model.  However previously would use an encryption gem such as brypt-ruby, and hash the field with salt via a before_save method, and finally protect the password hash and salt from mass assignment.

7. *How would you prevent unauthorized access to sensitive data, such as user profiles, based on user roles or permissions in Rails?*
<br/>For this my go to is CanCanCan gem setup for "least privilage principle" 