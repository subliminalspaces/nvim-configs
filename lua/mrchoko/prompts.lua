require('gen').prompts['Commit_Message'] = {
    prompt = 'Write a short commit message according to the Conventional Commits specification for the following git diff: \n' .. vim.fn.system{'git', 'diff', '--staged'} .. '\n',
    replace = false
}
