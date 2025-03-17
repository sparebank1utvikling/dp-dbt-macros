# DP DBT MACROS

DBT Macros for Sparebank 1 Dataplattform

## Usage
Add dependency to `package.yml` or `dependencies.yml` as described in [dbt Cloud docs](https://docs.getdbt.com/docs/collaborate/govern/project-dependencies). 


Use the `Git Packages` method as described in [dbt Cloud docs](https://docs.getdbt.com/docs/build/packages) to add the dependencie in your dbt project.

```yaml
packages:
  - git: "https://github.com/sparebank1utvikling/dp-dbt-macros.git" # git URL
    revision: 0.3.1 # tag, branch name or full commit hash
```

In addition, you have to overwrite the config in `dbt_project.yml`:

```yaml
dispatch:
  - macro_namespace: dbt
    search_order: ['dp_dbt_macros', 'dbt']
```


## Versions
This repository uses `tags` and not Github Releases. Codeowners recommend to use tag or commit hash as revsion value when referencing this repository. 

### Tags
The codeowners will create tags in relation to the [Semantic Versioning](https://semver.org/) when a new PR is merged into the `main`-branch. 

Create a new tag with git:
```bash
git checkout main
git tag <your_tag_0.1.0>
git push origin <your_tag_0.1.0>
```
