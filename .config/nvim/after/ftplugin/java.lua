print("java loaded!")
local config = {

  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/lombok.jar"),
    '-jar', '/home/fayeez.ahmed/Downloads/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20240213-1244.jar',
    '-configuration', '/home/fayeez.ahmed/Downloads/jdtls/config_linux',
    '-data', vim.fn.stdpath('cache') .. '/test-jdtls',
    },

  root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew", "pom.xml", "build.gradle"}),

  settings = {
    java = {
            
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
require('jdtls').start_or_attach(config)
