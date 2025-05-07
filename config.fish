\if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /usr/local/bin

# function nvm
#     bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
# end


set -gx GPG_TTY (tty)

## npm
alias i "npm install"
alias d "npm run dev"
alias t "npm run test"
alias sto "npm run storybook"
alias r "npm run"
alias sd "npm run start:dev"
alias asd "npm run api:start:dev"

## git
alias gp "git push"
alias gc "git commit"
alias ga "git add"
alias gaa "git add -A"
alias gaac "git add -A && git commit -m"
alias gpl "git pull"
alias gout "git checkout"
alias gpp "git pull && git push"


## pnpm
# alias p "pnpm"
# alias sto "pnpm storybook"
# alias d "pnpm run dev"
# alias px "pnpm dlx"
# alias b "pnpm run build"

## misc
alias remove "rm -rf"

## fish
alias conf "code ~/.config/fish/config.fish"

## prisma
alias studio "pnpm prisma studio"
alias gen "pnpm prisma generate"
alias dbp "pnpm prisma db push"

## pnpm
set -gx PNPM_HOME "/Users/arnaud/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

## python
alias py "python3"

## zed
alias zed "open -a /Applications/Zed.app -n"

## open mert config
alias mertconfig "code ~/.mertrc"

## pnpm
alias p "pnpm"

alias fastdb "./scripts/fastdb.sh"

alias hades-cron 'env TYPEORM_ENTITIES="dist-cron/**/**.entity.js" TYPEORM_MIGRATIONS="dist-cron/migrations/*.js" npm run cron:start:dev --'
alias hades-consumer 'env TYPEORM_ENTITIES="dist-consumer/**/**.entity.js" TYPEORM_MIGRATIONS="dist-consumer/migrations/*.js" npm run consumer:start:dev --'
alias kubprod 'kubectl config use-context admin@talentpicker-production'
alias kubstaging 'kubectl config use-context admin@talentpicker-staging'

## cursor
alias cursor 'open -a "/Applications/Cursor.app"'