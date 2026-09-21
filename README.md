# Plutonium Demo Blog

A demo Rails blog application exploring the [Plutonium](https://radioactive-labs.github.io/plutonium-core/) rapid application development framework, following the official [Building a Blog Tutorial](https://radioactive-labs.github.io/plutonium-core/getting-started/tutorial/).

---

## 📌 Progress & Branch Map

Active development was conducted on `develop`, with milestone branches preserved for each chapter:

| Chapter | Branch | Status | Notes |
|---------|--------|--------|-------|
| **Baseline & Setup** | `main` | ✅ Completed | Clean pre-tutorial baseline with tooling and dependencies. |
| **Chapter 1: Setup** | `develop` | ✅ Completed | Initial Rails app and Plutonium engine setup. |
| **Chapter 2: First Resource** | `tutorial/02-first-resource` | ✅ Completed | `Blogging` package, `Post` scaffold, and public `admin_portal`. |
| **Chapter 3: Authentication** | `tutorial/03-authentication` | ✅ Completed | Rodauth setup (`Admin` with 2FA/audit logs, `User` self-service), gated portal, session policies. |
| **Chapter 4: Authorization** | `tutorial/04-authorization` | 🛑 Paused | Action permissions added to `Blogging::PostPolicy`. |

---

## 🛑 Why the Tutorial Was Paused

Work on this tutorial is paused at Chapter 4 due to significant documentation errata, conceptual discrepancies, and generator bugs in the current version of the framework (`plutonium-0.64.0`):

1. **Broken Policy Snippet in Chapter 4 ([Action Permissions](https://radioactive-labs.github.io/plutonium-core/getting-started/tutorial/04-authorization#action-permissions))**:
   - The tutorial instructs implementing `read?` as `record.published? || owner?`.
   - In Plutonium's core `ResourcePolicy`, collection listing (`index?`) delegates directly to `read?`, passing the **Model Class** (`Blogging::Post`) rather than a model instance.
   - This immediately crashes the admin dashboard and sidebar navigation with:
     ```text
     NoMethodError: undefined method 'published?' for class Blogging::Post
     ```
   - It also conflates Action Permissions (`read?` / `show?`) with Scope Permissions (`relation_scope`), while comparing incompatible account identities (`Admin` vs `User`).

2. **Non-Existent Rodauth Methods in Chapter 3 ([Session Configuration](https://radioactive-labs.github.io/plutonium-core/getting-started/tutorial/03-authentication#session-configuration))**:
   - The tutorial provides sample code calling `session_expiration_seconds 30.days.to_i`.
   - This method does not exist anywhere in Rodauth or Plutonium (resulting in `NoMethodError`), as Rodauth's active sessions feature actually uses `session_lifetime_deadline` (which defaults to 30 days anyway).

3. **Generator Rollback Failure**:
   - Running `rails destroy pu:rodauth:admin admin` crashes with an unhandled `LoadError` because the generator attempts to constantize the model after deleting `app/models/admin.rb`.

4. **Destructive Portal Re-generation**:
   - Following the tutorial's instruction to re-run `rails generate pu:pkg:portal admin --auth=admin --force` silently overwrites `routes.rb`, wiping out previously registered resources (`register_resource ::Blogging::Post`) and causing 404s.

5. **Dropped CLI Mail Delivery in Development**:
   - Generated Rodauth plugins wrap email dispatch in `db.after_commit { email.deliver_later }`. With Rails' default `:async` ActiveJob adapter, CLI tasks like `rails rodauth:admin` exit before background threads can write or open verification emails.

Detailed logs, reproduction steps, root cause analyses, and solutions for all 9 encountered issues are documented in [`docs/manual_fixes_log.md`](docs/manual_fixes_log.md).

We may revisit this tutorial once Plutonium releases updated documentation and patches for these edge cases.
