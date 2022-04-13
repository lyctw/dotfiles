## Open vsp, tabs on starup

`vim file1 +'vsplit file2' +'tabedit file1' +'vsplit file3'`
or
`vim file1 +'vs file2|tabe file1|vs file3'`

## Open modified files in a git repo

`vim -p $(git status --porcelain | awk '{print $2}')`
