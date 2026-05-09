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
    yarn
    rbenv
    fnm
    nest-cli
    pnpm
    bruno
    bruno-cli
    awscli
    sonar-scanner-cli

    # Databases & containers
    postgresql_16
    sqlite
    docker-compose
    docker-buildx
    lazydocker

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
    gh-actions-language-server

    # Formatters
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
