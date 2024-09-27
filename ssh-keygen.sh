# ssh-keygen: generates, manages and converts authentication keys for ssh. It can create keys for use by SSH protocol version 2. This program generates the key and asks for a file in which to store the private key. The public key is stored in a file with the same name but “.pub” appended. If invoked without any arguments, ssh-keygen will generate an RSA key
ssh-keygen
# -t: Specifies the type of key to create.  The possible values are “dsa”, “ecdsa”, “ecdsa-sk”, “ed25519”, “ed25519-sk”, or “rsa”.
ssh-keygen -t dsa
ssh-keygen -t ed25519
# -b: Specifies the number of bits in the key to create. ECDSA-SK, Ed25519 and Ed25519-SK keys have a fixed length and the -b flag will be ignored.
ssh-keygen -b 3072
ssh-keygen -t rsa -b 3072
ssh-keygen -t dsa -b 1024
ssh-keygen -t ecdsa -b 521
# -C: Provides a new comment, The key comment may be useful to help identify the key. The comment is initialized to “user@host” when the key is created
ssh-keygen -C "new_comment"
ssh-keygen -C "my@email.com"
ssh-keygen -C "server_name"
# -f filename: Specifies the filename of the key file.
ssh-keygen -f path/to/key
ssh-keygen -f ~/.ssh/id_rsa
# -c: Requests changing the comment in the private and public key files. The program will prompt for the file containing the private keys, for the passphrase if the key has one, and for the new comment.
ssh-keygen -c
# -p: Requests changing the passphrase of a private key file instead of creating a new private key. The program will prompt for the file containing the private key, for the old passphrase, and twice for the new passphrase.
ssh-keygen -p
# ssh-agent: is a program to hold private keys used for public key authentication. Through use of environment variables the agent can be located and automatically used for authentication when logging in to other machines using ssh.
# There are two main ways to get an agent set up. The first is at the start of an X session, where all other windows or programs are started as children of the ssh-agent program.  The agent starts a command under which its environment variables are exported, for example ssh-agent xterm &. When the command terminates, so does the agent.
ssh-agent ssh-add -l
ssh-agent ssh-add ~/.ssh/id_ed25519
# The second method is used for a login session.  When ssh-agent is started, it prints the shell commands required to set its environment variables, which in turn can be evaluated in the calling shell, for example eval "ssh-agent -s"
ssh-agent
eval "ssh-agent -s"
# -s: Generate Bourne shell commands on stdout. This is the default if SHELL does not look like it's a csh style of shell
ssh-agent -s
# ssh-add: adds private key identities to the OpenSSH authentication agent. When run without arguments, it adds the files ~/.ssh/id_rsa, ~/.ssh/id_ecdsa, ~/.ssh/id_ecdsa_sk, ~/.ssh/id_ed25519, ~/.ssh/id_ed25519_sk, and ~/.ssh/id_dsa
ssh-add
ssh-add path/to/key
ssh-add ~/.ssh/id_rsa
ssh-add ~/.ssh/id_ed25519
# -L: Lists public key parameters of all identities currently represented by the agent
ssh-add -L
# -l: Lists fingerprints of all identities currently represented by the agent
ssh-add -l
# -D: Deletes all identities from the agent
ssh-add -D
# -d: Instead of adding identities, removes identities from the agent.  If ssh-add has been run without arguments, the keys for the default identities and their corresponding certificates will be removed
ssh-add -d
ssh-add -d ~/.ssh/id_rsa ~/.ssh/id_ed25519
# gpg: a tool to provide digital encryption and signing services using the OpenPGP standard
gpg
# ssh: Is a program for logging into a remote machine and for executing commands on a remote machine, it connects and logs into the specified destination, which may be specified as either [user@]hostname or a URI of the form ssh://[user@]hostname[:port]. The user must prove their identity to the remote machine using one of several methods
ssh user@hostname
# -T: Disable pseudo-terminal allocation.
ssh -T user@hostname
ssh -T git@github.com

# https://www.privex.io/articles/what-is-gpg
# https://superuser.com/questions/22535/what-is-randomart-produced-by-ssh-keygen