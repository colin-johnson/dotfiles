#!/bin/zsh
# shellcheck source=/dev/null

# file path aliases
alias cabo='cd $HOME/opallabs/cabochon'
alias dev='cd $HOME/opallabs/cabochon/developer'
alias mono='cd $HOME/opallabs/cabochon/packages/monolith'
alias uni='cd $HOME/opallabs/cabochon/packages/universe'
alias kui='cd $HOME/opallabs/cabochon/packages/universe/packages/kuiper'
alias lapi='cd $HOME/opallabs/cabochon/packages/universe/packages/lapidary'
alias tach='cd $HOME/opallabs/cabochon/packages/universe/packages/tachyon'

# re-source bash profile updates in current terminal
alias update:bash-profile='source ~/.bash_profile'
alias update:zshrc='source ~/.zshrc'

# copies current git branch to clipboard
alias copy-branch="git branch | grep '^\*' | cut -d' ' -f2 | tr -d '\n' | pbcopy"

# remove all images from docker - frees up allocated hard drive space
alias run:docker-image-prune='docker image prune -af'

# run rails migrations for docker container
alias run:rails-migrate='yarn docker:rails:migrate'

# setup and run rails rspec test suite
alias run:rails-test-setup='yarn docker:rails:rspec:setup'
alias run:rails-test='yarn docker:rails:rspec'

# Begin tailing logs for a docker service
alias log:monolith='docker service logs --raw --tail 500 -f opal_monolith'
alias log:monolith-setup='docker service logs --raw --tail 500 -f opal_monolith-setup'
alias log:universe='docker service logs --raw --tail 500 -f opal_universe'
alias log:universe-setup='docker service logs --raw --tail 500 -f opal_universe-setup'
alias log:universe-storybook='docker service logs --raw --tail 500 -f opal_universe-storybook'
alias log:queue='docker service logs --raw --tail 500 -f opal_queue'
alias log:psql='docker service logs --raw --tail 500 -f opal_pg-master'

# docker service dependencies
alias run:monolith-deps="to:cabochon && yarn docker:rails:exec 'bundle install'"
alias run:universe-deps="to:cabochon && yarn docker:exec opal_universe-shell 'yarn install'"

# get process id for given docker service
alias run:get-monolith-pid='get-container-pid "opal_monolith"'
alias run:get-universe-pid='get-container-pid "opal_universe"'
alias run:get-universe-shell-pid='get-container-pid "opal_universe-shell"'
alias run:get-storybook-pid='get-container-pid "opal_storybook"'

# start sh session inside docker service
alias start:monolith-sh='docker exec -it opal_monolith.1.$(run:get-monolith-pid) sh'
alias start:universe-sh='docker exec -it opal_universe.1.$(run:get-universe-pid) sh'
alias start:universe-shell-sh='docker exec -it opal_universe-shell.1.$(run:get-universe-shell-pid) sh'
alias start:storybook-sh='docker exec -it opal_storybook.1.$(run:get-storybook-pid) sh'

# restart docker-sync service
alias restart:monolith='docker service update opal_monolith --force'
alias restart:universe='docker service update opal_universe --force'
alias restart:queue='docker service update opal_queue --force'

# start/stop local environment
alias start:local='yarn docker:start'
alias stop:local='yarn docker:stop'

# scale optional services
alias start:universe-storybook='docker service scale opal_universe-storybook=1'
alias stop:universe-storybook='docker service scale opal_universe-storybook=0'
alias start:lapidary-storybook='docker service scale opal_lapidary-storybook=1'
alias stop:lapidary-storybook='docker service scale opal_lapidary-storybook=0'

# rails console and debugging commands
alias rails-console='yarn docker:rails:console'
alias start:rails-debug='yarn docker:rails:debug_monolith:start'
alias stop:rails-debug='yarn docker:rails:debug_monolith:stop'

# Git helpers
alias master='git checkout master && git pull'
alias gs='git status'
alias gch='git checkout'
alias fetch='git fetch'
alias gb='git branch'
alias push='git push'
alias pull='git pull'
alias stash='git stash'
alias merge='git merge'
alias apply='git stash apply'
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m '
alias gc='git commit '
alias continue='git rebase --continue'
alias abort='git rebase --abort'
alias skip='git rebase --skip'
alias cleanup='git branch --merged | grep -v "\\*" | xargs -n 1 git branch -d'

# misc
alias grepc='grep --color'

# ngrok
alias ngrok='~/ngrok'
