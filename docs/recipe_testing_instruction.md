# Snowfakery Recipe that Fulfills Your Purpose
Snowfakery is cool. A snowfakey recipe file generates synthetic data which then can be exported as a format of SQL, JSON, or loaded into a Salesforce org or any database accessible to SQLAlchemy. Once you have a running recipe, it can be rerun multiple times to accumulate data. It finds its place in the utility - tooling category. 

Snowfakery is awesome because it is formulatable. A recipe creator can generate specific data revolving around a user story with Snowfakery syntax. Snowfakery supports building a relationship between entities, referencing values created previously, concatenating data from another recipe file, expressing formula and comparison operators.

So what is a good Snowfakery recipe?
## Before Writing Snowfakery Recipe
The quality of the output is depended on your understanding of Snowfakery and defining your purposes of using Snowfakery. 

### User Story
For example, you got interested in learning Snowfakery in relationship to your upcoming project around testing newly configured Territory Management and Assignment Rules for your org's new Territory Model. To test the change, you will need different sets of fake accounts and related opportunities that pair with Account attributes defined in new territories.
### Planning
Let's say Account's __US Region__ is the determining factor routing record ownership and team access. 
You will need:

1. A sufficient amount of Account records for each region - the Northeast, Southwest, West, Southeast, and Midwest.
2. Opportunity records at various stages, sales amount and number of records related to an account.

## While Writing Snowfakery Recipe
See if you can translate your user story and the requirements with Snowfakery. Please utilize [Snowfakery documentation](https://snowfakery.readthedocs.io/en/docs/), [sample recipes](snowfakery_samples), and syntax cheatsheet(coming soon). The recipe writing process may feel like learning a fairy language, but we provide a method to preview data created from your Snowfakey recipe in the [Review Output](#reviewoutput) section.

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

## <a id="reviewoutput"></a> Review Output
Once you feel confident that the business logic defined in your user story is being addressed in the finished recipe or you want to change gears from hours of building a recipe, the recipe can easily be evaluated for syntax errors by generating an output file ([Snowfakery CLI](https://snowfakery.readthedocs.io/en/docs/#command-line-interface)). 

Execute this command in terminal and find the json output in the `src` folder:

```
$ snowfakery --output-format json --output-file src/foo.json <relative_path_to_your_recipe_file> 
```
It is important to review the output locally and fix all the errors before laoding data to an org.
### Load Data to Org (sandbox, dev, or scratch org)
Loading data into a Salesforce org can be tricky. If you encountered errors while loading data to an org via API, the same exact errors can cause the `cci task run generate_and_load_from_yaml` command to fail. The errors can be caused by system and custom validations, a wrong order of sObject inserts, invalid metadata, invalid date/time format, or a custom configuration that doesn't fit the recipe scenario. Review the logs to resolve the error case by case.

Execute this command in terminal and open the target org to confirm the successful load:

```
$ cci task run generate_and_load_from_yaml --generator_yaml <relative_path_to_your_recipe_file> --num_records 50 --num_records_tablename Account --org <orgName>`

$ cci org browser <orgName>
```
### Compare Recipe's Output to Your User Story 
Once the data is loaded, you can review for an inconsitent pattern in the populated data or any missing scenario that you or Snowfakery's out-of-box radomization may have missed. For example, your recipe randomize __State__ for 100 accounts. This doesn't quarantee that Snowfakery will populate 51 states. Consider assigning random weight to each value.

```
sfdx force:source:retrieve -m Settings:Territory2 -u production

```
### Advanced Auditing Processes (coming soon)
- Generate a report from the output
- Generate a pivot table from the csv output
- Use cci robot framework to automate the validation
