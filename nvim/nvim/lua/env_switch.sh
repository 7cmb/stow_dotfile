#!/bin/bash

# test if in a correct directory
( pwd | grep 'nvim/nvim/lua$' 2>&1 >> /dev/null && echo '[INFO] in a correct directory' ) || (echo '[ERROR] in an uncorrect currently directory' && exec bash -c 'exit' )

# test if there running neovim configurations
[[ -f lazy_conf.lua ]] && [[ -f opt_conf.lua ]] && echo '[INFO] running conf exist' || ( echo '[ERROR] running conf don'"'"'t exist' && exec bash -c 'exit')

# test if there dev neovim configurations
[[ -f dev-lazy_conf.lua ]] && [[ -f dev-opt_conf.lua ]] && echo '[INFO] dev conf exist' || ( echo '[ERROR] dev conf don'"'"'t exist' && exec bash -c 'exit')

# dev env -> prod env OR prod env -> dev env
# you should merge dev and prod env manually ( delete sybolic link and copy dev file to prod file ** in dev env ** )
# there is a bak file if in dev env
[[ -f lazy_conf.lua.bak ]] && [[ -L lazy_conf.lua ]] && rm ./lazy_conf.lua && mv lazy_conf.lua.bak lazy_conf.lua && echo '[MODIFY] lazy_conf switch to "Prod Mode"' || ( mv lazy_conf.lua lazy_conf.lua.bak && ln -s dev-lazy_conf.lua lazy_conf.lua && echo '[MODIFY] lazy_conf switch to "Dev Mode"' ) || echo '[ERROR] lazy_conf nothing to do'
[[ -f opt_conf.lua.bak ]] && [[ -L opt_conf.lua ]] && rm ./opt_conf.lua && mv opt_conf.lua.bak opt_conf.lua && echo '[MODIFY] opt_conf switch to "Prod Mode"' || ( mv opt_conf.lua opt_conf.lua.bak && ln -s dev-opt_conf.lua opt_conf.lua && echo '[MODIFY] opt_conf switch to "Dev Mode"' ) || echo '[ERROR] opt_conf nothing to do'
