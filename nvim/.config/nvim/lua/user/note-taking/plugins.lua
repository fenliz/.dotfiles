return function(use)
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require'orgmode'.setup {
                org_agenda_files = { '~/org/*' },
                org_default_notes_file = '~/org/notes.org'
            }
        end
    }
end
