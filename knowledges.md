# Knowledges
## My way to development
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

### Ruby
Use `rbenv`.

### Common Lisp
Execute in Atom's `slime` or use `sbcl` or `clisp`.
TODO: Detailed way to call our programs.

### Python
Use `pipenv`.

### Scala
*   Create a new project.
    1.  `sbt new scala/scala-seed.g8` -> Enter project's name.
        The project folder is created automatically.
    2.  `sbt ensimeConfig`.

*   Edit.
    1.  In Atom, do `Ensime: Start`.
    2.  Execute the program with `sbt run`.

### OCaml
*   Install and manage packages.
    *   Use `OPAM`.
*   Execute
    *   Call by `#use "filename.ml"` in `utop`.
*   Quit `utop`
    *   `exit 0;;`

TODO: Research the best way to build.

### Haskell
Use haskell-stack.
If using ghc-8 or more than it, use Atom with haskell-ide-engine.
If using ghc-7 or less than it, use VSCode with intero (through Haskero).

NOTE: I'm not tried to use hie for multiple GHC versions.

### Scheme
Use `Dr.Racket`?
TODO:
