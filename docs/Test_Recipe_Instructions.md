# Snowfakery Recipe that Fulfills Your Purpose
Snowfakery is cool. A Snowfakey recipe file generates synthetic data, which can be exported as a format of SQL, JSON, or loaded into a Salesforce org or any database accessible to SQLAlchemy. Once you have a running recipe, it can be rerun multiple times to accumulate data. It finds its place in the utility - tooling category.

Snowfakery is awesome because it is formulatable. A recipe creator can generate specific data revolving around a user story with Snowfakery syntax. Snowfakery supports building a relationship between entities, referencing values created at runtime, concatenating data from another recipe file, expressing formula and comparison operators.

So what is a good Snowfakery recipe?
## Before Writing Snowfakery Recipe
The quality of the output is depended on your understanding of Snowfakery and defining your purposes of using Snowfakery.

### User Story
For example, you got interested in learning Snowfakery related to your upcoming project - rollout Enterprise Territory Management. You have been looking for a way to test and validate the newly designed Territory Model and assignment rules. Snowfakery is a perfect tool to generate different randomized bulk sets of fake accounts and related opportunities, that you can quickly validate territory assignment rules defined based on Account attributes.
### Planning
Let's say Account's __US Region__ is the determining factor routing record ownership and team access. 
You will need:

1. A sufficient amount of Account records for each region - the Northeast, East, West, South, and Midwest.
2. Opportunity records at various stages, sales amounts, and randomize number of opportunities related to an account.

## While Writing Snowfakery Recipe
See if you can translate your user story and the requirements with Snowfakery. Please utilize [Snowfakery documentation](https://snowfakery.readthedocs.io/en/docs/), [sample recipes](snowfakery_samples), and syntax cheatsheet(coming soon). The recipe writing process may feel like learning a fairy language, but Snowfakery provides a method to preview data created from your Snowfakey recipe in the [Review Output](#reviewoutput) section.
### Comment Template
In this section, You can find an example [comment](https://en.wikipedia.org/wiki/Comment_(computer_programming)#:~:text=In%20computer%20programming%2C%20a%20comment,ignored%20by%20compilers%20and%20interpreters.) template for a Snowfakery recipe. The Data Gen team recommends annotating the purposes of the recipe and the expected outcomes. Although YML is human-readable, a recipe with thoughtful comments is easily maintainable and mutable.
These are example comment types for a recipe 

This is an account recipe for example.

```yml

### ------------- [     ORDER OF INSERT    ]------------ ###
# 1-0. Account (50)
# 1-2. Opportunity (Randomized)

### ------- [ Account.recipe.yml Summary/ Expected Outcome ]------- ###
# This recipe creates a set of 500 Accounts with randomized state abbreviations
# Assign 'US Region' based on Account's State
# Each account may have one or two related opportunity 
# This recipe is specifically for Region-based Territory Model
# Link to Salesforce help article if any.
# Comment on any dependency (ex. enable Enterprise Territory Management)
# Link to external link https://en.wikipedia.org/wiki/List_of_regions_of_the_United_States

### ----------- [               CLI RUN                ]---------- ###

# cci task run generate_and_load_from_yaml --generator_yaml snowfakery_samples/salesforce/Account.recipe.yml --num_records 500 --num_records_tablename Account --org <orgName>
# snowfakery --output-format json --output-file src/foo.json snowfakery_samples/salesforce/Account.recipe.yml

### ----------- [            Recipe Starts             ]---------- ###

```

## Testing Snowfakery Recipe
Validating a recipe can be daunting if you are new to YAML. The first step is making sure that there are no errors on Snowfakery syntax or YAML format. The red squiggle line under the text indicates that there is something wrong. Review the error from the PROBLEMS tab in the Command Palette.

## <a id="reviewoutput"></a> Review Output
Once you feel confident that your recipe is ready to test, or you want to change gears from hours of building a recipe, you can evaluate syntax errors and populated data by generating an output file ([Snowfakery CLI](https://snowfakery.readthedocs.io/en/docs/#command-line-interface)). 

At this stage, you review for any Snowfakery runtime errors.

Execute this command in terminal and find the json output in the `src` folder:

```
$ snowfakery --output-format json --output-file src/foo.json <relative_path_to_your_recipe_file> 
```
It is important to review the output locally and fix all the errors before laoding data to an org.
### Load Data to Org (sandbox or developer org)
Loading data into a Salesforce org can be tricky. If you encountered errors while loading data to an org via API, the same errors can cause the `cci task run generate_and_load_from_yaml` command to fail. The load failure can be caused by system or custom validations, wrong order of sObject inserts, invalid metadata, invalid date/time format, a custom configuration that doesn't fit the recipe scenario or missing metadata dependency. Review the log to resolve the error case by case.

Execute this command in terminal and open the target org to confirm the successful load:

```
$ cci task run generate_and_load_from_yaml --generator_yaml <relative_path_to_your_recipe_file> --num_records 50 --num_records_tablename Account --org <orgName>`

$ cci org browser <orgName>
```
### Load Data to a Scratch Org
If a scratch org is your testing environment, it is pertinent to configure the scratch of definitions and add any metadata dependency to your project directory. Let's use Enterprise Territory Management as an example.

Scratch org setting defined for Enterprise Territory Management

<img width="265" alt="Scratch org Settings" src="https://user-images.githubusercontent.com/33381679/137429168-8adc5896-6228-4aa5-805f-100e42e11ab8.png">

Metadata dependency is added in the `force-app` directory for the new Territory Model and configuration setting

<img width="244" alt="metadata" src="https://user-images.githubusercontent.com/33381679/137429002-5ff5550e-4230-4cbf-9400-5a092a435763.png">


### Compare Recipe's Output to Your User Story 
Once the data is loaded, you can review for an inconsistent pattern in the populated data or any missing scenario that you or Snowfakery's out-of-box randomization may have missed. For example, your recipe randomizes states for 100 accounts. It doesn't guarantee that Snowfakery will populate all 51 states. Consider assigning random weight to each value.

Open the target org and see if data is loaded correctly.
<img width="1346" alt="Validate through UI" src="https://user-images.githubusercontent.com/33381679/137428183-4e1a3700-38c5-47ef-9699-3416819b2d86.png">

### Advanced Auditing Processes (coming soon)
- Generate a report from the output
- Generate a pivot table from the csv output
- Use cci robot framework to automate the validation
- Use Github Actions for CCI
