sudo apt update
sudo apt install git
git --version

# or we can do it this way
sudo apt-get install git-all
git version

# generate ssh key: we can choose the encription algorithm with -t flag, the lenght of the key in bytes with -b, we have to pass a codification phrase with -C it's recommended to use the email we will be using in the github account or any SCM (Source Code  Manager) it's recomended to use ed25519 algorithm for better security
ssh-keygen -t ed25519 -C "myemail@mail.com"
ssh-keygen -t rsa -b 4096 -C "my@email.com"
# we can choose a custom path or accept the default by pressing "Enter" and it will create a file in which it will save the key by default "~/.ssh/id_ed25519" this is the private key
# after that we have to set a passphrase for the key

# initialize ssh agent
eval "$(ssh-agent -s)"
eval $(ssh-agent -s)
#it will show the agent pid (process id) which means the agent is being executed

# now we add our ssh-key to the ssh-agent
ssh-add ~/.ssh/id_ed25519

# we retrieve our public key fingerprint and copy to the clipboard
cat ~/.ssh/id_ed25519.pub
# it is recommended to use xclip to manage sensitive data
sudo apt install xclip
xclip -selection clipboard < ~/.ssh/id_rsa.pub

# with our github session active, go to settings>access>ssh and gpg keys>new ssh key
# we choose a descriptive title for the key that helps us know in which device it's being stored, it can include the os, pc model, pc brand
# finally we paste our key fingerprint and click on "add ssh key"

# we have to go to the directory where our project is located to initialize a repository there
"cd ~/MyProject"
#once we are inside our directory we type the following command, it will create a directory called ".git" and initialize the repository there
git init
# we can get a status of the repository
git status
# untracked file: a file that was created before the initializing of the repository, we have to manually add this files to the stage area if we want to track them in the commits
git add my_file.py
# alternatively we can add the entire directory to the stage area
git add .
# adds all the files named goku no matter wich extension they are (goku.txt, goku.py, goku.js)
git add goku.*
# to stop tracking a file and remove it from the stage area we use
git rm --cached my_file.py
# we have to identify ourselves first, we have to have the same email in our local git config file and in github
git config --global user.email "myemail@mail.com"
git config --global user.name "my_name"
# to check if we configured right
git config --list
# if we typed it wrong we can change it
git config --global --replace-all user.email “thenew@email”
git --config --edit --global
# git commit: is the way we notify git that we have made some changes to the files in the repository, this creates a version of our project, the -m flag is for adding a message, we can pass some text to identify the changes in that commit. when we want to send this repository to github we have to do a commit so github can recognize the changes inside it,
git commit -m "my first commit dude, be descriptive with your commits so other devs can understand better"

# if we wan to send this commit to a SCM, in this case github, we go to "your repositories>new", write the name of our repository, set to public or private, add a description amongs other options and click on "create repository"
# select ssh from the "https/ssh" options and copy the text in "quick setup" guide git@github.com:user/my_project.git

# git log: to see the commits we have done in the repository
git log
# we have to connect our local repository with the SCM by passing the text we copied from the quick setup guide to the command git remote, all this has to be done while we are inside the directory of the repository
git remote add origin git@github.com:user/my_project.git
# if we have problems with the host key verification we can try to authorize github as a host
ssh-keyscan -t rsa github. com >> ~/.ssh/known_hosts
# we can remove the host
git remote rm origin
# the principal branch used to be named "master" but now the convention is to name it "main"
git branch -M main
# we verify the remote connection with the SCM
git remote -v
# finally to send the local repository we do a "push" using the name of the branch, typical names for the initial branch are "main", "master", "trunk", "development"
git push origin main
git push -u origin main
# when we modify one or more files and want to update the SCM we verify with git status, then stageing by adding them to be tracked and finally doing a commit and push again to the SCM
git status
git add .
git status
git commit -m "my second commit"
git push origin main

# if you mistype a Git command you can automatically run the suggested fix, the suggested command will run after a short delay to give you the chance to cancel the command if it is not what you intended. The length of the delay is defined by the value in integer that represent a tenth of a second. The --global flag enables it for all your local Git repositories, if you only want it enabled on a specific repository just omit this flag
git config --global help.autocorrect 20

# git comes with GUI interface
gitk
git gui

# we can give an alias to any command
git config --global alias.kimberly status --short
git kimberly
git config --global alias.lg=log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
git lg

# https://www.yubico.com/

# https://www.geeksforgeeks.org/difference-between-private-key-and-public-key/

# https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_code_help_autocorrect_code

# https://github.com/

# https://git-scm.com/downloads/guis

# https://git-scm.com/docs/git-log

# https://www.geeksforgeeks.org/difference-between-private-key-and-public-key/

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# https://docs.github.com/es/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

# https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits

# https://code.visualstudio.com/docs/sourcecontrol/overview
