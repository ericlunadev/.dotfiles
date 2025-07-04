-- Disable unused language providers to suppress health check warnings
-- These providers are not commonly used and can be safely disabled

-- Disable Ruby provider
vim.g.loaded_ruby_provider = 0

-- Disable Perl provider
vim.g.loaded_perl_provider = 0

-- Note: Python and Node providers are kept enabled as they are more commonly used
-- for various plugins and features