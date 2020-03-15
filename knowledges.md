# Knowledges
## My way to development
### Common Lisp
Execute in Atom's `slime` or use `sbcl` or `clisp`.
TODO: Detailed way to call our programs.

### Elixir
Use `Mix`.
Without `Mix` (using `elixir` command for a `.exs` file or `elixirc` for `.ex`),
`ide-elixir`, an Atom package, cannot lint. It uses elixir's compiler and
Dialiyzer to lint, but both don't run.

### Golang
Use VSCode.
Atom's `go-plus` package is almost not maintained, and other tools are not
so good. (I want `gopls` to be stable.)

### Haskell
Use haskell-stack.
If using ghc-8 or more than it, use Atom with haskell-ide-engine.
If using ghc-7 or less than it, use VSCode with intero (through Haskero).

NOTE: I'm not tried to use hie for multiple GHC versions.

### JavaScript (Node.js)
*   Linter and Formatter
    *   Project-local
        *   Follow <https://www.npmjs.com/package/eslint-config-prettier-standard>.
        *   Atom's `linter-eslint` package is executed. It does auto-fixing.
        *   Atom's `linter-js-standard` package isn't,
            because "skip if ESLint is installed locally".
    *   Global fallback (when not installed ESLint locally)
        *   Atom's `linter-js-standard` package is executed.
        *   Atom's `linter-eslint` package isn't,
            because "disable when no ESLint config is found".
        *   Fixing can be executed by `eslint --fix` command, because
            `.eslintrc` file should be deployed to home directory and
            necessary ESLint modules should be installed globally
            by `bundle-npm-packages.sh`.

### OCaml
*   Install and manage packages.
    *   Use `OPAM`.
*   Execute
    *   Call by `#use "filename.ml"` in `utop`.
*   Quit `utop`
    *   `exit 0;;`

TODO: Research the best way to build.

### Python
Use `pipenv`.

### Ruby
Use `rbenv`.

#### Init a new project
Follow these steps:

*   `bundle init` and set up `Gemfile`. These gems may be useful:
    *   `rubocop`
    *   `rubocop-performance`
    *   `rubocop-rails`
    *   `rubocop-require_tools` (`rubocop/require_tools` for `require`)
    *   `rubocop-rspec`
    *   `rubocop-thread_safety`
*   `bundle install --path=vendor/bundle`
    *   `.bundle/config` is created, so from the next time
        `--path=vendor/bundle` can be omitted.
*   Create `.rubocop.yml` and set up `require`, where rubocop's plugins should
    be declared.

After `.rubocop.yml` is created, Atom's `linter-rubocop` package does
`bundle exec rubocop` automatically when a ruby file is opened.
If it is done before `bundle install --path=vendor/bundle`,
it may cause some troubles (though it does not do `bundle install`).
e.g. New `Gemfile.lock` is created unexpectedly.

#### Formatting
Run Atom's `Linter Rubocop: Fix File` manually.
(`rubocop-auto-correct` is unhandy because of its slowness.)

### Scala
*   Create a new project.
    1.  `sbt new scala/scala-seed.g8` -> Enter project's name.
        The project folder is created automatically.
    2.  `sbt ensimeConfig`.

*   Edit.
    1.  In Atom, do `Ensime: Start`.
    2.  Execute the program with `sbt run`.

### Scheme
Use `Dr.Racket`?
TODO:
