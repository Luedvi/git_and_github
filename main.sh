# we can get some help with this commands
git
git help

# git init: This command creates an empty Git repository, basically a ".git" directory with subdirectories for objects, refs/heads, refs/tags, and template files. An initial branch without any commits will be created. We execute this command inside the directory that we want to create the repository
git init
# If you provide a directory, the command is run inside it. If this directory does not exist, it will be created
git init directory_name

# git add: we have to add any file that we want to keep track of the changes. They get added to the staging area. After we made some changes to the files of the repository we have to add the files again. Updates the index using the current content found in the working tree, to prepare the content staged for the next commit.
git add file_name1 ./file_name2
git add . # we can add all the files at once
# -i, --interactive: Add modified contents in the working tree interactively to the index. Optional path arguments may be supplied to limit operation to a subset of the working tree
git add -i
git add --interactive file_name
# -p, --patch: Interactively choose hunks of patch between the index and the work tree and add them to the index. This gives the user a chance to review the difference before adding modified contents to the index.
git add -p
git add --patch
# -e, --edit: Open the diff vs. the index in an editor and let the user edit it. After the editor was closed, adjust the hunk headers and apply the patch to the index.
git add -e
git add --edit
# -u, --update: Update the index just where it already has an entry matching <pathspec>. This removes as well as modifies index entries to match the working tree, but adds no new files. If no <pathspec> is given when -u option is used, all tracked files in the entire working tree are updated
git add -u file_name
git add --update
# -A, --all, --no-ignore-removal: Update the index not only where the working tree has a file matching <pathspec> but also where the index already has an entry. This adds, modifies, and removes index entries to match the working tree. If no <pathspec> is given when -A option is used, all files in the entire working tree are updated
git add -A file_name
git add --all
git add --no-ignore-removal
# --no-all, --ignore-removal: Update the index by adding new files that are unknown to the index and files modified in the working tree, but ignore files that have been removed from the working tree. This option is a no-op when no <pathspec> is used.
git add --no-all
git add --ignore-removal
# -N, --intent-to-add: Record only the fact that the path will be added later. An entry for the path is placed in the index with no content. This is useful for, among other things, showing the unstaged content of such files with git diff and committing them with git commit -a.
git add -N
git add --intent-to-add

# git commit: saves the changes made to any file in the staging area inside the repository
git commit
# -a, --all: automatically stage files that have been modified and deleted, but new files you have not told Git about are not affected.
git commit -a
git commit --all
# --date=<date>: Override the author date used in the commit
git commit --date=05/12/23
# --author=<author>: Override the commit author. Specify an explicit author using the standard A U Thor <author@example.com> format. Otherwise <author> is assumed to be a pattern and is used to search for an existing commit by that author (i.e. rev-list --all -i --author=<author>); the commit author is then copied from the first such commit found
git commit --author=my@mail.com
# -m --message: Use the given message as the commit message. If multiple -m options are given, their values are concatenated as separate paragraphs. The -m option is mutually exclusive with -c, -C, and -F. We can add a message to have more knowledge of what we do in each commit
git commit -m "some message"
git commit --message="some message"
git commit -am "some message"
# --amend: Replace the tip of the current branch by creating a new commit. The recorded tree is prepared as usual (including the effect of the -i and -o options and explicit pathspec), and the message from the original commit is used as the starting point, instead of an empty message, when no other message is specified from the command line via options such as -m, -F, -c, etc. The new commit has the same parents and author as the current one (the --reset-author option can countermand this). If we want to add some changes to the files we have to add them to staging with "git add" before calling the --amend option
git commit --amend
git commit --amend -m "some message"
# -C <commit>, --reuse-message=<commit>: Take an existing commit object, and reuse the log message and the authorship information (including the timestamp) when creating the commit
git commit -C commit_hash
git commit --amend -C commit_hash
git commit --reuse-message=commit_hash
#-c <commit>, --reedit-message=<commit>: Like -C, but with -c the editor is invoked, so that the user can further edit the commit message
git commit -c commit_hash
git commit --amend -c commit_hash
git commit --reedit-message=commit_hash
# --reset-author: When used with -C/-c/--amend options, or when committing after a conflicting cherry-pick, declare that the authorship of the resulting commit now belongs to the committer. This also renews the author timestamp.
git commit --amend --reset-author
git commit --amend -C commit_hash --reset-author
# --no-edit: Use the selected commit message without launching an editor. For example, git commit --amend --no-edit amends a commit without changing its commit message
git commit --amend --no-edit
# -e, --edit: The message taken from file with -F, command line with -m, and from commit object with -C are usually used as the commit log message unmodified. This option lets you further edit the message taken from these sources
git commit -C commit_hash -e
git commit --amend -C commit_hash --edit
git commit -m "message" --edit
# --dry-run: Do not create a commit, but show a list of paths that are to be committed, paths with local changes that will be left uncommitted and paths that are untracked
git commit --dry-run
# --status: Include the output of git-status(1) in the commit message template when using an editor to prepare the commit message. Defaults to on, but can be used to override configuration variable "commit.status"
git commit --status
# --no-status: Do not include the output of git-status(1) in the commit message template when using an editor to prepare the default commit message
git commit --no-status

# git restore: Restore specified paths in the working tree with some contents from a restore source. If a path is tracked but does not exist in the restore source, it will be removed to match the source. The command can also be used to restore the content in the index with --staged, or restore both the working tree and the index with --staged --worktree. By default, if --staged is given, the contents are restored from HEAD, otherwise from the index. Use --source to restore from a different commit.
git restore file_name file_name2 # If no option is specified, by default the working tree is restored
#  -W, --worktree: restore the content in the working tree from the index
git restore --worktree file_name1 file_name2
git restore -W file_name
# -S, --staged: restore the content in the index, the contents are restored from HEAD
git restore --staged file1_name file2_name
git restore -S file_name
git restore -SW
# -s <tree>, --source=<tree>: Restore the working tree files with the content from the given tree, It is common to specify the source tree by naming a commit, branch or tag associated with it.
git restore file_name -s commit_hash
git restore file_name --source=commit_hash
git restore -s master~2 file_name

# git revert: Given one or more existing commits, revert the changes that the related patches introduce, and record some new commits that record them. This requires your working tree to be clean (no modifications from the HEAD commit). For a more complete list of ways to spell commit names, see "gitrevisions"
git revert commit_hash
git revert commit_hash1 commit_hash2
git revert older_commit_hash..newer_commit_hash 
git revert HEAD~3
# --no-edit: With this option, git revert will not start the commit message editor
git revert commit_hash --no-edit
# -n, --no-commit: Usually the command automatically creates some commits with commit log messages stating which commits were reverted. This flag applies the changes necessary to revert the named commits to your working tree and the index, but does not make the commits. In addition, when this option is used, your index does not have to match the HEAD commit. The revert is done against the beginning state of your index. This is useful when reverting more than one commits' effect to your index in a row
git revert commit_hash -n
git revert commit_hash --no-commit
git revert -n master~5..master~2

# git reset: Reset current HEAD to the specified state, If no arguments are given, the <tree-ish>/<commit> defaults to HEAD in all forms.
git reset
git reset HEAD
git reset HEAD@{2}
# This form resets the current branch head to <commit_hash> and possibly updates the index (resetting it to the tree of <commit_hash>) and the working tree depending on <mode>. If <mode> is omitted, defaults to --mixed. The available modes are soft, mixed, hard, merge, keep, recurse-submodules
git reset
git reset commit_hash
# --mixed: Resets the index but not the working tree (i.e., the changed files are preserved but not marked for commit) and reports what has not been updated. This is the default action. If -N is specified, removed paths are marked as intent-to-add
git reset commit_hash --mixed
git reset --mixed commit_hash -N
git reset -N HEAD^
# --soft: Does not touch the index file or the working tree at all (but resets the head to <commit>, just like all modes do). This leaves all your changed files "Changes to be committed", as git status would put it.
git reset commit_hash --soft
git reset --soft HEAD^
# --hard: Resets the index and working tree. Any changes to tracked files in the working tree since <commit> are discarded. Any untracked files or directories in the way of writing any tracked files are simply deleted.
git reset commit_hash --hard
git reset HEAD --hard
git reset --hard
git reset --hard HEAD~3
# --keep: Resets index entries and updates files in the working tree that are different between <commit> and HEAD. If a file that is different between <commit> and HEAD has local changes, reset is aborted.
git reset commit_hash --keep
# --merge: Resets the index and updates the files in the working tree that are different between <commit> and HEAD, but keeps those which are different between the index and working tree (i.e. which have changes which have not been added). If a file that is different between <commit> and the index has unstaged changes, reset is aborted.
git reset commit_hash --merge
git reset ORIG_HEAD --merge
# git reset [-q] [<tree-ish>] [--] <pathspec>...This form reset the index entries for all paths that match the <pathspec> to their state at <tree-ish>. (It does not affect the working tree or the current branch.) This means that git reset <pathspec> is the opposite of git add <pathspec>. This command is equivalent to git restore [--source=<tree-ish>] --staged <pathspec>.... After running git reset <pathspec> to update the index entry, you can use git restore to check the contents out of the index to the working tree. Alternatively, using git restore and specifying a commit with --source, you can copy the contents of a path out of a commit to the index and to the working tree in one go.
git reset file_name
git reset tree_ish file_name1 file_name2
git reset HEAD file1_name file2_name
git reset commit_hash file_name
# --: Do not interpret any more arguments as options.
git reset -- file_name
git reset tree_ish -- file_name1 filename2
git reset HEAD -- file_name1 file_name2

# git checkout: Switch branches or restore working tree files. Updates files in the working tree to match the version in the index or the specified tree. If no pathspec was given, git checkout will also update HEAD to set the specified branch as the current branch.
# restore file
git checkout file1_name file2_name
git checkout HEAD file_name
git checkout commit_hash
git checkout -- file1_name file2_name
git checkout commit_hash file_name1 file_name2
# switch branch
git checkout branch_name
git checkout branch_name file_name1 file_name2
git checkout -  # switch to the last checked branch
# -b <new_branch>: Create a new branch named <new_branch> and start it at <start_point>
git checkout -b new_branch_name
git checkout -b new_branch_name start_point
# -B <new_branch>: Creates the branch <new_branch> and start it at <start_point>; if it already exists, then reset it to <start_point>.
git checkout -B new_branch_name
git checkout -B new_branch_name start_point
# -t, --track: When creating a new branch, set up "upstream" configuration
git checkout -b new_branch_name -t repository_alias/remote_branch_name
git checkout --track repository_alias/branch_name # --track without -b implies branch creation, the name of the new branch will be derived from the remote-tracking branch
# --no-track: Do not set up "upstream" configuration, even if the branch.autoSetupMerge configuration variable is true.
git checkout new_branch_name --no-track
# --guess, --no-guess: If <branch> is not found but there does exist a tracking branch in exactly one remote (call it <remote>) with a matching name, treat as equivalent to "git checkout -b <branch> --track <remote>/<branch>" --guess is the default behavior. Use --no-guess to disable it.
git checkout remote_branch_name --guess
git checkout remote_branch_name --no-guess
# -d, --detach: Rather than checking out a branch to work on it, check out a commit for inspection and discardable experiments. This is the default behavior of git checkout <commit> when <commit> is not a branch name. See the "DETACHED HEAD" section below for details.
git checkout -d commit_hash
git checkout --detach commit_hash
# --orphan <new_branch>: Create a new orphan branch, named <new_branch>, started from <start_point> and switch to it. The first commit made on this new branch will have no parents and it will be the root of a new history totally disconnected from all the other branches and commits.
git checkout --orphan new_branch_name

# git switch: Switch to a specified branch. The working tree and the index are updated to match the branch. All new commits will be added to the tip of this branch.
git switch branch_name
git switch -  # switch to the las checked branch
# -c <new-branch>, --create <new-branch>: Create a new branch named <new-branch> starting at <start-point> before switching to the branch. Specifying a <start-point> allows you to create a branch based on some other point in history than where HEAD currently points. (Or, in the case of --detach, allows you to inspect and detach from some other point.) You can use the @{-N} syntax to refer to the N-th last branch/commit switched to using "git switch" or "git checkout" operation. You may also specify - which is synonymous to @{-1}. This is often used to switch quickly between two branches, or to undo a branch switch by mistake.
git switch -c new_branch_name
git switch --create new_branch_name
git switch -c new_branch_name start_point
git switch -c madona 45f5623
# -C <new-branch>, --force-create <new-branch>: Similar to --create except that if <new-branch> already exists, it will be reset to <start-point>
git switch -C new_branch_name
git switch --force-create new_branch_name
git switch -C new_branch_name start_point
git switch -C madona HEAD~4
# -d, --detach: Switch to a commit for inspection and discardable experiments
git switch -d
git switch -d start_point
git switch --detach start_point
# --guess, --no-guess: If <branch> is not found but there does exist a tracking branch in exactly one remote (call it <remote>) with a matching name, treat as equivalent to "git switch -c <branch> --track <remote>/<branch>" --guess is the default behavior. Use --no-guess to disable it.
git switch remote_branch_name
git switch remote_branch_name --guess
git switch remote_branch_name --no-guess
# -t, --track: When creating a new branch, set up "upstream" configuration.  -c is implied. If no -c option is given, the name of the new branch will be derived from the remote-tracking branch, by looking at the local part of the refspec configured for the corresponding remote, and then stripping the initial part up to the "*". This would tell us to use hack as the local branch when branching off of origin/hack (or remotes/origin/hack, or even refs/remotes/origin/hack). If the given name has no slash, or the above guessing results in an empty name, the guessing is aborted. You can explicitly give a name with -c in such a case.
git switch -t repository_alias/branch_name
git switch -c new_branch_name -t repository_alias/branch_name
# --no-track: Do not set up "upstream" configuration, even if the branch.autoSetupMerge configuration variable is true.
git switch new_branch_name --no-track
# --orphan <new-branch>: Create a new orphan branch, named <new-branch>. All tracked files are removed.
git switch --orphan new_branch_name

# git status: Displays paths that have differences between the index file and the current HEAD commit, paths that have differences between the working tree and the index file, and paths in the working tree that are not tracked by Git (and are not ignored by gitignore). The first are what you would commit by running git commit; the second and third are what you could commit by running git add before running git commit. It shows the status of the repository files (untracked, ready to commit, nothing to commit).
git status

# git show: Shows one or more objects (blobs, trees, tags and commits). For commits it shows the log message and textual diff. It also presents the merge commit in a special format as produced by git diff-tree --cc. For tags, it shows the tag message and the referenced objects. For trees, it shows the names (equivalent to git ls-tree with --name-only). For plain blobs, it shows the plain contents. It shows the history of all the changes in the repository. The command takes options applicable to the git diff-tree command to control how the changes the commit introduces are shown.
git show
git show ./file_name
git show branch_name
git show commit_hash
git show tag_name

# git diff: Show changes between the working tree and the index or a tree, changes between the index and a tree, changes between two trees, changes resulting from a merge, changes between two blob objects, or changes between two files on disk.
git diff # Changes in the working tree not yet staged for the next commit.
git diff commit_hash1 commit_hash2
git diff master@{0} master@{1.week.ago}
git diff HEAD
git diff branch_name
git diff branch1_name branch2_name
git diff HEAD -- ./file_name
git diff HEAD^ HEAD
git diff topic master  # Changes between the tips of the topic and the master branches.
diff topic..master  # Same as above.
git diff topic...master  # Changes that occurred on the master branch since when the topic branch was started off it.
# --cached: This form is to view the changes you staged for the next commit relative to the named <commit>. Typically you would want comparison with the latest commit, so if you do not give <commit>, it defaults to HEAD. If HEAD does not exist (e.g. unborn branches) and <commit> is not given, it shows all staged changes. --staged is a synonym of --cached
git diff --cached
git diff --staged commit_hash
git diff --cached > patch_file.patch
# -p, -u, --patch: Generate patch, this is the default.
git diff
git diff -p
git diff -u
git diff --patch
# -s, --no-patch: Suppress diff output. Useful for commands like git show that show the patch by default, or to cancel the effect of --patch.
git diff -s
git diff --no-patch
# --output=<file>: Output to a specific file instead of stdout.
git diff --output=file_name.txt
# --name-only: Show only names of changed files. The file names are often encoded in UTF-8.
git diff --name-only
# -U<n>, --unified=<n>: Generate diffs with <n> lines of context instead of the usual three. Implies --patch.
git diff -U3
git diff --unified=3

# git apply: Apply a patch to files and/or to the index. Reads the supplied diff output (i.e. "a patch") and applies it to files. By default, the command applies the patch only to files, and does not require them to be in a Git repository, this command applies the patch but does not create a commit. When running from a subdirectory in a repository, patched paths outside the directory are ignored.
git apply patch_file.patch
git apply -  #  "-" can be used to read from the standard input.
# --stat: Instead of applying the patch, output diffstat for the input. Turns off "apply".
git apply --stat patch_file.patch
# --numstat: Similar to --stat, but shows the number of added and deleted lines in decimal notation and the pathname without abbreviation, to make it more machine friendly. For binary files, outputs two "-" instead of saying 0 0. Turns off "apply".
git apply --numstat patch_file.patch
# --summary: Instead of applying the patch, output a condensed summary of information obtained from git diff extended headers, such as creations, renames and mode changes. Turns off "apply".
git apply --summary patch_file.patch
# --check: Instead of applying the patch, see if the patch is applicable to the current working tree and/or the index file and detects errors. Turns off "apply".
git apply --check patch_file.patch
# --index: Apply the patch to both the index and the working tree (or merely check that it would apply cleanly to both if --check is in effect). Note that --index expects index entries and working tree copies for relevant paths to be identical (their contents and metadata such as file mode must match), and will raise an error if they are not, even if the patch would apply cleanly to both the index and the working tree in isolation.
git apply --index patch_file.patch
# --cached: Apply the patch to just the index, without touching the working tree. If --check is in effect, merely check that it would apply cleanly to the index entry.
git apply --cached patch_file.patch
# --intent-to-add: When applying the patch only to the working tree, mark new files to be added to the index later. This option is ignored unless running in a Git repository and --index is not specified. Note that --index could be implied by other options such as --cached or --3way.
git apply --intent-to-add patch_file.patch
# -R, --reverse: Apply the patch in reverse.
git apply -R patch_file.patch
git apply --reverse patch_file.patch
# --reject: For atomicity, git apply by default fails the whole patch and does not touch the working tree when some of the hunks do not apply. This option makes it apply the parts of the patch that are applicable, and leave the rejected hunks in corresponding *.rej files.
git apply --reject patch_file.patch
# -p<n>: Remove <n> leading path components (separated by slashes) from traditional diff paths. The default is 1.
git apply -p patch_file.patch
git apply -p2 patch_file.patch  # with -p2, a patch against a/dir/file.txt will be applied directly to "file.txt"
# --unidiff-zero: By default, git apply expects that the patch being applied is a unified diff with at least one line of context. This provides good safety measures, but breaks down when applying a diff generated with --unified=0. To bypass these checks use --unidiff-zero. For these reasons the usage of context-free patches is discouraged.
git apply --unidiff-zero patch_file.patch
# --apply: If you use any of the options marked "Turns off apply", git apply reads and outputs the requested information without actually applying the patch. Give this flag after those flags to also apply the patch.
git apply --check --apply patch_file.patch
# --no-add: When applying a patch, ignore additions made by the patch. This can be used to extract the common part between two files by first running diff on them and applying the result with this option, which would apply the deletion part but not the addition part.
git apply --no-add patch_file.patch
# --exclude=<path-pattern>: Don’t apply changes to files matching the given path pattern. This can be useful when importing patchsets, where you want to exclude certain files or directories.
git apply --exclude=string_pattern patch_file.patch
# --include=<path-pattern>: Apply changes to files matching the given path pattern. This can be useful when importing patchsets, where you want to include certain files or directories. When --exclude and --include patterns are used, they are examined in the order they appear on the command line, and the first match determines if a patch to each path is used. A patch to a path that does not match any include/exclude pattern is used by default if there is no include pattern on the command line, and ignored if there is any include pattern.
git apply --include=string_pattern patch_file.patch
# -3, --3way: Attempt 3-way merge if the patch records the identity of blobs it is supposed to apply to and we have those blobs available locally, possibly leaving the conflict markers in the files in the working tree for the user to resolve. This option implies the --index option unless the --cached option is used, and is incompatible with the --reject option. When used with the --cached option, any conflicts are left at higher stages in the cache.
git apply -3 patch_file.patch
git apply --3way patch_file.patch
# --directory=<root>: Prepend <root> to all filenames. If a "-p" argument was also passed, it is applied before prepending the new root. For example, a patch that talks about updating a/git-gui.sh to b/git-gui.sh can be applied to the file in the working tree "modules/git-gui/git-gui.sh" by running "git apply --directory=modules/git-gui".
git apply --directory=directory_name patch_file.patch
# --unsafe-paths: By default, a patch that affects outside the working area (either a Git controlled working tree, or the current working directory when "git apply" is used as a replacement of GNU patch) is rejected as a mistake (or a mischief). When git apply is used as a "better GNU patch", the user can pass the --unsafe-paths option to override this safety check. This option has no effect when --index or --cached is in use.
git apply --unsafe-paths patch_file.patch

# git format-patch: Prepare patches for e-mail submission
git format-patch -3

# git am: Apply a series of patches from a mailbox. Splits mail messages in a mailbox into commit log message, authorship information and patches, and applies them to the current branch.
git am patch_file.patch
git am *.patch  #  If you have multiple patch files (like those generated by git format-patch), you can apply them all at once

# git log: Shows the commit logs. List commits that are reachable by following the parent links from the given commits, but exclude commits that are reachable from the ones given with a ^ in front of them. The output is given in reverse chronological order by default. Shows all the changes made to a file
git log
git log ./file_name
git log file_name1 file_name2 ^file_name3
git log branch_name
git log main
git log origin/main
# A special notation "<commit1>..<commit2>" can be used as a short-hand for "^<commit1> <commit2>". For example, either of the following may be used interchangeably:
git log origin..HEAD
git log main..HEAD
git log HEAD ^origin
git log master@{1.month.ago..yesterday}
# Another special notation is "<commit1>...<commit2>" which is useful for merges. The resulting set of commits is the symmetric difference between the two operands. The following two commands are equivalent:
git log A B --not $(git merge-base --all A B)
git log A...B
# --stat: Generate a diffstat, it shows the changes between each commit
git log --stat
# --all: Pretend as if all the refs in refs/, along with HEAD, are listed on the command line as <commit>
git log --all
# --graph: Draw a text-based graphical representation of the commit history on the left hand side of the output. This may cause extra lines to be printed in between commits, in order for the graph history to be drawn properly
git log --graph
git log --all --graph
# --no-decorate, --decorate[=short|full|auto|no] Print out the ref names of any commits that are shown. If short is specified, the ref name prefixes refs/heads/, refs/tags/ and refs/remotes/ will not be printed. If full is specified, the full ref name (including prefix) will be printed. If auto is specified, then if the output is going to a terminal, the ref names are shown as if short were given, otherwise no ref names are shown. The option --decorate is short-hand for --decorate=short. Default to configuration value of log.decorate if configured, otherwise, auto.
git log --decorate
git log --decorate=short
git log --decorate=full
git log --decorate=no
git log --no-decorate
# --since=<date>, --after=<date>: Show commits more recent than a specific date.
git log --since=2018-01-02
git log --after=today
# --until=<date>, --before=<date>: Show commits older than a specific date.
git log --until=2024-05-12
git log --before=today
# -L<start>,<end>:<file>, -L:<funcname>:<file> Trace the evolution of the line range given by <start>,<end>, or by the function name regex <funcname>, within the <file>. You may not give any pathspec limiters.
git log -L 5,10:file_name.txt
git log -L:"string_pattern_in_file":file_name.txt
# --abbrev-commit: Instead of showing the full 40-byte hexadecimal commit object name, show a prefix that names the object uniquely. "--abbrev=<n>" (which also modifies diff output, if it is displayed) option can be used to specify the minimum length of the prefix. This should make "--pretty=oneline" a whole lot more readable for people using 80-column terminals.
git log --abbrev-commit
# --no-abbrev-commit: Show the full 40-byte hexadecimal commit object name. This negates --abbrev-commit, either explicit or implied by other options such as "--oneline". It also overrides the log.abbrevCommit variable.
git log --no-abbrev-commit
# --pretty[=<format>], --format=<format>: Pretty-print the contents of the commit logs in a given format, where <format> can be one of oneline, short, medium, full, fuller, reference, email, raw, format:<string> and tformat:<string>. When <format> is none of the above, and has %placeholder in it, it acts as if --pretty=tformat:<format> were given. When =<format> part is omitted, it defaults to medium.
git log --pretty
git log --format
git log --pretty=medium
git log --format=medium
git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
git log --decorate --all --stat --date-order --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%C(203 bold)%h%Creset %C(39 bold)%ad%Creset %C(green bold)(%ar)%C(reset) - %C(220)%an%C(reset) %C(auto)%d %s'
git log --pretty=format:"%cn hizo un commit %h el dia %cd"
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
git log --graph --abbrev-commit --decorate --format=format:'%C(yellow)%h%C(reset)%C(auto)%d%C(reset) %C(normal)%s%C(reset) %C(dim white)%an%C(reset) %C(dim blue)(%ar)%C     (reset)' --all
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'
#  --oneline: This is a shorthand for "--pretty=oneline --abbrev-commit" used together.
git log --oneline
git log --pretty=oneline --abbrev-commit
git log --all --graph --decorate --oneline
# -g, --walk-reflogs: Instead of walking the commit ancestry chain, walk reflog entries from the most recent one to older ones. When this option is used you cannot specify commits to exclude (that is, ^commit, commit1..commit2, and commit1...commit2 notations cannot be used). With --pretty format other than oneline and reference (for obvious reasons), this causes the output to have two extra lines of information taken from the reflog
git log -g
git log --walk-reflogs
git log -g --pretty=medium
git log -g --pretty=reference
git log -g --abbrev-commit --pretty=oneline
# --reflog: Pretend as if all objects mentioned by reflogs are listed on the command line as <commit>
git log --reflog
# --single-worktree: By default, all working trees will be examined by the following options when there are more than one: --all, --reflog and --indexed-objects. This option forces them to examine the current working tree only.
git log --single-worktree
# -S<string>: Look for differences that change the number of occurrences of the specified string (i.e. addition/deletion) in a file. Intended for the scripter’s use. It is useful when you’re looking for an exact block of code (like a struct), and want to know the history of that block since it first came into being: use the feature iteratively to feed the interesting block in the preimage back into -S, and keep going until you get the very first version of the block. Binary files are searched as well.
git log -S string_pattern
git log -S "string_pattern_in_file"
# -G<regex>: Look for differences whose patch text contains added/removed lines that match <regex>.
git log -G regex_pattern
git log -G "regex_pattern_in_file"
# --author=<pattern>, --committer=<pattern>: Limit the commits output to ones with author/committer header lines that match the specified pattern (regular expression). With more than one --author=<pattern>, commits whose author matches any of the given patterns are chosen (similarly for multiple --committer=<pattern>).
git log --author="commiter_name"
# --grep=<pattern>: Limit the commits output to ones with log message that matches the specified pattern (regular expression). With more than one --grep=<pattern>, commits whose message matches any of the given patterns are chosen (but see --all-match).
git log --grep="regex_pattern"
# --all-match: Limit the commits output to ones that match all given --grep, instead of ones that match at least one.
git log --all-match --grep="regex_pattern"
# --invert-grep: Limit the commits output to ones with log message that do not match the pattern specified with --grep=<pattern>.
git log --invert-grep --grep="regex_pattern"
# -i, --regexp-ignore-case: Match the regular expression limiting patterns without regard to letter case.
git log -i --grep="regex_pattern"
git log --regexp-ignore-case --grep="regex_pattern"
# --merges: Print only merge commits. This is exactly the same as --min-parents=2.
git log --merges
# --no-merges: Do not print commits with more than one parent. This is exactly the same as --max-parents=1.
git log --no-merges
# --merge: After a failed merge, show refs that touch files having a conflict and don’t exist on all heads to merge.
git log --merge
# --branches[=<pattern>]: Pretend as if all the refs in refs/heads are listed on the command line as <commit>. If <pattern> is given, limit branches to ones matching given shell glob. If pattern lacks ?, *, or [, /* at the end is implied.
git log --branches
git log --branches="string_pattern"
# --tags[=<pattern>]: Pretend as if all the refs in refs/tags are listed on the command line as <commit>. If <pattern> is given, limit tags to ones matching given shell glob. If pattern lacks ?, *, or [, /* at the end is implied.
git log --tags
git log --tags="string_pattern"
# --remotes[=<pattern>]: Pretend as if all the refs in refs/remotes are listed on the command line as <commit>. If <pattern> is given, limit remote-tracking branches to ones matching given shell glob. If pattern lacks ?, *, or [, /* at the end is implied.
git log --remotes
git log --remotes="string_pattern"
# -p, -u, --patch: Generate patch
git log -p
git log -u
git log --patch
# -<number>, -n <number>, --max-count=<number>: Limit the number of commits to output.
git log -2
git log -n 2
git log --max-count=2

# git shortlog: Summarizes git log output in a format suitable for inclusion in release announcements. Each commit will be grouped by author and title. Additionally, "[PATCH]" will be stripped from the commit description
git shortlog
# -n, --numbered: Sort output according to the number of commits per author instead of author alphabetic order
git shortlog -n
git shortlog --numbered
# -s, --summary: Suppress commit description and provide a commit count summary only
git shortlog -s
git shortlog --summary
# -e, --email: Show the email address of each author
git shortlog -e
git shortlog --email
# --all: Pretend as if all the refs in refs/, along with HEAD, are listed on the command line as <commit>
git shortlog --all
# --no-merges: Do not print commits with more than one parent. This is exactly the same as "--max-parents=1"
git shortlog --no-merges

# git tag: Create, list, delete or verify a tag object signed with GPG, by using the command without arguments it returns all the tags in the project. Tag objects (created with -a, -s, or -u) are called "annotated" tags; they contain a creation date, the tagger name and e-mail, a tagging message, and an optional GnuPG signature. Whereas a "lightweight" tag is simply a name for an object (usually a commit object).
git tag
git tag tag_name
git tag tag_name commit_hash
# -a, --annotate: Make an unsigned, annotated tag object, an editor is started for the user to type in the tag message. we can specify the commit_hash we want to put the tag on, otherwise the default is HEAD
git tag -a tag_name
git tag --annotate tag_name commit_hash
git tag -a v0.1 ba3ce9c04edb60954386c37d980f994a3ce568c5
git tag -a v0.1 ba3ce9c
# -m, --message=tag_message: Use the given tag message (instead of prompting). If multiple -m options are given, their values are concatenated as separate paragraphs. Implies -a if none of -a, -s, or -u <keyid> is given
git tag tag_name -m "tag message"
git tag tag_name --message="tag_message"
git tag -a v0.1 -m "tag_message" commit_hash
# -d, --delete: Delete existing tags with the given names
git tag -d tag_name1 tag_name2
# -l, --list: List tags. With optional <pattern>..., e.g.  git tag --list 'v-*', list only the tags that match the pattern(s). Running "git tag" without arguments also lists all tags
git tag -l
git tag --list "string_pattern"
# -n<num>: <num> specifies how many lines from the annotation, if any, are printed when using -l. Implies --list. The default is not to print any annotation lines. If no number is given to -n, only the first line is printed. If the tag is not annotated, the commit message is displayed instead.
git tag -n
git tag -n3
# -f, --force: Replace an existing tag with the given name (instead of failing)
git tag tag_name -f
git tag tag_name --force

# git show-refs: Displays references available in a local repository along with the associated commit IDs. Results can be filtered using a pattern and tags can be dereferenced into object IDs. Additionally, it can be used to test whether a particular ref exists. By default, shows the tags, heads, and remote refs
git show-ref
# --head: Show the HEAD reference, even if it would normally be filtered out.
git show-ref --head
# --heads, --tags: Limit to "refs/heads" and "refs/tags", respectively. These options are not mutually exclusive; when given both, references stored in "refs/heads" and "refs/tags" are displayed.
git show-ref --heads
git show-ref --tags
git show-ref --heads --tags
# git ls-remote: Displays references available in a remote repository along with the associated commit IDs.
git ls-remote
git ls-remote repository_alias
git ls-remote repository_alias string_pattern
git ls-remote origin main
# -h, --heads: Limit to only refs/heads
git ls-remote -h repository_alias
git ls-remote --heads
# -t, --tags: Limit to only refs/tags
git ls-remote -t
git ls-remote --tags
# --refs: Do not show peeled tags or pseudorefs like HEAD in the output.
git ls-remote --refs
git ls-remote --refs repository_alias
# --get-url: Expand the URL of the given remote repository taking into account any "url.<base>.insteadOf" config setting and exit without talking to the remote.
git ls-remote --get-url
git ls-remote --get-url repository_alias

# git rm: Remove files from the index, or from the working tree and the index. It will not remove a file from just your working directory. The command removes only the paths that are known to Git. The files being removed have to be identical to the tip of the branch, and no updates to their contents can be staged in the index
git rm file_name1 file_name2
# File globbing matches across directory boundaries. Thus, given two directories d and d2, there is a difference between using git rm 'd*' and git rm 'd/*', as the former will also remove all of directory d2.
git rm "directory_name*"
git rm "directory_name/*"
# -f, --force: Override the up-to-date check
git rm -f file_name
git rm --force file_name
# --cached: Use this option to unstage and remove paths only from the index. Working tree files, whether modified or not, will be left alone, the staged content has to match either the tip of the branch or the file on disk, allowing the file to be removed from just the index
git rm --cached file_name
# -r: Allow recursive removal when a leading directory name is given
git rm -r directory_name

# git mv: Move or rename a file, a directory, or a symlink
git mv ./file.txt /new/path/file.txt
git mv ./old_name.txt ./new_name.txt

# git config: Get and set repository or global options. You can query/set/replace/unset options with this command. The name is actually the section and the key separated by a dot, and the value will be escaped.
git config # shows the command options
git config section_name.key_name
# -e, --edit: Opens an editor to modify the specified config file; either --system, --global, or repository (default).
git config --global --edit
git config -e
# The user.name and user.email variables determine what ends up in the author and committer field of commit objects. If you need the author or committer to be different, the author.name, author.email, committer.name or committer.email variables can be set. Also, all of these can be overridden by the GIT_AUTHOR_NAME, GIT_AUTHOR_EMAIL, GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL and EMAIL environment variables.
git config user.name "user_name"
git config user.email "my@mail.com"
# alias.* Command aliases for the git command wrapper. To avoid confusion and troubles with script usage, aliases that hide existing Git commands are ignored. Arguments are split by spaces, the usual shell quoting and escaping is supported. A quote pair or a backslash can be used to quote them
git config alias.alias_name "command"
git config alias.tiger "log --all --graph --oneline"
git tiger
git config --global alias.visual '!gitk'
# --unset: Remove the line matching the key from config file.
git config --unset section_name.key_name
git config --unset user.email
# --unset-all: Remove all lines matching the key from config file.
git config --unset-all section_name.key_name
# --add: Adds a new line to the option without altering any existing values.
git config --add section_name.key_name
# --global: For writing options: write to global ~/.gitconfig file rather than the repository .git/config, write to $XDG_CONFIG_HOME/git/config file if this file exists and the ~/.gitconfig file doesn’t. For reading options: read only from global ~/.gitconfig and from $XDG_CONFIG_HOME/git/config rather than from all available files.
git config --global user.email "my@email.com"
# the default name for the initial branch is "master" but we can change it with this command
git config --global init.defaultBranch branch_name
# -l, --list: List all variables set in config file, along with their values.
git config -l
git config --list
# --show-origin: Augment the output of all queried config options with the origin type (file, standard input, blob, command line) and the actual origin (config file path, ref, or blob id if applicable)
git config -l --show-origin
# Each Git repository can have its own .gitignore file located at the root of the repository or you can also set up a global .gitignore file that applies to all repositories on your system
git config --global core.excludesfile ~/.gitignore_global

# git branch: List, create, or delete branches. If --list is given, or if there are no non-option arguments, existing branches are listed; the current branch will be highlighted in green and marked with an asterisk. Any branches checked out in linked worktrees will be highlighted in cyan and marked with a plus sign.
git branch
# --show-current: Print the name of the current branch. In detached HEAD state, nothing is printed.
git branch --show-current
# -l, --list: List branches. With optional <pattern>, list only the branches that match the pattern. When providing a <pattern>, you must use --list; otherwise the command may be interpreted as branch creation.
git branch --list
git branch -l
git branch -l "pattern"
git branch --list "maint-*"
# --merged [<commit>]: Only list branches whose tips are reachable from the specified commit (HEAD if not specified). Implies --list.
git branch --merged
git branch --merged commit_hash
# --no-merged [<commit>]: Only list branches whose tips are not reachable from the specified commit (HEAD if not specified). Implies --list.
git branch --no-merged
git branch --no-merged commit_hash
# --contains [<commit>]: Only list branches which contain the specified commit (HEAD if not specified). Implies --list.
git branch --contains
git branch --contains commit_hash
# --no-contains [<commit>]: Only list branches which don’t contain the specified commit (HEAD if not specified). Implies --list.
git branch --no-contains
git branch --no-contains commit_hash
# -v, -vv, --verbose: When in list mode, show sha1 and commit subject line for each head, along with relationship to upstream branch (if any). If given twice, print the path of the linked worktree (if any) and the name of the upstream branch, as well. Note that the current worktree’s HEAD will not have its path printed (it will always be your current directory).
git branch -v
git branch -vv
git branch --verbose
# To create a branch we can use a start_point, The new branch head will point to this commit. It may be given as a branch name, a commit-id, or a tag. If this option is omitted, the current HEAD will be used instead.
git branch new_branch
git branch new_branch start_point
git branch new_branch local_branch
git branch new_branch repository_alias/remote_branch
# -t, --track: When creating a new branch, set up branch.<name>.remote and branch.<name>.merge configuration entries to mark the "start-point" branch as "upstream" from the new branch. This configuration will tell git to show the relationship between the two branches in git status and git branch -v. Furthermore, it directs git pull without arguments to pull from the upstream when the new branch is checked out. This behavior is the default when the start point is a remote-tracking branch. 
git branch new_branch start_point --track
git branch new_branch local_branch --track
git branch new_branch -t repository_alias/remote_branch
git branch -t new_branch repository_alias/remote_branch
# --no-track: Do not set up "upstream" configuration, even if the branch.autoSetupMerge configuration variable is true.
git branch new_branch --no-track
# -m, --move: move/rename a branch, together with its config and reflog
git branch -m old_branch_name new_branch_name
git branch --move old_branch_name new_branch_name
git branch -m new_branch_name # The just-created branch can be renamed via this command
#  -d, --delete: Delete a branch. The branch must be fully merged in its upstream branch, or in HEAD if no upstream was set with --track or --set-upstream-to.
git branch -d branch_name
git branch --delete branch_name
git branch -dr repository_alias/branch_name
# -r, --remotes: List or delete (if used with -d) the remote-tracking branches
git branch -r
git branch --remotes -d repository_alias/branch_name
git branch -r -l
# -a, --all: List both remote-tracking branches and local branches
git branch -a
git branch --all
git branch -a -l
# -u <upstream>, --set-upstream-to=<upstream>: Set up branch_name's tracking information so <upstream> is considered branch_name's upstream branch. If no branch_name is specified, then it defaults to the current branch.
git branch -u start_point
git branch branch_name -u start_point
git branch -u repository_alias/remote_branch
git branch branch_name -u local_branch
git branch branch_name --set-upstream-to=repository_alias/remote_branch
# --unset-upstream: Remove the upstream information for branch_name. If no branch is specified it defaults to the current branch.
git branch --unset-upstream
git branch branch_name --unset-upstream

# git show-branch: Show branches and their commits
git show-branch
# -r, --remotes: Show the remote-tracking branches.
git show-branch -r
git show-branch --remotes
# -a, --all: Show both remote-tracking branches and local branches
git show-branch -a
git show-branch --all

# git-merge-base: Find as good common ancestors as possible for a merge, One common ancestor is better than another common ancestor if the latter is an ancestor of the former. A common ancestor that does not have any better common ancestor is a best common ancestor, i.e. a merge base.
git merge-base commit_hash1 commit_hash2 commit_hash3

# git merge: Join two or more development histories together
git merge branch_name
git merge repository_alias/branch_name
git merge FETCH_HEAD
git merge commit_hash
# -m <msg>: Set the commit message to be used for the merge commit (in case one is created). If --log is specified, a shortlog of the commits being merged will be appended to the specified message.
git merge branch_name -m "string_message"
# --abort: Abort the current conflict resolution process, and try to reconstruct the pre-merge state. If an autostash entry is present, apply it to the worktree.
git merge --abort
# --continue: After a git merge stops due to conflicts you can conclude the merge by running this command after fixing the conficts. Use git commit or git merge --continue to seal the deal
git merge --continue
# --squash: Produce the working tree and index state as if a real merge happened (except for the merge information), but do not actually make a commit, move the HEAD, or record $GIT_DIR/MERGE_HEAD (to cause the next git commit command to create a merge commit). This allows you to create a single commit on top of the current branch whose effect is the same as merging another branch (or more in case of an octopus)
git merge --squash branch_name
# --ff: when possible resolve the merge as a fast-forward (only update the branch pointer to match the merged branch; do not create a merge commit). When not possible (when the merged-in history is not a descendant of the current history), create a merge commit. It's the default unless merging an annotated (and possibly signed) tag that is not stored in its natural place in the refs/tags/ hierarchy, in which case --no-ff is assumed.
git merge --ff branch_name
#  --no-ff, create a merge commit in all cases, even when the merge could instead be resolved as a fast-forward.
git merge --no-ff branch_name
# --ff-only, resolve the merge as a fast-forward when possible. When not possible, refuse to merge and exit with a non-zero status.
git merge --ff-only branch_name
# -s <strategy>, --strategy=<strategy>: Use the given merge strategy; can be supplied more than once to specify them in the order they should be tried. If there is no -s option, a built-in list of strategies is used instead (ort when merging a single head, octopus otherwise).
git merge -s ort branch_name
git merge -s recursive branch_name
# -X <option>, --strategy-option=<option>: Pass merge strategy specific option through to the merge strategy.
git merge -s ort -X ours branch_name
git merge -X theirs
# --allow-unrelated-histories: By default, git merge command refuses to merge histories that do not share a common ancestor. This option can be used to override this safety when merging histories of two projects that started their lives independently. As that is a very rare occasion, no configuration variable to enable this by default exists and will not be added.
git merge branch_name --allow-unrelated-histories

# git rebase: Reapply commits on top of another base tip. If the "base_branch" already contains a change you have made in the "branch_rebased" then that commit will be skipped and warnings will be issued.
git rebase base_branch  # base_branch is the branch to compare against, the commit that serves as the starting point. Commits from this point will be rebased. May be any valid commit, not just an existing branch name. Defaults to the configured upstream for the current branch. 
git rebase 47k25j
git rebase main
git rebase base_branch branch_rebased  # branch_rebased is the Working branch; defaults to HEAD but it can be any valid commit. If "branch_rebased" is specified, git rebase will perform an automatic git switch "branch_rebased" before doing anything else. Otherwise it remains on the current branch. When rebase exits "branch_rebased" will remain the checked-out branch.
git rebase main feature1
git rebase main 0aw9e
git rebase main origin/main
git rebase 45ab25 feature1
#-i, --interactive: Make a list of the commits which are about to be rebased. Let the user edit that list before rebasing. This mode can also be used to split commits
git rebase -i branch name
git rebase -i HEAD~3
git rebase -i $(git merge-base $(git branch --show-current) master)
# First we rebase the branch where we make the changes, we can delete that branch later if we want, next we rebase the branch where we will keep the changes. we should only use this command in local repositories, doing it in remote repositories is a bad practice
git checkout disposable_branch
git rebase main
git checkout main
git rebase disposable_branch
git branch -d disposable_branch
# --onto new_base: Starting point at which to create the new commits. If the --onto option is not specified, the starting point is "base_branch". May be any valid commit, and not just an existing branch name.
git rebase --onto new_base base_branch branch_rebased
git rebase --onto main father son  # Here is how you would transplant a "son" branch based on "father" branch to "main", to pretend that you forked the "son" branch from the "main" branch
git rebase --onto 2h34u 3k4j7 feature1
git rebase --onto 3kn6a k345n 68npo
git rebase --onto feature~5 feature~3 feature  # A range of commits could also be removed with rebase

# git clone: Clone a repository into a new directory
git clone Uniform_Resource_Locator
git clone https://github.com/example/my_project.git
git clone URL directory_name
git clone git://git.kernel.org/pub/scm/linux.git my_repo

# git fetch: Download objects and refs from another repository. Fetch branches and/or tags (collectively, "refs") from one or more other repositories, along with the objects necessary to complete their histories. Remote-tracking branches are updated. It can fetch from either a single named repository or URL, or from several repositories at once if <group> is given and there is a remotes.<group> entry in the configuration file. The names of refs that are fetched, together with the object names they point at, are written to .git/FETCH_HEAD. This information may be used by scripts or other git commands, such as git-pull.
# "group_name" is a name referring to a list of repositories as the value of remotes.<group> in the configuration file.
# "refspec" Specifies which refs to fetch and which local refs to update. When no <refspec>s appear on the command line, the refs to fetch are read from remote.<repository>.fetch variables instead.
git fetch # When no remote is specified, by default the "origin" remote will be used, unless there’s an upstream branch configured for the current branch. When git fetch is run without specifying what branches and/or tags to fetch on the command line, "remote.<repository>.fetch" values are used as the refspecs—they specify which refs to fetch and which local refs to update
git fetch repository_alias
git fetch origin
# When git fetch is run with explicit branches and/or tags to fetch on the command line the <refspec>s given on the command line determine what are to be fetched. The remote.<repository>.fetch values determine which remote-tracking branch, if any, is updated.
git fetch repository_alias ref_spec
# The format of a <refspec> parameter is an optional plus + which indicates the branch will be updated even if it does not fast-forward; followed by the source <src>, followed by a colon :, followed by the destination ref <dst>.
git fetch repository_alias remote_branch:local_branch
git fetch repository_alias +remote_branch:local_branch
git fetch origin main:
git fetch origin main # The colon can be omitted when <dst> is empty.
git fetch origin main:mybranch
git fetch repository_alias +remote_branch1:local_branch1 remote_branch2:local_branch2
git fetch origin +main:master hotfix:bugfix

git fetch group_name
git fetch group_name repository_name
# --multiple: Allow several <repository> and <group> arguments to be specified. No <refspec>s may be specified.
git fetch --multiple repository_alias1 repository_alias2
git fetch --multiple group_name
# --all: Fetch all remotes.
git fetch --all
#--dry-run: Show what would be done, without making any changes.
git fetch --dry-run

# It's a good practice to do a git pull to ensure we have our local repository up to date with the remote repository before doing the git push command
# git push: Update remote refs along with associated objects. Sends the changes to a remote repository.
git push # Works like git push <remote>, where <remote> is the current branch’s remote (or origin, if no remote is configured for the current branch)
git push repository_url
git push git@github.com:Luedvi/test.git
git push repository_alias
git push repository_alias branch_name
git push origin master # Find a ref that matches master in the source repository and update the same ref in origin repository with it. If master did not exist remotely, it would be created
git push origin HEAD # A handy way to push the current branch to the same name on the remote.
git push origin # Without additional configuration, pushes the current branch to the configured upstream if it has the same name as the current branch, and errors out without pushing otherwise.
git push origin : # Push "matching" branches to origin
git push repository_alias source_branch:destination_branch
git push origin master:main
git push mothership master:satellite/master dev:satellite/dev
git push origin HEAD:master # Push the current branch to the remote ref matching master in the origin repository. This form is convenient to push the current branch without thinking about its local name.
git push origin :experimental # Find a ref that matches experimental in the origin repository, and delete it
git push origin master:refs/heads/experimental # Create the branch experimental in the origin repository by copying the current master branch. This form is only needed to create a new branch or tag in the remote repository when the local name and the remote name are different; otherwise, the ref name on its own will work.
git push repository_alias :branch_to_delete new_branch_to_add
git push repository_alias tag_name
git push origin v0.1
# --tags: All refs under refs/tags are pushed, in addition to refspecs explicitly listed on the command line
git push repository_alias --tags
git push origin --tags
# If we want to delete a tag from a remote repository we do this command. <refspec>: Specify what destination ref to update with what source object. The format of a <refspec> parameter is an optional plus +, followed by the source object <src>, followed by a colon :, followed by the destination ref <dst>.The <src> is often the name of the branch you would want to push, but it can be any arbitrary "SHA-1 expression". Pushing an empty <src> allows you to delete the <dst> ref from the remote repository
git push repository_alias :refs/tags/tag_name
git push origin :refs/tags/v0.1
git push repository_alias :tag_name
git push origin :v0.1
#-u, --set-upstream: For every branch that is up to date or successfully pushed, add upstream (tracking) reference, used by argument-less git-pull and other commands
git push -u repository_alias branch_name
git push --set-upstream origin main
# --all: Push all branches (i.e. refs under refs/heads/); cannot be used with other <refspec>.
git push repository_alias --all
#--prune: Remove remote branches that don’t have a local counterpart.
git push repository_alias --prune
# -n, --dry-run: Do everything except actually send the updates.
git push repository_alias branch_name -n
git push repository_alias branch_name --dry-run
# -d, --delete: All listed refs are deleted from the remote repository. This is the same as prefixing all refs with a colon.
git push repository_alias branch_name -d
git push repository_alias branch_name --delete
git push repository_alias tag_name -d

# git pull: Fetch from and integrate with another repository or a local branch. Download the changes of a repository
git pull
git pull repository_url
git pull git@github.com:Luedvi/test.git
git pull repository_alias
git pull origin
git pull repository_alias branch_name
git pull origin main
git pull repository_alias source_branch:destination_branch
git pull origin main:master
# --allow-unrelated-histories: By default, git merge command refuses to merge histories that do not share a common ancestor. This option can be used to override this safety when merging histories of two projects that started their lives independently
git pull repository_alias branch_name --allow-unrelated-histories
# -t, --tags: Fetch all tags from the remote (i.e., fetch remote tags refs/tags/* into local tags with the same name), in addition to whatever else would otherwise be fetched. Using this option alone does not subject tags to pruning, even if --prune is used (though tags may be pruned anyway if they are also the destination of an explicit refspec; see --prune).
git pull -t
git pull --tags
# --ff-only: Only update to the new history if there is no divergent local history. This is the default when no method for reconciling divergent histories is provided (via the --rebase=* flags).
git pull --ff-only
# --ff: when possible resolve the merge as a fast-forward (only update the branch pointer to match the merged branch; do not create a merge commit). When not possible (when the merged-in history is not a descendant of the current history), create a merge commit. When merging rather than rebasing, specifies how a merge is handled when the merged-in history is already a descendant of the current history. If merging is requested, --ff is the default unless merging an annotated (and possibly signed) tag that is not stored in its natural place in the refs/tags/ hierarchy, in which case --no-ff is assumed.
git pull --ff
# --no-ff: create a merge commit in all cases, even when the merge could instead be resolved as a fast-forward.
git pull --no-ff
# -r, --rebase[=false|true|merges|interactive]: When true, rebase the current branch on top of the upstream branch after fetching.
git pull -r
git pull --rebase=true
git pull --rebase
git pull --rebase repository_alias
# --no-rebase: This is shorthand for --rebase=false. When false, merge the upstream branch into the current branch.
git pull --no-rebase
git pull --rebase=false
# --all: Fetch all remotes.
git pull repository_alias --all

# git remote: Manage the set of repositories ("remotes") whose branches you track. With no arguments, shows a list of existing remotes
# git remote show: Gives some information about the remote <name>. This is the default if no arguments
git remote show 
git remote
# -v, --verbose: Be a little more verbose and show remote url after name
git remote -v
git remote --verbose add repository_alias repository_url
# git remote add: Add a remote named "repository_alias" for the repository at "repository_url". The command "git fetch repository_alias" can then be used to create and update remote-tracking branches "repository_alias/branch_name". The default name for the repository_alias that is commonly used is "origin"
git remote add repository_alias repository_url
git remote add origin https://github.com/user/my_project.git
git remote add upstream https://github.com/user/other_project.git
# -f: git fetch repository_alias is run immediately after the remote information is set up.
git remote add -f repository_alias repository_url
# --tags: git fetch repository_alias imports every tag from the remote repository. By default, only tags on fetched branches are imported
git remote add --tags repository_alias repository_url
# --no-tags: git fetch repository_alias does not import tags from the remote repository.
git remote add --no-tags repository_alias repository_url
# -t <branch_name>: instead of the default glob refspec for the remote to track all branches under the refs/remotes/repository_alias/ namespace, a refspec to track only <branch_name> is created. You can give more than one -t <branch_name> to track multiple branches without grabbing all branches.
git remote add -t branch_name repository_alias repository_url
git remote add -t branch_name1 -t branch_name2 repository_alias repository_url
# -m <master_branch_name>: a symbolic-ref refs/remotes/repository_alias/HEAD is set up to point at remote’s <master> branch
git remote add -m master_branch_name repository_alias repository_url
# --mirror=fetch: a fetch mirror is created, the refs will not be stored in the refs/remotes/ namespace, but rather everything in refs/ on the remote will be directly mirrored into refs/ in the local repository. This option only makes sense in bare repositories, because a fetch would overwrite any local commits.
git remote add --mirror=fetch repository_alias repository_url
# --mirror=push: a push mirror is created, then git push will always behave as if --mirror was passed.
git remote add --mirror=push repository_alias repository_url
# git remote get-url: Retrieves the URLs for a remote. Configurations for insteadOf and pushInsteadOf are expanded here. By default, only the first URL is listed.
git remote get-url repository_alias
# --push: push URLs are queried rather than fetch URLs.
git remote get-url --push repository_alias
# --all: all URLs for the remote will be listed.
git remote get-url --all repository_alias
# git remote rename: Rename the remote named old_name to new_name. All remote-tracking branches and configuration settings for the remote are updated.
git remote rename old_name new_name
# git remote remove, rm: Remove the remote repository. All remote-tracking branches and configuration settings for the remote are removed.
git remote remove repository_alias
git remote rm repository_alias
# git remote prune: Deletes stale references associated with repository_alias if another developer deleted one or more remote branches. By default, stale remote-tracking branches under repository_alias are deleted, but depending on global configuration and the configuration of the remote we might even prune local tags that haven’t been pushed there. Equivalent to git fetch --prune repository_alias, except that no new references will be fetched.
git remote prune repository_alias
git remote prune -n repository_alias # With --dry-run option, report what branches would be pruned, but do not actually prune them.
git remote prune --dry-run repository_alias
# git remote set-url: Changes URLs for the remote. Sets first URL for remote <repository_alias> that matches regex <oldurl> (first URL if no <oldurl> is given) to <newurl>. If <oldurl> doesn’t match any URL, an error occurs and nothing is changed.
git remote set-url repository_alias new_url
git remote set-url repository_alias new_url old_url
# --push: push URLs are manipulated instead of fetch URLs.
git remote set-url --push repository_alias new_url
git remote set-url --push repository_alias new_url old_url
# --add: instead of changing existing URLs, new URL is added.
git remote set-url --add repository_alias new_url
git remote set-url --add repository_alias new_url old_url
git remote set-url --add --push repository_alias new_url
git remote set-url --add --push repository_alias new_url old_url
# --delete: instead of changing existing URLs, all URLs matching regex <url> are deleted for remote <repository_alias>. Trying to delete all non-push URLs is an error.
git remote set-url --delete repository_alias regex_url
git remote set-url --delete --push repository_alias regex_url
# git remote set-branches: Changes the list of branches tracked by the named remote. This can be used to track a subset of the available remote branches after the initial setup for a remote. The named branches will be interpreted as if specified with the -t option on the "git remote add" command line.
git remote set-branches repository_alias branch_name
git remote set-branches repository_alias branch_name1 branch_name2
# --add: instead of replacing the list of currently tracked branches, adds to that list.
git remote set-branches --add repository_alias branch_name
git remote set-branches --add repository_alias branch_name1 branch_name2
# git remote set-head: Sets or deletes the default branch (i.e. the target of the symbolic-ref refs/remotes/<repository_alias>/HEAD) for the named remote. Having a default branch for a remote is not required, but allows the name of the remote to be specified in lieu of a specific branch. For example, if the default branch for "origin" is set to "master", then "origin" may be specified wherever you would normally specify "origin/master". Use <new_default_branch> to set the symbolic-ref refs/remotes/<repository_alias>/HEAD explicitly. e.g., "git remote set-head origin master" will set the symbolic-ref refs/remotes/origin/HEAD to refs/remotes/origin/master. This will only work if refs/remotes/origin/master already exists; if not it must be fetched first.
git remote set-head repository_alias new_default_branch
# -d or --delete: the symbolic ref refs/remotes/<repository_alias>/HEAD is deleted.
git remote set-head repository_alias -d
git remote set-head repository_alias --delete
# -a or --auto: the remote is queried to determine its HEAD, then the symbolic-ref refs/remotes/<repository_alias>/HEAD is set to the same branch. e.g., if the remote HEAD is pointed at feature1, git remote set-head origin -a will set the symbolic-ref refs/remotes/origin/HEAD to refs/remotes/origin/feature1. This will only work if refs/remotes/origin/feature1 already exists; if not it must be fetched first.
git remote set-head repository_alias -a
git remote set-head repository_alias --auto

# git-gui: is a Tcl/Tk based graphical user interface to Git
sudo apt install git-gui
git gui
# gitk: Displays changes in a repository or a selected set of commits. This includes visualizing the commit graph, showing information related to each commit, and the files in the trees of each revision
gitk

# git stash: Stash the changes in a dirty working directory away. By default It only stash tracked files. Use git stash when you want to record the current state of the working directory and the index, but want to go back to a clean working directory. The command saves your local modifications away and reverts the working directory and index to match the HEAD commit. Calling git stash without any arguments is equivalent to "git stash push", for quickly making a snapshot, you can omit "push"
git stash
git stash push
# -m, --message: The <message> part is optional and gives the description along with the stashed state. A stash is by default listed as "WIP on branchname ...", but you can give a more descriptive message on the command line when you create one. WIP refers to Work In Progress.
git stash -m "the message"
git stash push -m "the message"
git stash push --message "the message"
# -u, --include-untracked: When used with the "git stash push" command, all untracked files are also stashed and then cleaned up with git clean.
git stash push -u
git stash push --include-untracked
# -a, --all: All ignored and untracked files are also stashed and then cleaned up with git clean.
git stash push -a
git stash push --all
# -p, --patch: Interactively select hunks from the diff between HEAD and the working tree to be stashed. The stash entry is constructed such that its index state is the same as the index state of your repository, and its worktree contains only the changes you selected interactively. The selected changes are then rolled back from your worktree. The --patch option implies "--keep-index", You can use "--no-keep-index" to override this.
git stash push -p
git stash push --patch
# -k, --keep-index: All changes already added to the index are left intact.
git stash -k
git stash push --keep-index
# --no-keep-index: overrides the "--patch" option
git stash -p --no-keep-index
# -- pathspec: "--" Separates pathspec from options for disambiguation purposes. The new stash entry records the modified states only for the files that match the pathspec. The index entries and working tree files are then rolled back to the state in HEAD only for these files, too, leaving files that do not match the pathspec intact.
git stash -- pathspec
git stash push -- pathspec
git stash -- ./file1.txt ./file2.txt
# git stash list [<log-options>]: List the stash entries that you currently have. Each stash entry is listed with its name (e.g.  stash@{0} is the latest entry, stash@{1} is the one before, etc.), the name of the branch that was current when the entry was made, and a short description of the commit the entry was based on. The command takes options applicable to the "git log" command to control what is shown and how
git stash list
git stash list --oneline
# git stash show [-u|--include-untracked|--only-untracked] [<diff-options>] [<stash>]: Show the changes recorded in the stash entry as a diff between the stashed contents and the commit back when the stash entry was first created. By default, the command shows the diffstat, but it will accept any format known to git diff (e.g., "git stash show -p stash@{1}" to view the second most recent entry in patch form). If no <diff-option> is provided, the default behavior will be given by the "stash.showStat", and "stash.showPatch" config variables. You can also use "stash.showIncludeUntracked" to set whether --include-untracked is enabled by default.  When no "stash_entry" is given, the latest stash is assumed (that is, stash@{0})
git stash show
git stash show stash_entry
git stash show stash@{0}
git stash show -p
git stash show -p stash@{0}
git stash show stash@{2.hours.ago}
git stash show stash@{0} -p > patch_file.patch
#  -u, --include-untracked: When used with the show command, show the untracked files in the stash entry as part of the diff.
git stash show -u
git stash show --include-untracked
# --only-untracked: Show only the untracked files in the stash entry as part of the diff.
git stash show --only-untracked
# git stash pop [--index] [-q|--quiet] [<stash>]: Remove a single stashed state from the stash list and apply it on top of the current working tree state, i.e., do the inverse operation of "git stash push". The working directory must match the index. Applying the state can fail with conflicts; in this case, it is not removed from the stash list. You need to resolve the conflicts by hand and call "git stash drop" manually afterwards.
# When fixing stash merge conflicts we can skip the commit and just stage the files if we prefer, also is a good practice to make a commit at the end to document the stash merge.
git stash pop
git stash pop stash_entry
# The latest stash you created is stored in refs/stash; older stashes are found in the reflog of this reference and can be named using the usual reflog syntax (e.g. stash@{0} is the most recently created stash, stash@{1} is the one before it, stash@{2.hours.ago} is also possible). Stashes may also be referenced by specifying just the stash index (e.g. the integer n is equivalent to stash@{n}).
git stash pop stash@{1}
git stash pop 1
# git stash apply [--index] [-q|--quiet] [<stash>]: Like "git stash pop", but do not remove the state from the stash list. Unlike "git stash pop", <stash> may be any commit that looks like a commit created by "stash push" or "stash create"
git stash apply
git stash apply stash_entry
git stash apply 0
# --index: Tries to reinstate not only the working tree’s changes, but also the index’s ones. However, this can fail, when you have conflicts (which are stored in the index, where you therefore can no longer apply the changes as they were originally).
git stash pop stash_entry --index
git stash apply stash_entry --index
# git stash branch <branchname> [<stash>]: Creates and checks out a new branch named <branchname> starting from the commit at which the <stash> was originally created, applies the changes recorded in <stash> to the new working tree and index. If that succeeds, and <stash> is a reference of the form stash@{<revision>}, it then drops the <stash>. This is useful if the branch on which you ran "git stash push" has changed enough that "git stash apply" fails due to conflicts. Since the stash entry is applied on top of the commit that was HEAD at the time git stash was run, it restores the originally stashed state with no conflicts.
git stash branch new_branch_name
git stash branch new_branch_name stash_entry
git stash branch testing stash@{2}
git stash branch testing 2
# git stash drop [-q|--quiet] [<stash>]: Remove a single stash entry from the list of stash entries
git stash drop
git stash drop stash_entry
git stash drop stash@{0}
git stash drop 0
# git stash clear: Remove all the stash entries. Note that those entries will then be subject to pruning, and may be impossible to recover
git stash clear

# git worktree add: creates the "path" and a new branch whose name is the final component of "path". If the branch doesn’t exist, a new branch based on HEAD is automatically created as if -b <branch> was given. If the branch does exist, it will be checked out in the new working tree, if it’s not checked out anywhere else, otherwise the command will refuse to create the working tree (unless --force is used). The new working directory is linked to the current repository, sharing everything except working directory specific files such as HEAD, index, etc.
git worktree add ../path/new_worktree
git worktree add ../hotfix  # creates new branch "hotfix" and checks it out at path ../hotfix
git worktree add ../main  # checks out the branch "main" at path ../main
git worktree add ../path/new_worktree commit_id
git worktree add ../path/new_worktree existing_branch
git worktree add ../hotfix 2q6349  # Creates path ../hotfix and checkout commit "2q6349" into it
git worktree add ../hotfix main  # Creates path ../hotfix and checkout branch "main" into it
git worktree add ../path/new_worktree -  # As a convenience, <commit-ish> may be a bare "-", which is synonymous with @{-1}.
# -b <new-branch>, -B <new-branch>: create a new branch named <new-branch> starting at <commit-ish>, and check out <new-branch> into the new working tree. If <commit-ish> is omitted, it defaults to HEAD. By default, -b refuses to create a new branch if it already exists.  -B overrides this safeguard, resetting <new-branch> to <commit-ish>.
git worktree add ../path/new_worktree existing_branch -b new_branch
git worktree add ../path/new_worktree -B new_branch
# -d, --detach: detach HEAD in the new working tree
git worktree add ../path/new_worktree -d
git worktree add ../path/new_worktree existing_branch --detach
# -f, --force: By default, add refuses to create a new working tree when <commit-ish> is a branch name and is already checked out by another working tree, or if <path> is already assigned to some working tree but is missing (for instance, if <path> was deleted manually). This option overrides these safeguards. To add a missing but locked working tree path, specify --force twice.
git worktree add ../path/new_worktree existing_branch -f
git worktree add ../path/new_worktree existing_branch --force
# --[no-]track: When creating a new branch, if <commit-ish> is a branch, mark it as "upstream" from the new branch. This is the default if <commit-ish> is a remote-tracking branch.
git worktree add ../path/new_worktree existing_branch -b new_branch --track
git worktree add ../path/new_worktree existing_branch -b new_branch --no-track
# If <commit-ish> is a branch name and is not found, and neither -b nor -B nor --detach are used, but there does exist a tracking branch in exactly one remote with a matching name, treat as equivalent to:
git worktree add ../path/new_worktree repository_alias/branch_name --track -b branch_name
git worktree add ../path/new_worktree branch_name_in_remote
git worktree add ../feature1 feature1
git worktree add ../feature1 origin/feature1 --track -b feature1
# --[no-]guess-remote: With worktree add <path>, without <commit-ish>, instead of creating a new branch from HEAD, if there exists a tracking branch in exactly one remote matching the basename of <path>, base the new branch on the remote-tracking branch, and mark the remote-tracking branch as "upstream" from the new branch.
git worktree add ../path/new_worktree --guess-remote
git worktree add ../path/new_worktree --no-guess-remote
# --lock: Keep the working tree locked after creation. This is the equivalent of "git worktree lock" after "git worktree add", but without a race condition.
git worktree add ../path/new_worktree --lock
# --reason <string>: an explanation why the working tree is locked.
git worktree add ../path/new_worktree --lock --reason "string_message"
# git worktree list: List details of each working tree. The main working tree is listed first, followed by each of the linked working trees. The output details include whether the working tree is bare, the revision currently checked out, the branch currently checked out (or "detached HEAD" if none), "locked" if the worktree is locked, "prunable" if the worktree can be pruned by prune command.
git worktree list
# -v, --verbose: output additional information about worktrees.
git worktree list -v
git worktree list --verbose
# --expire <time>: annotate missing working trees as prunable if they are older than <time>.
git worktree list --expire 1.week.ago
# git worktree lock: If a working tree is on a portable device or network share which is not always mounted, lock it to prevent its administrative files from being pruned automatically. This also prevents it from being moved or deleted.
git worktree lock absolute/path/to/existing_worktree
git worktree lock ../path/existing_worktree
git worktree lock existing_worktree  # If the last path components in the working tree’s path is unique among working trees, it can be used to identify a working tree. For example if you only have two working trees, at /abc/def/ghi and /abc/def/ggg, then ghi or def/ghi is enough to point to the former working tree.
git worktree lock ./existing_worktree --reason "string message"  # Optionally, specify a reason for the lock.
# git worktree unlock: Unlock a working tree, allowing it to be pruned, moved or deleted.
git worktree unlock ./existing_worktree
# git worktree move: Move a working tree to a new location. Note that the main working tree or linked working trees containing submodules cannot be moved with this command.
git worktree move existing_worktree ../new/path
# -f, --force: move refuses to move a locked working tree unless --force is specified twice. If the destination is already assigned to some other working tree but is missing (for instance, if <new-path> was deleted manually), then --force allows the move to proceed; use --force twice if the destination is locked.
git worktree move existing_worktree ../new/path/deleted/manually -f
git worktree move existing_worktree ../locked/new/path -ff
git worktree move locked_worktree ../new/path --force --force
# git worktree prune: Prune working tree information in $GIT_DIR/worktrees. Remove references to worktrees that have been deleted manually or that no longer exist.
git worktree prune
# -n, --dry-run: do not remove anything; just report what it would remove.
git worktree prune -n
git worktree prune --dry-run
# v, --verbose: report all removals.
git worktree prune -v
git worktree prune --verbose
# --expire <time>:only expire unused working trees older than <time>.
git worktree prune --expire yesterday
# git worktree remove: Remove a working tree. Only clean working trees (no untracked files and no modification in tracked files) can be removed.
git worktree remove existing_worktree
# --force: remove unclean working trees or ones with submodules. The main working tree cannot be removed. To remove a locked working tree, specify --force twice.
git worktree remove unclean_worktree --force
git worktree remove locked_worktree -ff
# git worktree repair [<path>...]: Repair working tree administrative files, if possible, if they have become corrupted or outdated due to external factors.
git worktree repair  # if the main working tree (or bare repository) is moved, linked working trees will be unable to locate it. Running repair in the main working tree will reestablish the connection from linked working trees back to the main working tree. Similarly, if a linked working tree is moved without using "git worktree move", the main working tree (or bare repository) will be unable to locate it. Running repair within the recently-moved working tree will reestablish the connection.
git worktree repair ../path/moved_worktree1 ../path/moved_worktree2  # If multiple linked working trees are moved, running repair from any working tree with each tree’s new <path> as an argument, will reestablish the connection to all the specified paths. If both the main working tree and linked working trees have been moved manually, then running repair in the main working tree and specifying the new <path> of each linked working tree will reestablish all connections in both directions.

# git clean: Remove untracked files from the working tree. Cleans the working tree by recursively removing files that are not under version control, starting from the current directory. Normally, only files unknown to Git are removed, but if the -x option is specified, ignored files are also removed. This can, for example, be useful to remove all build products. If any optional <path>... arguments are given, only those paths are affected.
git clean
git clean path/to/files
# -n, --dry-run: Don’t actually remove anything, just show what would be done
git clean -n
git clean --dry-run
# -i, --interactive: Show what would be done and clean files interactively
git clean -i
# -f, --force: If the Git configuration variable "clean.requireForce" is not set to false, git clean will refuse to delete files or directories unless given -f or -i. Git will refuse to modify untracked nested git repositories (directories with a .git subdirectory) unless a second -f is given
git clean -f
git clean --force
# -e <pattern>, --exclude=<pattern>: Use the given exclude pattern in addition to the standard ignore rules (gitignore)
git clean -e name_pattern
git clean -e "*.png"
# -x: Don’t use the standard ignore rules (gitignore), but still use the ignore rules given with -e options from the command line. This allows removing all untracked files, including build products. This can be used (possibly in conjunction with git restore or git reset) to create a pristine working directory to test a clean build
git clean -xf
# -X: Remove only files ignored by Git. This may be useful to rebuild everything from scratch, but keep manually created files
git clean -Xf
# -d: Normally, when no <path> is specified, git clean will not recurse into untracked directories to avoid removing too much. Specify -d to have it recurse into such directories as well. If any paths are specified, -d is irrelevant; all untracked files matching the specified paths (with exceptions for nested git directories mentioned under --force) will be removed
git clean -df

# git cherry-pick: Apply the changes introduced by some existing commits. Given one or more existing commits, apply the change each one introduces, recording a new commit for each. This requires your working tree to be clean (no modifications from the HEAD commit).
git cherry-pick commit_hash
git cherry-pick commit_hash1 commit_hash2
git cherry-pick first_commit_hash..last_commit_hash
git cherry-pick first_commit_hash^..last_commit_hash
git cherry-pick branch_name # this takes the HEAD of the chosen branch
# -e, --edit: With this option, git cherry-pick will let you edit the commit message prior to committing
git cherry-pick -e commit_hash
git cherry-pick --edit commit_hash
# -x: When recording the commit, append a line that says "(cherry picked from commit ...)" to the original commit message in order to indicate which commit this change was cherry-picked from. This is done only for cherry picks without conflicts. Do not use this option if you are cherry-picking from your private branch because the information is useless to the recipient. If on the other hand you are cherry-picking between two publicly visible branches (e.g. backporting a fix to a maintenance branch for an older release from a development branch), adding this information can be useful
git cherry-pick -x commit_hash
# -n, --no-commit: Usually the command automatically creates a sequence of commits. This flag applies the changes necessary to cherry-pick each named commit to your working tree and the index, without making any commit. In addition, when this option is used, your index does not have to match the HEAD commit. The cherry-pick is done against the beginning state of your index. This is useful when cherry-picking more than one commits' effect to your index in a row.
git cherry-pick -n commit_hash1 commit_hash2
git cherry-pick --no-commit commit_hash1 commit_hash2

# Reference logs, or "reflogs", record when the tips of branches and other references were updated in the local repository. Reflogs are useful in various Git commands, to specify the old value of a reference. For example, HEAD@{2} means "where HEAD used to be two moves ago", master@{one.week.ago} means "where master used to point to one week ago in this local repository", and so on. 
# 1.minute.ago
# 1.hour.ago
# 1.day.ago
# yesterday
# 1.week.ago
# 1.month.ago
# 1.year.ago
# 2011-05-17.09:00:00
# You can also have a combination of time qualifiers (e.g. 1.week.3.hours.ago), and plural forms (e.g. 5.hours.ago)


# git reflog: Manage reflog information. The "show" subcommand is the default in the absence of any subcommands, shows the log of the reference provided in the command-line (or HEAD, by default). The reflog covers all recent actions, and in addition the HEAD reflog records branch switching. git reflog show is an alias for "git log -g --abbrev-commit --pretty=oneline". It accepts any of the options accepted by "git log"
git reflog
git reflog branch_name
git reflog file_name.txt
git reflog -- file_name.txt

git reflog show
git reflog show reference_name
git reflog show HEAD
git reflog show HEAD@{2}

git reflog show branch_name
git reflog show testing
git reflog show master@{one.week.ago}
git reflog show --all
git reflog stash
# git reflog expire: prunes older reflog entries. Entries older than "expire" time, or entries older than "expire-unreachable" time and not reachable from the current tip, are removed from the reflog
git reflog expire
# -n, --dry-run: Do not actually prune any entries; just show what would have been pruned
git reflog expire -n
git reflog expire --dry-run
#--all: Process the reflogs of all references
git reflog expire --all
git reflog expire -n --all
# --single-worktree: By default when --all is specified, reflogs from all working trees are processed. This option limits the processing to reflogs from the current working tree only
git reflog expire --single-worktree
git reflog expire -n --single-worktree
# --expire=<time>: Prune entries older than the specified time. If this option is not specified, the expiration time is taken from the configuration setting gc.reflogExpire, which in turn defaults to 90 days. "--expire=all" prunes entries regardless of their age; "--expire=never" turns off pruning of reachable entries
git reflog expire --expire=30
git reflog expire -n --expire=30
git reflog expire -n --expire=10 --all
# --expire-unreachable=<time>: Prune entries older than <time> that are not reachable from the current tip of the branch. If this option is not specified, the expiration time is taken from the configuration setting gc.reflogExpireUnreachable, which in turn defaults to 30 days.  --expire-unreachable=all prunes unreachable entries regardless of their age; --expire-unreachable=never turns off early pruning of unreachable entries
git reflog expire --expire-unreachable=10
git reflog expire -n --expire-unreachable=10
# git reflog delete: deletes single entries from the reflog. Its argument must be an exact entry (e.g. "git reflog delete master@{2}")
git reflog delete reference_name
git reflog delete HEAD@{19}
git reflog delete -n HEAD@{3}

# git grep: Print lines matching a pattern. Look for specified patterns in the tracked files in the work tree, blobs registered in the index file, or blobs in given tree objects. Patterns are lists of one or more search expressions separated by newline characters. An empty string as search expression matches all lines
git grep regex_pattern
# -n, --line-number: Prefix the line number to matching lines
git grep -n regex_pattern
git grep --line-number "regex_pattern"
# -c, --count: Instead of showing every matched line, show the number of lines that match
git grep -c regex_pattern
git grep --count "regex_pattern"

# git blame: Show what revision and author last modified each line of a file. Annotates each line in the given file with information from the revision which last modified the line. Optionally, start annotating from the given revision.
git blame file_name
# -c: Use the same output mode as "git annotate" (Default: off)
git blame file_name -c
git annotate file_name
# -L <start>,<end>, -L :<funcname> Annotate only the line range given by <start>,<end>, or by the function name regex <funcname>. With regex form it will use the first line matching the given POSIX regex. -L option may be specified multiple times. Overlapping ranges are allowed
git blame file_name -L start_range,end_range
git blame file_name -L :regex_pattern

git blame file.txt -L :"some string"
git blame file.txt -L :some_string
git blame file.txt -L 3,8
git blame file.txt -L 3,
git blame file.txt -L ,8

git blame file.txt -L 2,4 -L 7,10 # When specified one or more times, -L restricts annotation to the requested lines.
git blame file.txt -L :some_string -L :another_string
git blame file.txt -L 4,8 -L ^:some_string # If <start> is a regex, it will search from the end of the previous -L range, if any, otherwise from the start of file. If <start> is ^/regex/, it will search from the start of file. If <end> is a regex, it will search starting at the line given by <start>.

# git archive: Creates an archive of the specified format containing the tree structure for the named tree, and writes it out to the standard output. If <prefix> is specified it is prepended to the filenames in the archive.
git archive commit_hash > archive_name.tar
git archive tag_name > archive_name.tar
git archive branch_name > archive.tar
git archive commit_hash file_name1 file_name2 directory_name/ > archive_name.tar
# --format=<fmt>: Format of the resulting archive: tar or zip. If this option is not given, and the output file is specified, the format is inferred from the filename if possible (e.g. writing to "foo.zip" makes the output to be in the zip format). Otherwise the output format is tar.
git archive --format=tar tag_name > archive_name.tar
git archive --format=zip commit_hash > archive_name.zip
# -<digit>: Specify compression level. Larger values allow the command to spend more time to compress to smaller size. Supported values are from -0 (store-only) to -9 (best ratio). Default is -6 if not given.
git archive 123e --format=zip -0 > archive_name.zip
git archive 123e --format=zip -9 > archive_name.zip
# -o <file>, --output=<file>: Write the archive to <file> instead of stdout.
git archive -o archive_name.tar commit_hash
git archive --output=archive_name.tar commit_hash
git archive --prefix=string_prefix -o archive_name.tar.gz tag_name
# -l, --list: Show all available formats.
git archive -l
git archive --list
# --prefix=<prefix>/: Prepend <prefix>/ to each filename in the archive.
git archive --prefix=string_prefix commit_hash
git archive --format=tar --prefix=string_prefix tag_name | gzip > archive_name.tar.gz
git archive --format=tar.gz --prefix=string_prefix tag_name > archive_name.tar.gz
git archive --format=zip --prefix=string_prefix/ HEAD:directory_name/ > archive_name.zip
# --add-file=<file>: Add a non-tracked file to the archive. Can be repeated to add multiple files. The path of the file in the archive is built by concatenating the value for --prefix (if any) and the basename of <file>.
git archive commit_hash --add-file=file_name
# --remote=<repo>: Instead of making a tar archive from the local repository, retrieve a tar archive from a remote repository
git archive commit_hash --remote=repository_alias -o archive_name.tar
# --exec=<git-upload-archive>: Used with --remote to specify the path to the git-upload-archive on the remote side.
git archive commit_hash --remote=repository_alias --exec=command_name

#.gitignore: a file where we write patterns to be ignored, it is located in the root of the repository

# Pattern             # ignored files                  # Not ignored
**/logs               logs/debug.log
                    logs/monday/foo.bar
                    build/logs/debug.log
                    
**/logs/debug.log     logs/debug.log
                    builds/logs/debug.log          logs/build/debug.log

*.log                     debug.log
                            foo.log
                        logs/debug.log

*.log                      debug.log                    important.log
!important.log             trace.log                    logs/important.log

# Patterns defined after anulation pattern ignore again previously annulated files
*.log                       debug.log                    important/debug.log
!important/*.log        important/trace.log
trace.*

# Only files in the root directory of the repository
/debug.log                 debug.log                     logs/debug.log

# Patterns ignore files in any directory by default
debug.log                 debug.log
                        logs/debug.log

debug?.log              debug0.log                        debug10.log
                        debug.log

debug[01].log           debug0.log                         debug2.log
                        debug1.log                        debug01.log

debug[0-9].log          debug0.log                       debug10.log
                        debug1.log

debug[!01].log         debug2.log                       debug0.log
                                                        debug1.log
                                                        debug01.log

debug[a-z].log          debuga.log                       debug1.log
                        debugb.log
# Files and directory content that matches the pattern
logs                   logs 
                    logs/latest/foo.bar 
                    build/logs 
                    build/logs/debug.log
                    
# All content of any directory named after the pattern
logs/               logs/debug.log 
                    logs/latest/foo.bar 
                    build/logs/foo.bar 
                    build/logs/latest/debug.log
                    
# Can’t annulate a file that matches a directory pattern
logs/                     logs/debug.log
!logs/important.log       logs/important.log

# Any directories in between
logs/**/debug.log         logs/debug.log 
                        logs/monday/debug.log 
                        logs/monday/pm/debug.log 

logs/*day/debug.log     logs/monday/debug.log 
                        logs/tuesday/debug.log             logs/latest/debug.log

# Patterns that specify a file from a particular directory are linked to the root of the repo, the “/” at the start is optional "/logs/debug.log"
logs/debug.log          logs/debug.log                      debug.log 
                                                            build/logs/debug.log

# git check-ignore: For each pathname given via the command-line or from a file via --stdin, check whether the file is excluded by .gitignore (or other input files to the exclude mechanism) and output the path if it is excluded.
git check-ignore file_name
# -v, --verbose: Instead of printing the paths that are excluded, for each path that matches an exclude pattern, print the exclude pattern together with the path. (Matching an exclude pattern usually means the path is excluded, but if the pattern begins with "!" then it is a negated pattern and matching it means the path is NOT excluded.)
git check-ignore -v file_name1 file_name2
git check-ignore --verbose file_pattern1 file_pattern2

# git bisect: Use binary search to find the commit that introduced a bug
git bisect start
git bisect bad
git bisect good v2.6.13-rc2

# git filter-branch: Lets you rewrite Git revision history by rewriting the branches mentioned in the <rev-list options>, applying custom filters on each revision.
git filter-branch
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch **path/to/file_name.txt** " --prune-empty --tag-name-filter cat -- --all

# git gc: Cleanup unnecessary files and optimize the local repository. Runs a number of housekeeping tasks within the current repository, such as compressing file revisions (to reduce disk space and increase performance), removing unreachable objects which may have been created from prior invocations of git add, packing refs, pruning reflog, rerere metadata or stale working trees. May also update ancillary indexes such as the commit-graph.
git gc

# to show the branch in the terminal prompt we can write either of this lines in the ~/.bashrc file
PS1='\u@\h\[\033[01;34m\] \w\[\033[0;32m\]$(__git_ps1 " (%s)")\[\033[01;34m\]$\[\033[00m\] '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;35m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '

# https://www.toptal.com/developers/gitignore

# https://github.com/github/gitignore

# https://www.atlassian.com/es/git/tutorials/saving-changes/gitignore#git-ignore-patterns

# https://stackoverflow.com/questions/4044368/what-does-tree-ish-mean-in-git

# https://git-scm.com/book/en/v2

# https://www.hostinger.mx/tutoriales/comandos-de-git

# https://github.com/jocode/Getting-Started/blob/master/git_cmd.md

#https://www.atlassian.com/es/git/tutorials/using-branches/merge-strategy

# https://www.atlassian.com/es/git/tutorials/comparing-workflows

# https://nvie.com/posts/a-successful-git-branching-model/
