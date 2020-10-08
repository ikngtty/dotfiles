# Initialize macOS

1.  Install applications via App Store.
2.  Open Xcode and install command line tools.
    (Or `xcode-select --install`.)
3.  Open this repository in Safari.
4.  [Generate a new SSH key and add it to the ssh-agent.](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
    Contents in the link is below:

```
ssh-keygen -t rsa -b 4096 -C ikngtty@gmail.com
nano ~/.ssh/config                 # Modify as below.
```

```
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
 ForwardAgent yes
```

```
ssh-add -K ~/.ssh/id_rsa
```

5.  [Add the SSH key to my GitHub account.](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
    Contents in the link is below:
    `pbcopy < ~/.ssh/id_rsa.pub` and add the SSH key in [GitHub's settings page](https://github.com/settings/keys).
6.  Add the SSH key in [Bitbucket's settings page](https://bitbucket.org/account/user/ikngtty/ssh-keys/).
7.  Clone this repository.

```
    mkdir -p ~/Projects/src/github.com/ikngtty
    cd ~/Projects/src/github.com/ikngtty
    git clone git@github.com:ikngtty/dotfiles.git
    cd dotfiles
```

8.  `./init/macOS/adjust_mac.sh`.
9.  Reboot and `cd ~/Projects/src/github.com/ikngtty/dotfiles`.
10. `./config/dotfiles.sh deploy -q bash` and relogin bash to install comfortably.
11. `./init/macOS/install.sh | tee ~/Desktop/install.log`
12. `./init/macOS/set_up_shells.sh`
13. `./init/macOS/set_up_iTerm2.sh`
14. Follow [the manual](./manual.md).

TODO: Install GUI apps with `cask` command in `install.sh`.

TODO: It is necessary to execute below code for `pyenv`. (cf. <https://github.com/pyenv/pyenv/wiki>)

```sh
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
```

TODO: Create a script to generate a SSH key.
