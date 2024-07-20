
vim.keymap.set("n", '<leader>pv', vim.cmd.Ex)
vim.keymap.set("n", '<leader>y', '"+yy')

---- Code snippets ----
vim.keymap.set(
    "n",
    "<leader>ps",
    ":call append('.', ['class C():', '    def __init__(self):', '        pass', '', '    def start(self):', '        pass', '', '    def stop(self):', '        pass', '', 'def main():', '    pass', '', 'if __name__ == \"__main__\":', '    try:', '        main()', '    except KeyboardInterupt:', '        print(\"\\n\\n[INFO] System Exit!\")'])<CR>"
)

