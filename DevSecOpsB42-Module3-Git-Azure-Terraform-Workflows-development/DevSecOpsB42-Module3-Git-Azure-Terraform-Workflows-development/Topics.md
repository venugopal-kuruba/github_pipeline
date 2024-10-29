# Topics Sequence

### Class 1 - APRIL 20th
1. Providers.    
2. Resource vs Data source.  
3. Resource creation syntax.  
4. Implicit Dependency between RG, vNET, Subnet.  
5. Statefile.  
6. Explicit Dependency using Subnets & Storage Account.  
7. Listing resources using terraform state list.  
8. Removing a resource from statefile using terraform state tm.  
9. Moving storage account to a diffrent RG from portal.
10. Configuring Azure Storage Account as backend and migrate state.
11. Generating Random Passwords and test parallelism which is default 10.
12. Understanding why we dont keep statefile in git repos.

### Class 2 - APRIL 21st
1. Understanding feature branches.  
2. Declaring Variables and using tfvars file.  
3. Raising PR and adding reviewers, reqeustin for PR changes and approving PR.  
4. Merging code remortly by approving the PR.  
5. Local merging between the branches.
6. Understaning Terraform State locking using Storage Account Lease.
7. Understanding git conflicts and resolving them.
8. Deleting commits using git reset.
   - hard => git reset --hard f437c1f (or) git reset --hard HEAD~2
   - soft => git reset --soft ddf3f80 (or) git reset --soft HEAD~3
   - mixed(default) => git reset --mixed e742f44 (or) git reset HEAD~3
   for I in {1..10}; do echo "MASTER-COMMIT-$I" > FILE-$I; git add . && git commit -m "MASTER-COMMIT-$I"; sleep 1; done
9. Reverting using git revert
10. TF_LOG & TF_LOG_PATH
    - TRACE - High Verbosity
    - DEBUG
    - INFO
    - WARN
    - ERROR
$Env:TF_LOG="TRACE" or export TF_LOG="TRACE"
$Env:TF_LOG_PATH='C:\SUREDELETELATER\DevSecOpsB40\3.Git-Terraform-Azure\TF.log'

11. Git Interactive Rebase for deleting individual commits
    git rebase -i 2c2d165 (or) git rebase -i HEAD~6
12. Git Force Push
13. Change default branch in GitHub.

# Class 3:
1. git clone -b <branch_name> --single-branch 
2. Git Reflog and restore deleted branches.
3. Git Stash & Pop
4. Git Cherry-Pick
5. Using Azure Provider Alias to deploy in diffrent subscriptions.
6. Deploy Linux VM using Terraform as part of Cherry-Pick testing

# Class 4:
1. Git Fetch vs Pull(Fetch and Merge)
2. Git Merge(NonDestructive) & Rebase(The golden rule of git rebase is to never use it on 
   public branches).
3. Git Large File Storage(lfs)
   - git lfs install
   - git lfs track "*.exe" && git add . && git commit -m "Data" && git push origin master
   - git lfs pull (If normal git pull is not downloding the files)
3. Git hooks - Pre-Commit and Post-Commit
4. Git Secrets to scan secrets using pre-commit hook.

# Class 5:
4. Git Fork vs Clone
   A fork is a copy of a repository. Forking a repository allows you to freely experiment with changes without affecting the original project. 

5. Git Branching Strategies:
   - Git Flow => Master, Developement, Hotfix-*, Release-*, Featuer-*
   - GitHub Flow => Master and feature/hotfix branches. No Support branches.
   - GitLab Flow => Development, Pre-Production, Production.
   - Trunk Based Development => Merge directly to master with feature falgs & toggle    
     switching.
   - https://www.bmc.com/blogs/devops-branching-strategies/
5. Understanding GitHub Workflows or Pipeline.
6. Creating a GitHub Workflow Pipeline.


