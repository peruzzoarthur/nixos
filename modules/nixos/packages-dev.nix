{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Development tools
    postman
    burpsuite
    dbeaver-bin
    lua
    openssl
    zig
    gcc
    gnumake
    nodejs_22
    go
    cargo
    bun
    ruby
    rubyPackages.rails
    yarn
    rbenv
    fnm
    nest-cli
    pnpm
    bruno
    bruno-cli
    awscli
    sonar-scanner-cli
    tuxedo
    concurrently
    libyaml

    # Databases & containers
    postgresql_17
    sqlite
    docker-compose
    docker-buildx
    lazydocker
    redis

    # Language servers
    vscode-langservers-extracted
    vtsls
    typescript-language-server
    tailwindcss-language-server
    bash-language-server
    yaml-language-server
    lua-language-server
    nil
    gopls
    prisma-language-server
    graphql-language-service-cli
    gh-actions-language-server

    # Formatters
    biome
    prettier
    alejandra
    stylua

    # Testing & browsers
    chromedriver
    playwright
    playwright-test
    playwright-mcp
    playwright-driver

    # Utilities
    graphviz
    mermaid-cli
    gdal
  ];
}
