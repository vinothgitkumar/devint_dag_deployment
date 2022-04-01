Dev-Integration Branching Strategy
    Pull every changes of dev-int branch before commiting feature branches.
    Merging dev-int to staging should be via PR, no direct merges allowed.
    Once production branch created, the prod deployment workflow needs to be triggered manually.
    Short lived production will be deleted once the production branch is merged with main branch.

dag_deployment_dev-int.yml
    This workflow will be triggered whenever the code merge happened in the dev-int branch.
    It contains actions to deploy DAGs in Astro dev workspace.

dag_deployment_stg.yml
    This workflow will be triggered when code merge happened in the staging branch and contains actions for,
        1. DAG deployment in Astro staging workspace and waiting for production branch creation approval.
        2. Once approved then create new tag with increament of 0.1 (if previous tag is 1.5 then after increament would be 1.6)
        3. Create new short lived production branch

dag_deployment_prod.yml
    This workflow needs to be triggered manually whenever we planned the prod deployment.

prod_branch_cleanup.yml
    This will be triggered once the code merge happened in main branch and deletes the short lived production branch.