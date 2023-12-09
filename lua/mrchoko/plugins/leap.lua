return {
    'ggandor/leap.nvim',
    enabled = true,
    opts = {
        max_phase_one_targets = nil,
        highlight_unlabeled_phase_one_targets = false,
        max_highlighted_traversal_targets = 10,
        case_sensitive = false,
        equivalence_classes = { ' \t\r\n', },
        substitute_chars = {},
        safe_labels =     { "s", "f", "n", "u", "t", "/",
      "S", "F", "N", "L", "H", "M", "U", "G", "T", "?", "Z" },
        labels = {"s", "f", "n",
      "j", "k", "l", "h", "o", "d", "w", "e", "i", "m", "b", "u",
      "y", "v", "r", "g", "t", "a", "q", "p", "c", "x", "z", "/",
      "S", "F", "N",
      "J", "K", "L", "H", "O", "D", "W", "E", "I", "M", "B", "U",
      "Y", "V", "R", "G", "T", "A", "Q", "P", "C", "X", "Z", "?" },
        special_keys = {
            next_target = '<enter>',
            prev_target = '<tab>',
            next_group = '<space>',
            prev_group = '<tab>',
            multi_accept = '<enter>',
            multi_revert = '<backspace>',
        }
    }
}
