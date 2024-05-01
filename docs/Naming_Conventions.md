---
title: Naming Conventions
parent: Home
nav_order: 6
has_children: false
---
# Recipe Project Naming Conventions

This naming convention is intended to encourage clarity and consistency. Getting good recipes into the collection is more important than adhering perfectly to a set of rules. However, it is helpful to have a set of guidelines to give everyone a clear path to follow.

## Directory Structure

The main project should have directories named `docs`, `orgs`, and `samples`.

- All recipes should be in sub-directories of that directory
- All documentation (other than the main ReadMe file) should be in the docs directory
- All Org definitions for CCI should be in the orgs directory

The subdirectories of samples should use the common acronym for a project (e.g. `npsp`, `eda`) or the full name of the project in [snake_case](https://en.wikipedia.org/wiki/Snake_case) when there is no clear community understood acronym (e.g. `outbound_funds`).

## Recipe File Names

Recipe file names should be in snake_case, and clearly define the purpose of the recipe, and should end with `recipe.yml`.

- A simple recipe that just generates one or two objects can simply list the object names: `Accounts_Contacts.recipe.yml`
- A recipe that is supporting a specific scenario with those objects should include a purpose: `Account_Contacts_Internationalization.recipe.yml`
- A recipe that is supporting a more complex scenario including several objects should be focused on the purpose of the scenario: `Recurring_Donations.recipe.yml`

Because recipes should be located in a subdirectory named for the product they are meant to support the file name should not contain a reference to the product.

## Documentation File Names

There should be one project `Readme.md` in the project root. All other documentation should be included in markdown format in the docs directory. Files should be named in snake_case. For recipe instructions, they should indicate the product name and finish with the word "instructions" (e.g. `EDA_Setup_Instructions.md`). Any images or other assets needing for the documentation should be placed in the assets directory in the docs directory.
