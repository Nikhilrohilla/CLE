# Week 3 – Task 2: Git Branching and Pull Request

## Objective

To understand the Git branching workflow and learn how to create a branch, commit changes, push the branch to GitHub, and open a Pull Request.

## Steps Performed

1. Updated the local main branch with the latest changes from GitHub.
2. Created a new branch named `WEEK_3-Task-2-pull-request`.
3. Created this README file on the new branch.
4. Staged and committed the changes.
5. Pushed the branch to the GitHub repository.
6. Opened a Pull Request to merge the branch into the main branch.

## Git Commands Used

```bash
git switch main
git pull origin main
git switch -c WEEK_3-Task-2-pull-request
git add WEEK_3/Task-2/README.md
git commit -m "Add Week 3 Task 2 branching documentation"
git push -u origin week3-task2-pull-request
```

## Learning Outcomes

- Understand Git branches.
- Make changes without directly modifying the main branch.
- Commit and push changes to a separate branch.
- Create and review a Pull Request on GitHub.