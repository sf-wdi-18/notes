# Alternate GitHub Workflow for Tracked Contributions
Our default GitHub workflow doesn't result in many tracked contributions for students. This alternate workflow will make sure your your contributions are tracked.

##Default Workflow Drawback  
**Why aren't your contributions being tracked?**  
[Here's GitHub's help page on the topic.](https://help.github.com/articles/why-are-my-contributions-not-showing-up-on-my-profile/)    It lists three common reasons commits aren't tracked:    
1. You haven't added your local Git commit email to your profile.  
2. Commit was not made in the default or gh-pages branch.  
3. Commit was made in a fork.   

Our default workflow almost always has students forking from one of the repos on the class GitHub account! (Note: if you haven't added your email to your profile, follow the instructions on the help page.)

##Alternate Workflow   
Please follow these steps very carefully.    

1. Instead of forking a repository from the class GitHub account, clone it directly from the class repo to your machine.
  ```
  
  git clone https://github.com/sf-wdi-18/example-repo.git
  
  ```
2. Go to your GitHub account page and create an empty repo with the same name as the repo you cloned.    
  (If you'd like to use a different name for your repo, give `git clone` an alternate name in step 1. For example,  `git clone https://github.com/sf-wdi-18/example-repo.git your-repo-name`. Then use `your-repo-name` name when you create the empty repo on your GitHub account.)

3. Copy the clone url from the new empty repo on your GitHub account. It should look something like 
`https://github.com/your-account-name/example-repo.git`.     

4. On your local repo, change the remote origin to be the new repo you created on *your* GitHub account with the `set-url` command. Paste the url from step 3 in, like below:   
  ```
  
  git remote set-url origin https://github.com/your-account-name/example-repo.git
  
  ```   
5. You can see that it worked by looking at `git remote -v`. The `origin` url should be *your* GitHub repo now.

6. Do your work in your local repo, using `git add` and `git commit -m "my commit message"` as needed.   

7. Now, if you use `git push origin master`, it will push to *your* `example-repo`, and you'll get tracked commits! So `git push origin master`!   

8. Submit the link to the `example-repo` on your GitHub account.   


