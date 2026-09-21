# Plutonium Tutorial Manual Fixes Log

This document tracks all issues encountered during the Plutonium blog tutorial that required manual intervention, configuration adjustments, or bug fixes beyond standard tutorial steps.

---

## Command History (Chapters 2 & 3)

```bash
~/labs/plutonium-demo-blog main                                                                                                                        14:24:57
❯ rails generate pu:pkg:package blogging
=> [plutonium] starting reloader
      create  packages/blogging/lib/engine.rb
      create  packages/blogging/app/controllers/blogging
      create  packages/blogging/app/controllers/blogging/resource_controller.rb
      create  packages/blogging/app/interactions/blogging
      create  packages/blogging/app/interactions/blogging/resource_interaction.rb
      create  packages/blogging/app/models/blogging
      create  packages/blogging/app/models/blogging/resource_record.rb
      create  packages/blogging/app/policies/blogging
      create  packages/blogging/app/policies/blogging/resource_policy.rb
      create  packages/blogging/app/definitions/blogging
      create  packages/blogging/app/definitions/blogging/resource_definition.rb
      create  packages/blogging/app/views/blogging/.keep

~/labs/plutonium-demo-blog main*                                                                                                                    6s 14:25:17
❯ rails generate pu:res:scaffold Post title:string body:text 'published:boolean?' --dest=blogging
=> [plutonium] starting reloader
      create  app/models/blogging.rb
      create  app/models/blogging/post.rb
      create  db/migrate/20260919142548_create_blogging_posts.rb
      create  app/controllers/blogging/posts_controller.rb
      create  app/policies/blogging/post_policy.rb
      create  app/definitions/blogging/post_definition.rb

~/labs/plutonium-demo-blog main*                                                                                                                    6s 14:25:48
❯ rails db:prepare
=> [plutonium] starting reloader
== 20260919142548 CreateBloggingPosts: migrating ==============================
-- create_table(:blogging_posts)
   -> 0.0036s
== 20260919142548 CreateBloggingPosts: migrated (0.0037s) =====================

== 20260919142548 CreateBloggingPosts: migrating ==============================
-- create_table(:blogging_posts)
   -> 0.0068s
== 20260919142548 CreateBloggingPosts: migrated (0.0071s) =====================

~/labs/plutonium-demo-blog main*                                                                                                                    6s 14:28:36
❯ rails generate pu:pkg:portal admin --public
=> [plutonium] starting reloader
      create  packages/admin_portal/lib/engine.rb
      create  packages/admin_portal/config/routes.rb
      create  packages/admin_portal/app/controllers/admin_portal/concerns/controller.rb
      create  packages/admin_portal/app/controllers/admin_portal/plutonium_controller.rb
      create  packages/admin_portal/app/controllers/admin_portal/resource_controller.rb
      create  packages/admin_portal/app/controllers/admin_portal/dashboard_controller.rb
      create  packages/admin_portal/app/views/admin_portal/dashboard/index.html.erb
      create  packages/admin_portal/app/policies/admin_portal
      create  packages/admin_portal/app/policies/admin_portal/resource_policy.rb
      create  packages/admin_portal/app/definitions/admin_portal
      create  packages/admin_portal/app/definitions/admin_portal/resource_definition.rb
      create  packages/admin_portal/app/views/admin_portal/.keep
        info  Copied /Users/waptik/.local/share/mise/installs/ruby/3.4.10/lib/ruby/gems/3.4.0/gems/plutonium-0.64.0/app/views/plutonium/_resource_header.html.erb to /Users/waptik/labs/plutonium-demo-blog/packages/admin_portal/app/views/plutonium/_resource_header.html.erb
        info  Copied /Users/waptik/.local/share/mise/installs/ruby/3.4.10/lib/ruby/gems/3.4.0/gems/plutonium-0.64.0/app/views/plutonium/_resource_sidebar.html.erb to /Users/waptik/labs/plutonium-demo-blog/packages/admin_portal/app/views/plutonium/_resource_sidebar.html.erb

~/labs/plutonium-demo-blog main*                                                                                                                    6s 14:28:49
❯ rails generate pu:res:conn Blogging::Post --dest=admin_portal
=> [plutonium] starting reloader
      create  packages/admin_portal/app/controllers/admin_portal/blogging/posts_controller.rb
      insert  packages/admin_portal/config/routes.rb

~/labs/plutonium-demo-blog main*                                                                                                                    6s 14:29:13
❯ rails generate pu:rodauth:install
=> [plutonium] starting reloader
         run  bundle add bcrypt from "."
         run  bundle add sequel-activerecord_connection from "."
         run  bundle add tilt from "."
         run  bundle add rodauth-rails from "."
      create  config/initializers/rodauth.rb
      create  app/controllers/rodauth_controller.rb
      create  app/rodauth/rodauth_app.rb
      create  app/rodauth/rodauth_plugin.rb
      create  config/initializers/url_options.rb

~/labs/plutonium-demo-blog main*                                                                                                                    6s 14:46:27
❯ rails g pu:rodauth:admin admin
=> [plutonium] starting reloader
         run  bundle add rotp from "."
         run  bundle add rqrcode from "."
      create  app/rodauth/admin_rodauth_plugin.rb
        gsub  app/rodauth/rodauth_app.rb
      insert  app/rodauth/rodauth_app.rb
      create  app/controllers/rodauth/admin_controller.rb
      create  db/migrate/20260919144701_create_rodauth_admin_base_remember_verify_account_reset_password_otp_recovery_codes_lockout_active_sessions_audit_logging.rb
      create  app/models/admin.rb
      create  app/controllers/admins_controller.rb
      create  app/policies/admin_policy.rb
      create  app/definitions/admin_definition.rb
      create  app/mailers/rodauth_mailer.rb
      create  app/mailers/rodauth/admin_mailer.rb
      create  app/views/rodauth/admin_mailer
      create  app/views/rodauth/admin/_login_form_footer.html.erb
      create  lib/tasks/rodauth_admin.rake
      create  app/interactions/admin/invite_interaction.rb
      create  app/interactions/admin/resend_invite_interaction.rb

~/labs/plutonium-demo-blog main*                                                                                                                   17s 14:47:01
❯ rails db:prepare
=> [plutonium] starting reloader
== 20260919144701 CreateRodauthAdminBaseRememberVerifyAccountResetPasswordOtpRecoveryCodesLockoutActiveSessionsAuditLogging: migrating 
-- create_table(:admins)
-- create_table(:admin_remember_keys, {id: false})
-- create_table(:admin_verification_keys, {id: false})
-- create_table(:admin_password_reset_keys, {id: false})
-- create_table(:admin_otp_keys, {id: false})
-- create_table(:admin_recovery_codes, {primary_key: [:id, :code]})
-- create_table(:admin_login_failures, {id: false})
-- create_table(:admin_lockouts, {id: false})
-- create_table(:admin_active_session_keys, {primary_key: [:admin_id, :session_id]})
-- create_table(:admin_authentication_audit_logs)
== 20260919144701 CreateRodauthAdminBaseRememberVerifyAccountResetPasswordOtpRecoveryCodesLockoutActiveSessionsAuditLogging: migrated (0.0331s) 

~/labs/plutonium-demo-blog main*                                                                                                                    6s 14:47:16
❯ rails generate pu:pkg:portal admin --auth=admin --force
=> [plutonium] starting reloader
       force  packages/admin_portal/lib/engine.rb
       force  packages/admin_portal/config/routes.rb
       force  packages/admin_portal/app/controllers/admin_portal/concerns/controller.rb

~/labs/plutonium-demo-blog main*                                                                                                                    6s 14:53:14
❯ rails rodauth:admin
=> [plutonium] starting reloader
Email: admin@example.com

~/labs/plutonium-demo-blog main*                                                                                                                   16s 14:57:46
❯ rails rodauth:admin 
=> [plutonium] starting reloader
Email: me@waptik.xyz
```

---

## Issue 1: Generator Destroy Failure (`rails destroy pu:rodauth:admin admin`)

### Error Log
```text
      remove  app/models/admin.rb
/Users/waptik/.local/share/mise/installs/ruby/3.4.10/lib/ruby/3.4.0/bundled_gems.rb:82:in 'Kernel.require': cannot load such file -- /Users/waptik/labs/plutonium-demo-blog/app/models/admin.rb (LoadError)
	from bootsnap-1.26.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:33:in 'Kernel#require'
	from zeitwerk-2.8.3/lib/zeitwerk/core_ext/kernel.rb:26:in 'Kernel#require'
	from activesupport-8.1.3.1/lib/active_support/inflector/methods.rb:290:in 'ActiveSupport::Inflector#constantize'
	from plutonium-0.64.0/lib/generators/pu/res/scaffold/scaffold_generator.rb:23:in 'Pu::Res::ScaffoldGenerator#setup'
	from plutonium-0.64.0/lib/generators/pu/rodauth/account_generator.rb:127:in 'Pu::Rodauth::AccountGenerator#create_account_model'
	from plutonium-0.64.0/lib/generators/pu/rodauth/admin_generator.rb:32:in 'Pu::Rodauth::AdminGenerator#generate_admin_account'
```

### Root Cause
When rolling back via `rails destroy pu:rodauth:admin`, Thor attempts to reverse the scaffolding invocation. In `account_generator.rb`, it attempts to re-constantize `Admin` after it has already deleted `app/models/admin.rb`, raising a unhandled `LoadError`.

### Solution
Manual removal of the generated assets:
1. Deleted generated files: `app/controllers/admins_controller.rb`, `app/controllers/rodauth/`, `app/definitions/admin_definition.rb`, `app/policies/admin_policy.rb`, `app/mailers/rodauth/`, `app/mailers/rodauth_mailer.rb`, `app/views/rodauth/`, `app/interactions/admin/`, and migration files.
2. Removed injected gems (`rotp`, `rqrcode`) from `Gemfile` and restored `Gemfile.lock`.
3. Restored `app/rodauth/rodauth_app.rb` to the clean template state generated by `pu:rodauth:install`.

---

## Issue 2: Cloudflare Tunnel Blocked Hosts

### Error Log
```text
ActionController::RoutingError:
Blocked hosts: laid-marsh-mainstream-logic.trycloudflare.com
To allow requests to these hosts, make sure they are valid hostnames, then add the following to your environment configuration:
    config.hosts << "laid-marsh-mainstream-logic.trycloudflare.com"
```

### Root Cause
Rails' `ActionDispatch::HostAuthorization` middleware rejects requests from domains and quick-tunnel hostnames that are not explicitly whitelisted in `config.hosts`.

### Solution
Updated [config/environments/development.rb](file:///Users/waptik/labs/plutonium-demo-blog/config/environments/development.rb) to dynamically load hostnames from environment variables, and configured [.env.local](file:///Users/waptik/labs/plutonium-demo-blog/.env.local) with `.trycloudflare.com`:

```ruby
# config/environments/development.rb
if (allowed_hosts = ENV["RAILS_DEVELOPMENT_HOSTS"] || ENV["ALLOWED_HOSTS"])
  config.hosts.concat(allowed_hosts.split(",").map(&:strip))
end

if (default_url = ENV["RAILS_DEFAULT_URL"])
  begin
    uri = URI.parse(default_url)
    config.hosts << uri.host if uri&.host.present?
  rescue URI::InvalidURIError
  end
end
```

```bash
# .env.local
RAILS_DEVELOPMENT_HOSTS=".trycloudflare.com"
```

---

## Issue 3: Verification Emails Dropped in Development CLI

### Problem Symptom
When running `rails rodauth:admin`, the admin accounts were saved to the database, but:
1. No email output appeared in the terminal.
2. `letter_opener` never launched a browser tab.
3. No files were written to `tmp/letter_opener/`.

### Root Cause
In [app/rodauth/admin_rodauth_plugin.rb](file:///Users/waptik/labs/plutonium-demo-blog/app/rodauth/admin_rodauth_plugin.rb), email delivery was configured via `deliver_later`:
```ruby
send_email do |email|
  db.after_commit { email.deliver_later }
end
```
In development, Rails defaults to `ActiveJob::Base.queue_adapter = :async`. Because `rails rodauth:admin` is a CLI task that exits immediately (`exit 0`), the Ruby process terminates before the in-memory background worker thread can execute `letter_opener`.

### Solution
Updated [app/rodauth/admin_rodauth_plugin.rb](file:///Users/waptik/labs/plutonium-demo-blog/app/rodauth/admin_rodauth_plugin.rb#L98-L104) to send synchronously in development:

```ruby
send_email do |email|
  db.after_commit do
    Rails.env.development? ? email.deliver_now : email.deliver_later
  end
end
```

---

## Issue 4: Portal Re-generation Wiped Out Connected Resource Routes

### Problem Symptom
After running `rails generate pu:pkg:portal admin --auth=admin --force`, navigating to `http://localhost:3000/admin` showed an empty dashboard, and `/admin/blogging/posts` returned a 404 Routing Error.

### Root Cause
The `--force` flag instructed Thor to overwrite [packages/admin_portal/config/routes.rb](file:///Users/waptik/labs/plutonium-demo-blog/packages/admin_portal/config/routes.rb) with the default portal template, which deleted the line previously added in Chapter 2:
```ruby
register_resource ::Blogging::Post
```

### Solution
Restored the resource registration inside the engine routes in [packages/admin_portal/config/routes.rb](file:///Users/waptik/labs/plutonium-demo-blog/packages/admin_portal/config/routes.rb):

```ruby
AdminPortal::Engine.routes.draw do
  root to: "dashboard#index"
  register_resource ::Blogging::Post

  # register resources above.
end

# mount our app
Rails.application.routes.draw do
  constraints Rodauth::Rails.authenticate(:admin) do
    mount AdminPortal::Engine, at: "/admin"
  end
end
```

---

## Issue 5: Login & Logout Redirecting to Public Root (`/`) Instead of `/admin`

### Problem Symptom
When an admin logged in at `/admins/login` or logged out, they were redirected to the public website home (`/`) rather than the admin dashboard (`/admin`).

### Root Cause
In [app/rodauth/admin_rodauth_plugin.rb](file:///Users/waptik/labs/plutonium-demo-blog/app/rodauth/admin_rodauth_plugin.rb), the generator defaulted redirects to the root path:
```ruby
create_account_redirect "/"
login_redirect "/"
logout_redirect "/"
```

### Solution
Updated [app/rodauth/admin_rodauth_plugin.rb](file:///Users/waptik/labs/plutonium-demo-blog/app/rodauth/admin_rodauth_plugin.rb#L197-L205):

```ruby
# Redirect to admin dashboard after login.
create_account_redirect "/admin"

# Redirect to admin dashboard after login.
login_redirect "/admin"

# Redirect to admin after logout (which directs to admin login).
logout_redirect "/admin"
```

---

## Issue 6: Migration Failure Adding `user:belongs_to` to Existing `blogging_posts` Table

### Error Log
```text
== 20260920151016 AddUserToBloggingPosts: migrating ===========================
-- add_reference(:blogging_posts, :user, {null: false, foreign_key: true})
bin/rails aborted!
StandardError: An error has occurred, this and all later migrations canceled: (StandardError)

SQLite3::ConstraintException: NOT NULL constraint failed: blogging_posts.user_id
/Users/waptik/labs/plutonium-demo-blog/db/migrate/20260920151016_add_user_to_blogging_posts.rb:3:in 'AddUserToBloggingPosts#change'

Caused by:
ActiveRecord::NotNullViolation: SQLite3::ConstraintException: NOT NULL constraint failed: blogging_posts.user_id (ActiveRecord::NotNullViolation)
/Users/waptik/labs/plutonium-demo-blog/db/migrate/20260920151016_add_user_to_blogging_posts.rb:3:in 'AddUserToBloggingPosts#change'
```

### Root Cause
The generator created `add_reference :blogging_posts, :user, null: false, foreign_key: true`. Because the `blogging_posts` table already contains 2 records created during Chapter 2 testing and there are currently no users in the `users` table, SQLite fails the `NOT NULL` constraint when trying to populate the new column with `NULL` on existing rows.

### Applied Resolution
Adopted **Option A** (nullable reference with `optional: true` on the model) and embedded code comments explaining the change relative to the faulty generator output:

1. **Migration ([db/migrate/20260920151016_add_user_to_blogging_posts.rb](file:///Users/waptik/labs/plutonium-demo-blog/db/migrate/20260920151016_add_user_to_blogging_posts.rb))**:
   ```ruby
   class AddUserToBloggingPosts < ActiveRecord::Migration[8.1]
     def change
       # Previous faulty version:
       #   add_reference :blogging_posts, :user, null: false, foreign_key: true
       # Failed with SQLite3::ConstraintException: NOT NULL constraint failed: blogging_posts.user_id
       # because existing posts from Chapter 2 testing cannot have null: false without a default or existing user.
       # Set to nullable (null: true) to allow existing posts and optional author assignment.
       add_reference :blogging_posts, :user, foreign_key: true
     end
   end
   ```

2. **Model ([packages/blogging/app/models/blogging/post.rb](file:///Users/waptik/labs/plutonium-demo-blog/packages/blogging/app/models/blogging/post.rb))**:
   ```ruby
   class Blogging::Post < Blogging::ResourceRecord
     # Previous version:
     #   belongs_to :user
     # In Rails 5+, belongs_to requires presence by default. Set optional: true so existing
     # posts from Chapter 2 without a user_id remain valid and can be updated.
     belongs_to :user, optional: true
     # ...
   end
   ```

3. **Database Preparation**:
   Ran `rails db:prepare`, which migrated successfully:
   ```text
   == 20260920151016 AddUserToBloggingPosts: migrating ===========================
   -- add_reference(:blogging_posts, :user, {foreign_key: true})
      -> 0.0385s
   == 20260920151016 AddUserToBloggingPosts: migrated (0.0386s) ==================
   ```

---

## Issue 7: Session Configuration Applied to `UserRodauthPlugin` Instead of `AdminRodauthPlugin`

### Problem Symptom
Session configuration (`verify_account_grace_period 30.days.to_i` and `password_grace_period 3600`) was inadvertently committed to `app/rodauth/user_rodauth_plugin.rb` and pushed to remote branches `develop` and `tutorial/03-authentication`, instead of being placed in `app/rodauth/admin_rodauth_plugin.rb` (where admin security features like `password_grace_period` are enabled).

### Root Cause
Misplacement of the deadlines configuration block between the two similarly structured Rodauth plugin files (`user_rodauth_plugin.rb` vs `admin_rodauth_plugin.rb`).

### Applied Resolution
1. **Reverted `app/rodauth/user_rodauth_plugin.rb`**: Restored default commented deadline settings.
2. **Updated `app/rodauth/admin_rodauth_plugin.rb`**: Applied `verify_account_grace_period 30.days.to_i` and `password_grace_period 3600` under `# ==> Deadlines`.
3. **Amended Commit**: Amended the `feat: session configuration` commit (`git commit --amend`) so `user_rodauth_plugin.rb` remained clean and only `admin_rodauth_plugin.rb` was modified.
4. **Synchronized Chapter Branch**: Pointed `tutorial/03-authentication` to the newly amended commit (`git branch -f tutorial/03-authentication develop`).
5. **Remote Push**: Force-pushed the updated history with lease (`git push --force-with-lease origin develop tutorial/03-authentication`).

---

## Issue 8: `NoMethodError: undefined method 'verify_account_grace_period'` in AdminRodauthPlugin

### Error Log
```text
NoMethodError
undefined method 'verify_account_grace_period' for #<Rodauth::Configuration:0x0000000136c7e160>
Did you mean? verify_account_redirect

Extracted source (around line #221):
220    # Session expires after 30 days
221    verify_account_grace_period 30.days.to_i
222
223    # Require re-authentication for sensitive actions
224    password_grace_period 3600

Rails.root: /Users/waptik/labs/plutonium-demo-blog
/Users/waptik/labs/plutonium-demo-blog/app/rodauth/admin_rodauth_plugin.rb:221:in 'block in <class:AdminRodauthPlugin>'
/Users/waptik/labs/plutonium-demo-blog/app/rodauth/admin_rodauth_plugin.rb:4:in '<class:AdminRodauthPlugin>'
/Users/waptik/labs/plutonium-demo-blog/app/rodauth/rodauth_app.rb:4:in '<class:RodauthApp>'
```

### Root Cause
1. **Wrong method for session expiration**: `verify_account_grace_period` governs how long an unverified user can sign in before email confirmation, NOT session expiration. It requires `:verify_account_grace_period` in the feature list (which is not loaded in `AdminRodauthPlugin`).
2. **Plutonium documentation errata**: In the official tutorial (`docs/getting-started/tutorial/03-authentication.md:241`), the example states:
   ```ruby
   # Session expires after 30 days
   session_expiration_seconds 30.days.to_i
   ```
   However, `session_expiration_seconds` does not exist in Rodauth.
3. In Rodauth's `:active_sessions` feature (which is enabled in `AdminRodauthPlugin`), the actual configuration method to set maximum session lifetime is:
   ```ruby
   session_lifetime_deadline 30.days.to_i
   ```

### Solution
Since Rodauth's `active_sessions` feature already defaults to a 30-day lifetime deadline (`86400 * 30`), there was no need to override it. We removed the invalid method and set `password_grace_period 3600`, while preserving the commented-out template options in [app/rodauth/admin_rodauth_plugin.rb](file:///Users/waptik/labs/plutonium-demo-blog/app/rodauth/admin_rodauth_plugin.rb#L218-L230):
```ruby
    # ==> Deadlines
    # Change default deadlines for some actions.
    # Require re-authentication for sensitive actions
    password_grace_period 3600

    # verify_account_grace_period 3.days.to_i
    # reset_password_deadline_interval Hash[hours: 6]
    # verify_login_change_deadline_interval Hash[days: 2]
    # remember_deadline_interval Hash[days: 30]
```


---

## Issue 9: Broken Action Permissions in Chapter 4 Tutorial (`undefined method 'published?' for class Blogging::Post`)

### Error Log
```text
NoMethodError in AdminPortal::Dashboard#index
Showing /Users/waptik/labs/plutonium-demo-blog/packages/admin_portal/app/views/admin_portal/dashboard/index.html.erb where line #10 raised:
undefined method 'published?' for class Blogging::Post

Extracted source (around line #24):
22  send(name, ...)
23  else
24  super
25  end
26  end

Rails.root: /Users/waptik/labs/plutonium-demo-blog
/Users/waptik/labs/plutonium-demo-blog/packages/blogging/app/policies/blogging/post_policy.rb:11:in 'Blogging::PostPolicy#read?'
/Users/waptik/.local/share/mise/installs/ruby/3.4.10/lib/ruby/gems/3.4.0/gems/plutonium-0.64.0/lib/plutonium/resource/policy.rb:181:in 'Plutonium::Resource::Policy#index?'
```

### Trigger
Following the tutorial instructions at [Chapter 4: Implementing Authorization (#action-permissions)](https://radioactive-labs.github.io/plutonium-core/getting-started/tutorial/04-authorization#action-permissions) and adding the prescribed snippet to [packages/blogging/app/policies/blogging/post_policy.rb](file:///Users/waptik/labs/plutonium-demo-blog/packages/blogging/app/policies/blogging/post_policy.rb):

```ruby
class Blogging::PostPolicy < Blogging::ResourcePolicy
  # Anyone can view published posts
  def read?
    record.published? || owner?
  end

  # Only the owner can edit
  def update?
    owner?
  end

  # Only the owner can delete
  def destroy?
    owner?
  end

  # Anyone authenticated can create
  def create?
    true
  end

  private

  def owner?
    record.user_id == user.id
  end
end
```

### Root Cause Analysis & Tutorial Flaws

1. **`index?` delegates directly to `read?`**:
   In Plutonium's base `ResourcePolicy` (`lib/plutonium/resource/policy.rb`):
   ```ruby
   def index?
     read?
   end

   def show?
     read?
   end
   ```
   When Plutonium renders the Admin Dashboard (`/admin/`), sidebar navigation, or the resource table, it evaluates `authorize! Blogging::Post, to: :index?`. For collection-level checks, **`record` is the Ruby Class `Blogging::Post`**, not an individual post instance. Calling instance attributes (`record.published?` or `record.user_id`) on a Class raises `NoMethodError: undefined method 'published?' for class Blogging::Post`.

2. **Conflating Action Permissions with Scope Permissions**:
   In Action Policy / Plutonium architecture:
   - **`read?` / `show?` (Action Permission)** evaluates access to a specific record instance (e.g. `/blogging/posts/42`).
   - **`relation_scope` (Scope Permission)** is the dedicated mechanism to filter which records are visible in collection listings (e.g. `relation.where(published: true).or(relation.where(user_id: user.id))`).
   The tutorial snippet attempted to handle listing visibility inside `read?` without guarding against class-level checks or separating `index?`.

3. **Portal User Identity Mismatch**:
   In the Admin Portal, `user` represents an `Admin` record (`admins` table), whereas `record.user_id` represents a `User` record (`users` table). Comparing `record.user_id == user.id` conflates two distinct Rodauth account models.

### Proper Fix / Resolution Pattern
To implement ownership and publication rules without breaking collection or class-level checks:

```ruby
class Blogging::PostPolicy < Blogging::ResourcePolicy
  # Allow viewing the resource list / dashboard widgets
  def index?
    true
  end

  # For viewing an individual post
  def read?
    return true if record.is_a?(Class) # Guard against class-level checks

    record.published? || owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def create?
    true
  end

  private

  def owner?
    return false if record.is_a?(Class)
    return true if user.is_a?(Admin) # Admins bypass ownership checks

    record.user_id == user.id
  end
end
```

---


## Pending Gotcha: Password Setting During Account Verification

In [app/rodauth/admin_rodauth_plugin.rb](file:///Users/waptik/labs/plutonium-demo-blog/app/rodauth/admin_rodauth_plugin.rb#L53):
```ruby
# verify_account_set_password? false
```
Rodauth defaults `verify_account_set_password?` to `false`. When inviting admins via CLI without an initial password, this line must be uncommented and set to `true`:
```ruby
verify_account_set_password? true
```
Otherwise, visiting the verification link verifies the email but never prompts the admin to set a password, leaving the account unable to log in.
