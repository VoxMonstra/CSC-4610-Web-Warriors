# Helpful commands

## Git

Delete branch locally:

```bash
git branch -d <branch-name>
```

Push delete branch to remote:

```bash
git push -d --set-upstream origin <branch-name>
```

Create and switch to new branch locally:

```bash
git checkout -b <branch-name>
```

Push create branch to remote:

```bash
git push --set-upstream origin <branch-name>
```

Pull from remote for all local branches:

```bash
for branch in $(git branch | sed 's/^\*//'); do
    git checkout "$branch"
    git pull
done
```

Create local branches from all remote branches:

```bash
# Fetch updates from all remotes
git fetch --all

# Loop through each remote branch, excluding HEAD references
for remote in $(git branch -r | grep -v 'HEAD'); do
    # Remove the remote prefix (e.g., origin/)
    branch=${remote#origin/}
    
    # Check if the local branch already exists
    if git show-ref --verify --quiet refs/heads/"$branch"; then
        git checkout "$branch"
        git pull
    else
        git checkout -b "$branch" "$remote"
    fi
done
```
