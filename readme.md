# dotfiles

This repo contains my configuration that I want to persist between
computers. The general pattern for linking these is that
for every top-level file/directory, prepend a `.` to the beginning of
its name and link it to the home directory:

`ln -s <pwd>/<file> ~/.<file>`

A TODO would be to write a script that will do this automatically.
