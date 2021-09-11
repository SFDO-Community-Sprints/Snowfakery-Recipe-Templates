# Snowfakery Recipe that Fulfills Your Purpose
Snowfakery is cool. A snowfakey recipe file generates synthetic data which then can be exported as a format of SQL, JSON, or loaded into a Salesforce org or any database accessible to SQLAlchemy. Once you have a running recipe, it can be reused cumulating the amount of data. It finds its place in the utility - tooling category. 

Snowfakery is awesome because it is formulatable. A recipe creator can generate specific data revolving around a user story with Snowfakery syntax. Snowfakery supports building a relationship between entities, referencing values created previously, concatenating data from another recipe file, expressing formula and comparison operators.

So what is a good Snowfakery recipe?
## Before Writing Snowfakery Recipe
The quality of the output is depended on your understanding of Snowfakery and defining your purposes of using Snowfakery. 

### User Story
For example, you got interested in learning Snowfakery in relationship to your upcoming project around testing newly configured Territory Management and Assignment Rules for the new Territory Model. To test the change in a sandbox org, you will need a different set of fake accounts and opportunities with a variety of Account attributes that define the new Territory Model. 
### Planning
Let's say Account's __US Region__ is the determining factor routing record ownership and team access. 
You will need:

1. A sufficient amount of Account records for each region - the Northeast, Southwest, West, Southeast, and Midwest.
2. Opportunity records at various stages, sales amount and number of records related to an account.

## While Writing Snowfakery Recipe
Write something

Link to Sample recipes and Snowfakery cheatsheet
### Comment Template
In this section, You can find an example [comment](https://en.wikipedia.org/wiki/Comment_(computer_programming)#:~:text=In%20computer%20programming%2C%20a%20comment,ignored%20by%20compilers%20and%20interpreters.) template for a Snowfakery recipe. The Data Gen team recommends annotating the purposes of the recipe and the expected outcomes. Although `yml` is human-readable, a recipe with a comment is easily maintainable and modifiable. 

This is an account recipe for example.

```yml

### ------------- [     ORDER OF INSERT    ]------------ ###
# 1-0. Account (50)
# 1-2. Opportunity (Randomized)

### ------- [ Account.recipe.yml Summary/ Expected Outcome ]------- ###
# This recipe creates a set of 50 Accounts with randomized State
# Assign 'US Region' based on Account's State
# Each account may have one or two related opportunity 
# This recipe is specifically for Region-based Territory Model
# Link to Salesforce help article if any.
# Link to external link https://en.wikipedia.org/wiki/List_of_regions_of_the_United_States

### ----------- [               CLI RUN                ]---------- ###

# cci task run generate_and_load_from_yaml --generator_yaml snowfakery_samples/salesforce/Account.recipe.yml --num_records 50 --num_records_tablename Account --org <orgName>
# snowfakery --output-format json --output-file src/foo.json snowfakery_samples/salesforce/Account.recipe.yml

### ----------- [            Recipe Starts             ]---------- ###

```

## Testing Snowfakery Recipe
Write something
### SQL Output
Once you feel confident that the business logic defined in your user story is being addressed in the finished recipe or you want to change gears from hours of building a recipe, the recipe can easily be evaluated for syntax errors by generates records ([Snowfakery CLI](https://snowfakery.readthedocs.io/en/docs/#command-line-interface)). 

`snowfakery --output-format json --output-file src/foo.json snowfakery_samples/salesforce/Account.recipe.yml`
### Load Data to Salesforce Org
Write something

`cci task run generate_and_load_from_yaml --generator_yaml ssnowfakery_samples/salesforce/Account.recipe.yml --num_records 50 --num_records_tablename Account --org <orgName>`
### Compare Recipe's Output to Your User Story 
Write something
