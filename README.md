# Snowfakery Recipe Templates

<img src="https://raw.githubusercontent.com/SFDO-Community-Sprints/DataGenerationToolkit/master/Assets/DataGenerationLogoFinal051320.png" width=300px/>

> [Snowfakery](https://snowfakery.readthedocs.io/en/docs/) Recipe Templates repository showcases all contributed Snowfakery recipes by volunteers from numerous SFDC Community Sprints. All the recipes are under the [BSD 3-Clause License](https://github.com/SFDO-Community-Sprints/Snowfakery-Recipe-Templates/blob/main/LICENSE) and are maintained by [Data Gen Toolkit](https://github.com/SFDO-Community-Sprints/DataGenerationToolkit) team.

## Snowfakery Use Cases

1. You can use Snowfakery to seed synthetic data into a sandbox or a scratch org.
2. You can generate synthetic data for standard objects, custom objects and custom objects for managed packages.
3. You can generate synthetic data and output as SQL or CSV file or load directly to a target Salesforce org using CCI.
4. Snowfakery also supports seeding files as [ContentVersions](https://snowfakery.readthedocs.io/en/docs/salesforce.html#contentversions) using standard plugins.
5. You can [query](https://snowfakery.readthedocs.io/en/docs/salesforce.html#incorporating-information-from-salesforce) existing Salesforce data and relate to snowfakery recipe.
6. The usage of Snowfakery is not limited to NPSP nor EDA; however, Data Gen Toolkit team develops resources to advocate nonprofits and education community.
## Tooling
### Tools for Participating
Most people who participate in this project have access to [VS Code](https://code.visualstudio.com/Download).

This project is not installable.

We have orgs ready for you to use during a sprint. You can request access in Slack in the snowfakery-recipe-makers channel.

We keep track of next steps in GitHub in the [Issues tab](https://github.com/SFDO-Community-Sprints/Snowfakery-Recipe-Templates/issues)


### Tools for Contributing
The items checked below are needed to actively contribute to the project.
[Find more details about these tools](https://sfdo-community-sprints.github.io/docs/tools/)
- [X] GitHub
- [ ] Metecho
- [X] CumulusCI
- [ ] Google Drive (not needed, but we do have a folder. Ask for access in Slack in the snowfakery-recipe-makers channel.)

## Development

Multiple steps are required to set up a development-ready environment in your local machine. After completing the initial setup, the snowfakery recipes in the repository can be utilized for loading data to a scratch org.

### Installation

1. Install [Visual Studio Code](https://code.visualstudio.com/)
2. Install [SFDX extension for VSC](https://developer.salesforce.com/tools/vscode/)
3. Install [Git](https://git-scm.com/downloads)
4. Install [CumulusCI](https://cumulusci.readthedocs.io/en/latest/get_started.html)
5. (optional) [CumulusCI extension for VSC](https://marketplace.visualstudio.com/items?itemName=CumulusCI.cci)

### Setup

**Salesforce Environment**

- Setup [DevHub](https://trailhead.salesforce.com/content/learn/modules/cumulusci-setup/set-up-your-salesforce-environment)

**CumulusCI**

- Clone this repository into your local directory

```cli
$ git clone https://github.com/SFDO-Community-Sprints/Snowfakery-Recipe-Templates.git
```

- [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/get_started.html) : this repository includes a project initialization in cumulusci.yml file. You can skip the project initialization `cci project init`

### Set up the right flavor of scratch org
If you want to use a scratch org to play with Snowfakery recipes in this repository, you may want to install NPSP, EDA, Outbound Funds (OBF), or Program Management Module (PMM) as well.
- For EDA recipes, run `cci org scratch eda eda --default` to create a new scratch org and set it as a default
  - **Install EDA** Run `cci flow run eda_scratch --org eda`
    - Optional for EDA orgs: **Install Advisor Link** Run `cci flow run sal_eda_scratch --org eda`
- For NPSP, OBF, or PMM recipes, run `cci org scratch dev dev --default` to create a new scratch org and set it as a default
  - **Install NPSP** Run `cci flow run npsp:install_prod --org dev`
  - **Install OBF** Run `cci flow run obf_scratch --org dev`
    - Optional for OBF orgs: **Install NPSP** Run `cci flow run obf_npsp_scratch --org dev`
  - **Install PMM** Run `cci flow run pmm_scratch --org dev`
    - Optional for PMM orgs: **Install NPSP** Run `cci flow run npsp_scratch --org dev`
- For Education Cloud recipes, run `cci org scratch edc edc --default; cci org browser` to create a new scratch org, set it as default, and open it. No further installs are required, but education cloud may require additional setup.

### Instructions for the Collaborators

There are several open issues suggesting new recipes we need and fixes to existing recipes. We also welcome contributions of new recipes we haven't though of yet.

- Please test your contribution carefully.
- Follow the project [naming conventions](docs/Naming_Conventions.md) when adding your file(s).
- Create a pull request that explains what recipe you are adding/changing, and include any special testing instructions we should know about.

## Snowfakery CLI

Most of our work in this repo is around creating recipes for use directly within Salesforce, so the final work should make sense within a Salesforce context. That said, Snowfakery has its own CLI that can output a file of data instead of adding it to Salesforce.

```
# To view the list of options for running a snowfakery recipe file
# https://snowfakery.readthedocs.io/en/docs/#command-line-interface

$ snowfakery --help
```

- Output as a comma-separated csv file.

```
# snowfakery
# --output-format [png|svg|svgz|jpeg|jpg|ps|dot|json|txt|csv|sql]
# --output-file <fileName.extension>
# <Relative path to a recipe yml file>

$ snowfakery --output-format json --output-file src/foo.json snowfakery_samples/npsp/RD_npsp.recipe.yml
```

- Snowfakery Cheatsheet (link coming soon)

## Additional Useful References

- [Project Meeting Notes](https://github.com/SFDO-Community-Sprints/DataGenerationToolkit/wiki).
- [Snowfakery](https://github.com/SFDO-Tooling/Snowfakery)
  - [Main Docs](https://snowfakery.readthedocs.io/en/docs/)
  - [Paul's SF Architechs blog on snowfakery](https://medium.com/salesforce-architects/generate-realistic-datasets-with-snowfakery-5349225b033d)
  - [Snowfakery SF Examples](https://github.com/SFDO-Tooling/Snowfakery/tree/master/examples)
  - [Aaron’s Noodling on a recipe editor (not currently functional)](https://github.com/acrosman/snowmakery)
  - [Aarons blog post about generating NPSP Data](https://spinningcode.org/2020/11/generate-sample-data-for-salesforce-npsp/)
  - [Samantha's Blog post about using Snowfakery](https://thedataarealright.blog/2021/01/15/snowfakery-till-you-makery/)
- [Fellow Developers, What Should Our Last Name Be?](https://dev.to/roygreenfeld/fellow-developers-what-should-our-last-name-be-cle)
- [Data Management with CumulusCI Trailhead](https://trailhead.salesforce.com/en/content/learn/modules/data-management-with-cumulusci?trail_id=build-applications-with-cumulusci)
- [Data Generation Toolkit project on Power of Us Hub](https://powerofus.force.com/s/group/0F91E000000brOoSAI/community-project-data-generation)
- [Smart Sandbox](https://www.smartsandbox.com/index.html): their website is still up but no longer active
- [Faker Documentation](https://faker.readthedocs.io/en/master/)
- [NPSP Data Dictionary](https://attain-projects.quip.com/yD1wAsdz1m1Q/NPSP-Public-Data-Dictionary)
- [Wave Data Generator](https://github.com/ttse-sfdc/sfdc-wave-data-generator) (generates data for Salesforce org, and builds linkages between objects)
- [JSON/YAML Editor](https://json-editor.github.io/json-editor/)
