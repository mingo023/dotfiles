return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    config = function()
      -- set strategy
      vim.g["test#strategy"] = "vimux"

      -- set options for jest
      vim.g["test#javascript#jest#options"] = " --config jest.config.json"

      -- set options for phpunit
      vim.g["test#php#phpunit#executable"] = "docker-compose exec -it php php artisan test"
    end,
  },
}
