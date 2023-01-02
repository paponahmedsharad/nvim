require("fzf-lua").setup {
  previewers = {
    builtin = {
      ueberzug_scaler = "cover",
      extensions = {
        ["gif"] = img_previewer,
        ["png"] = img_previewer,
        ["jpg"] = img_previewer,
        ["jpeg"] = img_previewer,
      },
    },
  },
}
